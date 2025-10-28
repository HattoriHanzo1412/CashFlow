package com.example.databank.data.local

import androidx.room.Dao
import androidx.room.Insert
import androidx.room.OnConflictStrategy
import androidx.room.Query
import kotlinx.coroutines.flow.Flow

@Dao
interface CountryDao {
    @Query("SELECT * FROM countries ORDER BY name")
    fun getAll(): Flow<List<CountryEntity>>

    @Insert(onConflict = OnConflictStrategy.REPLACE)
    suspend fun upsertAll(items: List<CountryEntity>)

    @Query("DELETE FROM countries")
    suspend fun clear()
}

@Dao
interface IndicatorDao {
    @Query("SELECT * FROM indicators ORDER BY name")
    fun getAll(): Flow<List<IndicatorEntity>>

    @Insert(onConflict = OnConflictStrategy.REPLACE)
    suspend fun upsertAll(items: List<IndicatorEntity>)

    @Query("DELETE FROM indicators")
    suspend fun clear()
}

@Dao
interface ValueDao {
    @Query(
        "SELECT * FROM wb_values WHERE countryId = :country AND indicatorId = :indicator ORDER BY date DESC"
    )
    fun getValues(country: String, indicator: String): Flow<List<ValueEntity>>

    @Insert(onConflict = OnConflictStrategy.REPLACE)
    suspend fun upsertAll(items: List<ValueEntity>)

    @Query("DELETE FROM wb_values WHERE countryId = :country AND indicatorId = :indicator")
    suspend fun clear(country: String, indicator: String)
}
