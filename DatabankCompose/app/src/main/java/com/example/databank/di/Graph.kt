package com.example.databank.di

import android.content.Context
import androidx.room.Room
import com.example.databank.data.WorldBankRepository
import com.example.databank.data.local.WorldBankDatabase
import com.example.databank.data.network.WorldBankApi

object Graph {
    private lateinit var database: WorldBankDatabase
    private val api: WorldBankApi by lazy { WorldBankApi.create() }

    val repository: WorldBankRepository by lazy {
        check(::database.isInitialized) { "Graph.init(context) must be called first" }
        WorldBankRepository(api, database)
    }

    fun init(context: Context) {
        if (!::database.isInitialized) {
            database = Room.databaseBuilder(
                context.applicationContext,
                WorldBankDatabase::class.java,
                "worldbank.db"
            ).fallbackToDestructiveMigration().build()
        }
    }
}
