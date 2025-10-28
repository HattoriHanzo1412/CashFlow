package com.example.databank.ui

import androidx.compose.material3.Text
import androidx.compose.runtime.Composable
import androidx.navigation.NavHostController
import androidx.navigation.compose.NavHost
import androidx.navigation.compose.composable
import androidx.navigation.compose.rememberNavController
import com.example.databank.ui.screens.CountriesScreen
import com.example.databank.ui.screens.IndicatorsScreen
import com.example.databank.ui.screens.ValuesScreen

object Routes {
    const val Countries = "countries"
    const val Indicators = "indicators/{country}" // arg: country id (e.g. USA)
    const val Values = "values/{country}/{indicator}" // args
}

@Composable
fun AppNavHost(navController: NavHostController = rememberNavController()) {
    NavHost(navController = navController, startDestination = Routes.Countries) {
        composable(Routes.Countries) {
            CountriesScreen(onOpenCountry = { countryId ->
                navController.navigate("indicators/$countryId")
            })
        }
        composable("indicators/{country}") { backStackEntry ->
            val country = backStackEntry.arguments?.getString("country") ?: return@composable
            IndicatorsScreen(countryCode = country, onOpenIndicator = { indicatorId ->
                navController.navigate("values/$country/$indicatorId")
            })
        }
        composable("values/{country}/{indicator}") { backStackEntry ->
            val country = backStackEntry.arguments?.getString("country") ?: return@composable
            val indicator = backStackEntry.arguments?.getString("indicator") ?: return@composable
            ValuesScreen(countryCode = country, indicatorId = indicator)
        }
    }
}
