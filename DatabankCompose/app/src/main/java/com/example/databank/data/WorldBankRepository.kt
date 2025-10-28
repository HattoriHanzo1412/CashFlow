package com.example.databank.data

import com.example.databank.data.local.CountryDao
import com.example.databank.data.local.CountryEntity
import com.example.databank.data.local.IndicatorDao
import com.example.databank.data.local.IndicatorEntity
import com.example.databank.data.local.ValueDao
import com.example.databank.data.local.ValueEntity
import com.example.databank.data.local.WorldBankDatabase
import com.example.databank.data.model.Country
import com.example.databank.data.model.Indicator
import com.example.databank.data.model.Value
import com.example.databank.data.network.WorldBankApi
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.flow.Flow
import kotlinx.coroutines.flow.map
import kotlinx.coroutines.withContext

class WorldBankRepository(
    private val api: WorldBankApi,
    database: WorldBankDatabase
) {
    private val countryDao: CountryDao = database.countryDao()
    private val indicatorDao: IndicatorDao = database.indicatorDao()
    private val valueDao: ValueDao = database.valueDao()

    // API returns a 2-element top array: [metadata, data[]]
    @Suppress("UNCHECKED_CAST")
    private fun <T> unwrap(list: List<Any>): Pair<Map<String, Any?>, List<T>> {
        val info = list.getOrNull(0) as? Map<String, Any?> ?: emptyMap()
        val data = list.getOrNull(1) as? List<T> ?: emptyList()
        return info to data
    }

    fun observeCountries(): Flow<List<Country>> = countryDao.getAll().map { list ->
        list.map { Country(it.id, it.iso2Code, it.name) }
    }

    suspend fun refreshCountries() = withContext(Dispatchers.IO) {
        val (_, raw) = unwrap<Map<String, Any?>>(api.getCountries())
        val entities = raw.mapNotNull { obj ->
            obj as? Map<*, *> ?: return@mapNotNull null
            val id = obj["id"] as? String ?: return@mapNotNull null
            val iso2 = obj["iso2Code"] as? String ?: id
            val name = obj["name"] as? String ?: id
            CountryEntity(id = id, iso2Code = iso2, name = name)
        }
        countryDao.upsertAll(entities)
    }

    fun observeIndicators(): Flow<List<Indicator>> = indicatorDao.getAll().map { list ->
        list.map { Indicator(it.id, it.name) }
    }

    suspend fun refreshIndicators() = withContext(Dispatchers.IO) {
        val (_, raw) = unwrap<Map<String, Any?>>(api.getIndicators())
        val entities = raw.mapNotNull { obj ->
            obj as? Map<*, *> ?: return@mapNotNull null
            val id = obj["id"] as? String ?: return@mapNotNull null
            val name = obj["name"] as? String ?: id
            IndicatorEntity(id = id, name = name)
        }
        indicatorDao.upsertAll(entities)
    }

    fun observeValues(country: String, indicator: String): Flow<List<Value>> =
        valueDao.getValues(country, indicator).map { list ->
            list.map { it.toModel() }
        }

    suspend fun refreshValues(country: String, indicator: String, date: String? = null) = withContext(Dispatchers.IO) {
        val (_, raw) = unwrap<Map<String, Any?>>(api.getValues(country, indicator, date = date))
        val entities = raw.mapNotNull { obj ->
            obj as? Map<*, *> ?: return@mapNotNull null
            val indicatorMap = obj["indicator"] as? Map<*, *> ?: return@mapNotNull null
            val countryMap = obj["country"] as? Map<*, *> ?: return@mapNotNull null
            val indicatorId = indicatorMap["id"] as? String ?: indicator
            val indicatorName = indicatorMap["value"] as? String ?: indicatorId
            val countryId = countryMap["id"] as? String ?: country
            val countryName = countryMap["value"] as? String ?: countryId
            ValueEntity(
                countryId = countryId,
                countryName = countryName,
                indicatorId = indicatorId,
                indicatorName = indicatorName,
                date = obj["date"] as? String ?: "",
                value = when (val v = obj["value"]) {
                    is Number -> v.toDouble()
                    is String -> v.toDoubleOrNull()
                    else -> null
                }
            )
        }
        valueDao.upsertAll(entities)
    }
}

private fun ValueEntity.toModel(): Value = Value(
    indicator = Indicator(indicatorId, indicatorName),
    country = Country(countryId, "", countryName),
    countryiso3code = null,
    date = date,
    value = value
)
