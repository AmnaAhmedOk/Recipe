//
//  RecipeInteractor.swift
//  Recipes
//
//  Created by Amna on 16/06/2021.
//

import Foundation
class RecipeInteractor: RecipeInteractorInputProtocol{
  
    
   weak var interactor: RecipeInteractorOutputProtocol?
    
    private let worker = RecipeWorker()
    
    private let localWorker = LocalRecipeWorker()

    func getRecipe(q:String,health:[String] = []) {
        worker.getRecipes(q:q,health: health) { [weak self] result in
            guard let self = self else{return}
            switch result{
            case.success(let data):
                self.interactor?.recipeFetchSucess(recipe: data!.hits)
            case.failure(let error):
                self.interactor?.recipeFetchFaild(withError: error)
            }
            
        }
    }
    
    func saveLatestSearchWord (_ searchText: String) {
        localWorker.saveLatestSearchWord(searchText:searchText)
    }
    
    func getLatestSearchWord() -> [String] {
        return localWorker.getLatestSearchWord()
    }
    
    func getLastSearchWord() -> String {
        return localWorker.getLastSearchWord();

    }
    
}
