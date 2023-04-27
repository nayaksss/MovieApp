//
//  DialogueViewController.swift
//  MoviesApp
//
//  Created by Vinayak T on 26/04/23.
//

import UIKit

class DialogueViewController: UIViewController {

    //MARK: Outlets
    @IBOutlet weak var viewBackgroundView: UIView!
    @IBOutlet weak var viewDialogueView: UIView!
    @IBOutlet weak var lblDialogue: UILabel!
    @IBOutlet weak var btnClose: UIButton!
    
    
    //MARK: Properties
    var dialogue: String?
    
    
    //MARK: Life Cycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpView()
    }
    
    
    //MARK: User Actions
    @IBAction func btnCloseClick(_ sender: UIButton) {
        self.dismiss(animated: false)
    }
    
    
    //MARK: Functions
    fileprivate func setUpView(){
        viewBackgroundView.alpha = 0.7
        viewDialogueView.layer.cornerRadius = 15
        viewDialogueView.clipsToBounds = true
        
        self.lblDialogue.text = dialogue
    }
}
