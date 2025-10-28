package com.example.databank.data.network

import okhttp3.OkHttpClient
import okhttp3.logging.HttpLoggingInterceptor
import retrofit2.Retrofit
import retrofit2.converter.gson.GsonConverterFactory
import retrofit2.http.GET
import retrofit2.http.Path
import retrofit2.http.Query

// World Bank (DataBank/Indicator) API
// Base: https://api.worldbank.org/v2/

interface WorldBankApi {
    // Countries list: /v2/country?format=json&per_page=300
    @GET("country?format=json")
    suspend fun getCountries(
        @Query("page") page: Int = 1,
        @Query("per_page") perPage: Int = 300
    ): List<Any>

    // Indicators catalog: /v2/indicator?format=json&per_page=300
    @GET("indicator?format=json")
    suspend fun getIndicators(
        @Query("page") page: Int = 1,
        @Query("per_page") perPage: Int = 300
    ): List<Any>

    // Values: /v2/country/{country}/indicator/{indicator}?format=json&date=2010:2022
    @GET("country/{country}/indicator/{indicator}?format=json")
    suspend fun getValues(
        @Path("country") country: String,
        @Path("indicator") indicator: String,
        @Query("page") page: Int = 1,
        @Query("per_page") perPage: Int = 100,
        @Query("date") date: String? = null
    ): List<Any>

    companion object {
        fun create(): WorldBankApi {
            val logging = HttpLoggingInterceptor().apply {
                level = HttpLoggingInterceptor.Level.BASIC
            }
            val client = OkHttpClient.Builder()
                .addInterceptor(logging)
                .build()

            val retrofit = Retrofit.Builder()
                .baseUrl("https://api.worldbank.org/v2/")
                .addConverterFactory(GsonConverterFactory.create())
                .client(client)
                .build()
            return retrofit.create(WorldBankApi::class.java)
        }
    }
}
