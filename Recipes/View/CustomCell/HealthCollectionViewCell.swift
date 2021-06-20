//
//  HealthCollectionViewCell.swift
//  Recipes
//
//  Created by Amna on 17/06/2021.
//

import UIKit

class HealthCollectionViewCell: UICollectionViewCell,HealthCellViewProtocol {
    @IBOutlet weak var healthLabel: UILabel!
    
    func config(_ health: String) {
        self.layer.cornerRadius = 10
        self.layer.borderWidth = 1
        self.healthLabel.textColor = .orange
        healthLabel?.text = health
    }
}
