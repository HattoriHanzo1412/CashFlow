package com.example.databank

import android.app.Application
import com.example.databank.di.Graph

class DatabankApp : Application() {
    override fun onCreate() {
        super.onCreate()
        Graph.init(this)
    }
}
