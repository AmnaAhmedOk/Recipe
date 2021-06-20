//
//  RecipeWorker.swift
//  Recipes
//
//  Created by Amna on 16/06/2021.
//

import Foundation
// for any operation (get delete update ...)
class RecipeWorker{
    private let networkLayer = NetworkLayer()
    
    func getRecipes(q: String,health: [String]=[],completionHandler:@escaping (Result<RecipesModel?,NSError>)->()){
        networkLayer.fetchData(params:["health" :health],url: "https://api.edamam.com/search?q=\(q)&app_id=\(APP_ID)&app_key=\(APP_key)", responseClass: RecipesModel.self,completion: completionHandler)
    }
    
 
    
    
}
