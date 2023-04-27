//
//  Protocol.swift
//  MoviesApp
//
//  Created by Vinayak T on 26/04/23.
//

import Foundation
import UIKit

protocol MoviesDataDelegate{
    func getMoviewData(result: Bool, movies: MoviesModel?)
}

protocol CheckBoxDelegate{
    func didClickCheckBox(sender: UIButton)
}


