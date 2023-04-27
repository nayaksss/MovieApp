//
//  UIViewControllerExtension.swift
//  MoviesApp
//
//  Created by Vinayak T on 26/04/23.
//

import Foundation
import UIKit

extension UIViewController{
    
    func showAlert(message: String, actiontitle:String? = "OK", okHandler: ((UIAlertAction) -> Void)? = nil){
        let alert = UIAlertController(title: "", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: actiontitle, style: .default, handler: okHandler))
        self.present(alert, animated: true)
    }
    
    
}
