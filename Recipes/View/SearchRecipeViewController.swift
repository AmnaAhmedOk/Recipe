//
//  ViewController.swift
//  Recipes
//
//  Created by Amna on 18/06/2021.
//

import UIKit
import MBProgressHUD

class ViewController: UIViewController {
    
    var presenter: RecipePresenterProtocol?
    var searchWord = ""

    @IBOutlet weak var searchBar: UISearchBar!{
        didSet{
            searchBar.delegate = self
        }
    }
    
    @IBOutlet weak var healthCollectionView: UICollectionView!{
        didSet{
            healthCollectionView.dataSource = self
            healthCollectionView.delegate = self
            
        }
    }

   
    @IBOutlet weak var recipeTableView: UITableView!{
        didSet{
            recipeTableView.dataSource = self
            recipeTableView.delegate = self
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.prefersLargeTitles = true
        self.navigationItem.title = APP_NAME
    }
  
}

//MARK:- RecipeProtocol implementation

extension ViewController: RecipeViewProtocol{
    func showLoadIndicator() {
        MBProgressHUD.showAdded(to: self.view, animated: true)
    }
    
    func hideLoadIndicator() {
        MBProgressHUD.hide(for: self.view, animated: true)
    }
    
    func reloadDate() {
        recipeTableView.reloadData();
    }
}

//MARK:- TableView
extension ViewController:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
        
    func numberOfSections(in tableView: UITableView) -> Int {
           return presenter?.numberOFRows ?? 0
       }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: RECIPE_CELL, for: indexPath) as! RecipeTableViewCell
        presenter?.config(cell: cell, index: indexPath)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter?.navigateToDetails(index: indexPath)
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
           return 10
       }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
            let headerView = UIView()
            headerView.backgroundColor = UIColor.clear
            return headerView
        }

    
}
//MARK:- collectionView

extension ViewController : UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return presenter?.numberOfHealth ?? 0        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HEALTH_CELL, for: indexPath) as! HealthCollectionViewCell
        presenter?.config(healthCell:cell,index:indexPath)
        return cell
        
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize
       {
        return CGSize(width: 100.0, height: 50.0)
       }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath) as? HealthCollectionViewCell
        cell?.layer.borderWidth = 1
        cell?.healthLabel.textColor = .black
        cell?.isSelected = true
        if searchWord != ""{
            self.presenter?.loadData(q: searchWord,health: [healthKey[indexPath.row]])
            print(healthKey[indexPath.row])
        }
        else{
            createAlert(message: "No recipe to filter", title: "Warning")
            
        }
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath) as? HealthCollectionViewCell
        cell?.layer.borderWidth = 0
        cell?.healthLabel.textColor = .white
        cell?.isSelected = false
       
    }
    
    
}

//MARK:-search
extension ViewController:UISearchBarDelegate {
   
  
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let searchText = searchBar.text else {
            return
        }
        searchWord = searchText
        presenter?.saveLatestSearchWord(searchText)
        presenter?.loadData(q: searchText)
       }
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.text = ""
    }
    func searchBar(_ searchBar: UISearchBar, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        return text.isAlphanumeric ? true:false

    }
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        self.becomeFirstResponder()
    }
    
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        self.resignFirstResponder()

    }
}


