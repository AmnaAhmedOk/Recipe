//
//  RecipeTableViewCell.swift
//  Recipes
//
//  Created by Amna on 14/06/2021.
//

import UIKit
import SDWebImage

class RecipeTableViewCell: UITableViewCell, RecipeCellViewProtocol {
    

    @IBOutlet weak var recipeHealth: UILabel!
    @IBOutlet weak var recipeSource: UILabel!
    @IBOutlet weak var recipeTitle: UILabel!
    @IBOutlet weak var recipeImage: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
    }

    func config(_ recipe: Recipe){
             
        recipeTitle.text = recipe.label
        recipeSource.text = "Source: \(recipe.source)"
        recipeHealth.text = recipe.healthLabels.joined(separator: " - ")
        
        if #available(iOS 13.0, *) {
            recipeImage.sd_setImage(with: URL(string: recipe.image), placeholderImage: UIImage(systemName: "tortoise"))
        } else {
            // Fallback on earlier versions
        }
        
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
