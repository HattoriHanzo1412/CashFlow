package com.example.databank.ui.screens

import androidx.compose.foundation.layout.*
import androidx.compose.foundation.lazy.LazyColumn
import androidx.compose.foundation.lazy.items
import androidx.compose.material3.*
import androidx.compose.runtime.*
import androidx.compose.ui.Modifier
import androidx.compose.ui.unit.dp
import com.example.databank.data.WorldBankRepository
import com.example.databank.di.Graph
import com.example.databank.data.model.Indicator
import com.example.databank.data.model.Value
import com.example.databank.data.network.WorldBankApi
import kotlinx.coroutines.launch

@Composable
fun CountriesScreen(onOpenCountry: (String) -> Unit) {
    val repo = remember { Graph.repository }
    val countries by repo.observeCountries().collectAsState(initial = emptyList())
    var loading by remember { mutableStateOf(false) }
    var error by remember { mutableStateOf<String?>(null) }
    val scope = rememberCoroutineScope()

    LaunchedEffect(Unit) {
        loading = true
        error = null
        runCatching { repo.refreshCountries() }
            .onFailure { error = it.message }
        loading = false
    }

    Column(Modifier.fillMaxSize().padding(16.dp)) {
        Text("Страны", style = MaterialTheme.typography.titleLarge)
        if (loading) LinearProgressIndicator(Modifier.fillMaxWidth().padding(top = 8.dp))
        if (error != null) Text("Ошибка: ${'$'}error", color = MaterialTheme.colorScheme.error)
        Spacer(Modifier.height(8.dp))
        LazyColumn(Modifier.fillMaxSize()) {
            items(countries) { c ->
                ElevatedCard(onClick = { onOpenCountry(c.id) }, modifier = Modifier.fillMaxWidth().padding(vertical = 4.dp)) {
                    ListItem(headlineContent = { Text(c.name) }, supportingContent = { Text(c.id) })
                }
            }
        }
    }
}

@Composable
fun IndicatorsScreen(countryCode: String, onOpenIndicator: (String) -> Unit) {
    val repo = remember { Graph.repository }
    val indicators by repo.observeIndicators().collectAsState(initial = emptyList())
    var query by remember { mutableStateOf("") }
    var loading by remember { mutableStateOf(false) }
    var error by remember { mutableStateOf<String?>(null) }

    LaunchedEffect(Unit) {
        loading = true
        error = null
        runCatching { repo.refreshIndicators() }
            .onFailure { error = it.message }
        loading = false
    }

    Column(Modifier.fillMaxSize().padding(16.dp)) {
        Text("Индикаторы для ${'$'}countryCode", style = MaterialTheme.typography.titleLarge)
        OutlinedTextField(value = query, onValueChange = { query = it }, modifier = Modifier.fillMaxWidth(), label = { Text("Поиск индикаторов") })
        if (loading) LinearProgressIndicator(Modifier.fillMaxWidth().padding(top = 8.dp))
        if (error != null) Text("Ошибка: ${'$'}error", color = MaterialTheme.colorScheme.error)
        Spacer(Modifier.height(8.dp))
        val filtered = remember(indicators, query) { indicators.filter { it.name.contains(query, ignoreCase = true) || it.id.contains(query, ignoreCase = true) } }
        LazyColumn(Modifier.fillMaxSize()) {
            items(filtered) { ind ->
                ElevatedCard(onClick = { onOpenIndicator(ind.id) }, modifier = Modifier.fillMaxWidth().padding(vertical = 4.dp)) {
                    ListItem(headlineContent = { Text(ind.name) }, supportingContent = { Text(ind.id) })
                }
            }
        }
    }
}

@Composable
fun ValuesScreen(countryCode: String, indicatorId: String) {
    val repo = remember { Graph.repository }
    val values by repo.observeValues(countryCode, indicatorId).collectAsState(initial = emptyList())
    var loading by remember { mutableStateOf(false) }
    var error by remember { mutableStateOf<String?>(null) }
    var dateRange by remember { mutableStateOf("2010:2022") }
    val scope = rememberCoroutineScope()

    LaunchedEffect(countryCode, indicatorId, dateRange) {
        loading = true
        error = null
        runCatching { repo.refreshValues(countryCode, indicatorId, dateRange) }
            .onFailure { error = it.message }
        loading = false
    }

    Column(Modifier.fillMaxSize().padding(16.dp)) {
        Text("${'$'}indicatorId для ${'$'}countryCode", style = MaterialTheme.typography.titleLarge)
        OutlinedTextField(value = dateRange, onValueChange = { dateRange = it }, label = { Text("Годы, напр. 2000:2023") }, modifier = Modifier.fillMaxWidth())
        if (loading) LinearProgressIndicator(Modifier.fillMaxWidth().padding(top = 8.dp))
        if (error != null) Text("Ошибка: ${'$'}error", color = MaterialTheme.colorScheme.error)
        Spacer(Modifier.height(8.dp))
        LazyColumn(Modifier.fillMaxSize()) {
            items(values) { v ->
                ListItem(
                    headlineContent = { Text(v.date) },
                    supportingContent = { Text(v.value?.toString() ?: "нет данных") }
                )
                Divider()
            }
        }
    }
}
