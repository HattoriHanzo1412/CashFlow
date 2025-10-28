package com.example.databank.data.local

import androidx.room.Database
import androidx.room.RoomDatabase

@Database(
    entities = [CountryEntity::class, IndicatorEntity::class, ValueEntity::class],
    version = 1,
    exportSchema = false
)
abstract class WorldBankDatabase : RoomDatabase() {
    abstract fun countryDao(): CountryDao
    abstract fun indicatorDao(): IndicatorDao
    abstract fun valueDao(): ValueDao
}
