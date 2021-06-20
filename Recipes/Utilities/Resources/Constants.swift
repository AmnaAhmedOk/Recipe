//
//  Constants.swift
//  Recipes
//
//  Created by Amna on 17/06/2021.
//

import Foundation

     var APP_ID  = "12f0adf7"
     var APP_key = "bbc566edd7d5d24c74d350211c3f7751"
     let LATEST_SEARCH_KEY = "latestSearchWords"
     let APP_NAME = "Recipe"
     let RECIPE_CELL = "RecipeCell"
     let HEALTH_CELL = "HealthCell"
     let health = ["All","Low Sugar", "Keto" , "Vegan"];
     let healthKey = ["","low-sugar","keto-friendly","vegan"]


enum Health: String {
       case No_sugar  = "low-sugar"
       case Keto      = "keto-friendly"
       case Vegan     = "vegan"
  
}

