//
//  RecipeProtocol.swift
//  Recipes
//
//  Created by Amna on 16/06/2021.
//

import Foundation
protocol RecipeViewProtocol: class{
    //weak to avoid retain cycle
    var presenter: RecipePresenterProtocol?{get set}
    func showLoadIndicator();
    func hideLoadIndicator();
    func reloadDate()
}

protocol RecipeViewDetailsProtocol: class{
    //weak to avoid retain cycle
    var presenter: RecipePresenterProtocol?{get set}
 
}


protocol RecipePresenterProtocol: class{
    //weak to avoid retain cycle
    var view: RecipeViewProtocol?{get set}
    var numberOFRows: Int {get}
    var numberOfHealth: Int {get}
    func loadData(q:String,health:[String])
    func config(cell: RecipeTableViewCell, index: IndexPath)
    func config(healthCell: HealthCollectionViewCell, index: IndexPath)
    func navigateToDetails(index: IndexPath)
    func saveLatestSearchWord(_ searchText:String)
    func getLatestSearchWord() ->  [String]
    func getLastSearchWord()->String
}
extension RecipePresenterProtocol{
    func loadData(q:String,health:[String]=[]){
        loadData(q: q, health: health)
    }

}

protocol RecipeRouterProtocol{
   func goToDetails(recipe: Recipe)
}

protocol RecipeInteractorInputProtocol{
    var interactor: RecipeInteractorOutputProtocol?{get set}
    func getRecipe(q:String,health:[String]);
    func saveLatestSearchWord(_ searchText:String)
    func getLatestSearchWord() ->  [String]
    func getLastSearchWord()->String
}

protocol RecipeInteractorOutputProtocol: class{
    func recipeFetchSucess(recipe: [Hit])
    func recipeFetchFaild(withError error: Error)

}

protocol RecipeCellViewProtocol {
    func config(_ recipe: Recipe);
}

protocol HealthCellViewProtocol {
    func config(_ health: String);
}
