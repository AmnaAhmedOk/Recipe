//
//  RecipeRouter.swift
//  Recipes
//
//  Created by Amna on 16/06/2021.
//

import UIKit
class RecipeRouter: RecipeRouterProtocol{
    
    weak var viewController: UIViewController?

    func goToDetails(recipe: Recipe) {
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        let newViewController = storyBoard.instantiateViewController(withIdentifier: "DetailsRecipeViewController") as! DetailsRecipeViewController
        newViewController.recipe = recipe
        viewController?.navigationController?.pushViewController(newViewController, animated: true)
    }
    
 
    static func createModule()-> UIViewController{
        let view = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "\(SearchRecipeViewController.self)") as! ViewController
        let interactor = RecipeInteractor()
        let router =  RecipeRouter()
        let presenter =  RecipePresenter(view: view, interator: interactor, router: router)
        view.presenter = presenter
        interactor.interactor=presenter
        router.viewController = view
        return view
    }
}
