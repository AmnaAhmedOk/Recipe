//
//  DetailsRecipeViewController.swift
//  Recipes
//
//  Created by Amna on 18/06/2021.
//

import UIKit
import SDWebImage
import SafariServices

class DetailsRecipeViewController: UIViewController ,SFSafariViewControllerDelegate{

   
    @IBOutlet weak var recipeImage: UIImageView!
    @IBOutlet weak var ingredientTableView: UITableView!{
        didSet{
            ingredientTableView.dataSource = self
            ingredientTableView.delegate = self
        }
    }
    var recipe: Recipe?

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.title=recipe?.label
        recipeImage.sd_setImage(with: URL(string: recipe!.image))


    }
   
    @IBAction func goToRecipeWebsite(_ sender: UIButton) {
        if let url = URL(string: recipe?.url ?? "") {
            let vc = SFSafariViewController(url: url)
            vc.delegate = self

            present(vc, animated: true)
      }
    }
    func safariViewControllerDidFinish(_ controller: SFSafariViewController) {
        dismiss(animated: true)
    }

}
//MARK:- TableView
extension DetailsRecipeViewController:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return recipe?.ingredientLines.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ingredients", for: indexPath)
        cell.textLabel?.text = recipe?.ingredientLines[indexPath.row]
        cell.textLabel?.numberOfLines = 0
        return cell
    }
    private func presentShareSheet(){
        guard let url = recipe?.url else {
            return
        }
        
        let shareSheetVC = UIActivityViewController(activityItems: [url], applicationActivities: nil)
        present(shareSheetVC, animated: true)
    }
    
    
    
}
