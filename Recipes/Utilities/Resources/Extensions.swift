//
//  Extensions.swift
//  Recipes
//
//  Created by Amna on 18/06/2021.
//

import UIKit
extension String {
    var isAlphanumeric: Bool {
            return !isEmpty && range(of: "^[a-zA-Z]*$", options: .regularExpression) != nil
        }
}


extension UIViewController {
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }

    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
    func createAlert(message: String, title: String){

        let alert =  UIAlertController.init(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        self.present(alert, animated:true)
    }
    
}
