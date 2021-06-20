//
//  RecipePresenter.swift
//  Recipes
//
//  Created by Amna on 16/06/2021.
//

import Foundation

class RecipePresenter: RecipePresenterProtocol,RecipeInteractorOutputProtocol{
    
   weak var view: RecipeViewProtocol?
   
    var numberOfHealth: Int = health.count

    
    private let interator: RecipeInteractorInputProtocol
    private let router: RecipeRouterProtocol
    
    private var hits = [Hit]()
    var numberOFRows: Int{
        return hits.count
    }

    init(view: RecipeViewProtocol, interator: RecipeInteractorInputProtocol, router:RecipeRouterProtocol ) {
        self.view = view
        self.router = router
        self.interator = interator
    }
     
    func loadData(q:String,health:[String]=[]) {
        view?.hideLoadIndicator();
        view?.showLoadIndicator();
        interator.getRecipe(q:q,health:health)
    }

    func recipeFetchSucess(recipe: [Hit]) {
        hits = []
        view?.hideLoadIndicator();
        hits.append(contentsOf: recipe)
        view?.reloadDate()
    }
    
    func recipeFetchFaild(withError error: Error) {
        view?.hideLoadIndicator();

    }
    
    func config(cell: RecipeTableViewCell, index: IndexPath) {
        cell.config(hits[index.section].recipe)
    }
    
    func config(healthCell: HealthCollectionViewCell, index: IndexPath) {
        healthCell.config(health[index.row])
    }
    
    func navigateToDetails(index: IndexPath) {
        router.goToDetails(recipe: hits[index.section].recipe)
    }
    
    func saveLatestSearchWord (_ searchText: String) {
        interator.saveLatestSearchWord(searchText)
    }
    
    func getLatestSearchWord() -> [String] {
        return interator.getLatestSearchWord()
    }

    func getLastSearchWord() -> String {
        return interator.getLastSearchWord();

    }
    
}
