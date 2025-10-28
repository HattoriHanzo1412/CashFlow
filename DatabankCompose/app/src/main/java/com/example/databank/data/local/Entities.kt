package com.example.databank.data.local

import androidx.room.Entity
import androidx.room.PrimaryKey

@Entity(tableName = "countries")
data class CountryEntity(
    @PrimaryKey val id: String,
    val iso2Code: String,
    val name: String
)

@Entity(tableName = "indicators")
data class IndicatorEntity(
    @PrimaryKey val id: String,
    val name: String
)

// Avoid reserved keyword table name "values"
@Entity(
    tableName = "wb_values",
    primaryKeys = ["countryId", "indicatorId", "date"]
)
data class ValueEntity(
    val countryId: String,
    val countryName: String,
    val indicatorId: String,
    val indicatorName: String,
    val date: String,
    val value: Double?
)
