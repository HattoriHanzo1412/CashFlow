package com.example.databank.data.model

// Data models aligned to World Bank API shapes

data class Paging(
    val page: Int,
    val pages: Int,
    val per_page: String,
    val total: Int
)

data class Country(
    val id: String,
    val iso2Code: String,
    val name: String
)

data class Indicator(
    val id: String,
    val name: String
)

data class Value(
    val indicator: Indicator,
    val country: Country,
    val countryiso3code: String?,
    val date: String,
    val value: Double?
)
