//
//  ViewController.swift
//  MoviesApp
//
//  Created by Vinayak T on 21/04/23.
//

import UIKit

class ViewController: UIViewController {
    
    //MARK: Outlets
    @IBOutlet weak var tableViewMovies: UITableView!
    
    
    //MARK: Properties
    var moviesData: MoviesModel?
    let refreshControl = UIRefreshControl()
    
    
    //MARK: Life Cycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpView()
        getAllMoviesApiCall()
    }


    //MARK: User Actions
    @objc func refresh(_ sender: Any){
        refreshControl.endRefreshing()
        getAllMoviesApiCall()
    }
    
    
    //MARK: Functions
    private func setUpView(){
        tableViewMovies.delegate = self
        tableViewMovies.dataSource = self
        tableViewMovies.separatorStyle = .none
        tableViewMovies.register(UINib(nibName: "MovieTableViewCell", bundle: nil), forCellReuseIdentifier: "MovieTableViewCell")
        
        refreshControl.addTarget(self, action: #selector(refresh(_:)), for: .valueChanged)
        refreshControl.tintColor = .black
        tableViewMovies.refreshControl = refreshControl
    }
    
    fileprivate func getAllMoviesApiCall(){
        APIParser.shared.moviesDataDelegate = self
        APIParser.shared.getAllMovies()
    }
}



extension ViewController: UITableViewDataSource, UITableViewDelegate{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return moviesData?.results?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "MovieTableViewCell", for: indexPath) as? MovieTableViewCell else { return UITableViewCell() }
        
        guard let moviesData else { return UITableViewCell() }
        cell.checkBoxDelegate = self
        cell.configureCell(data: moviesData, indexPath: indexPath)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath) as? MovieTableViewCell
        if cell?.btnCheckBox.currentImage == UIImage(named: "square"){
            self.showAlert(message: "Please select check box.")
        }else{
            let dialogueVC = DialogueViewController(nibName: "DialogueViewController", bundle: nil)
            dialogueVC.dialogue = cell?.lblMovieDescription.text
            dialogueVC.modalPresentationStyle = .overCurrentContext
            self.present(dialogueVC, animated: false)
        }
    }
}



extension ViewController: MoviesDataDelegate{
    func getMoviewData(result: Bool, movies: MoviesModel?) {
        if result{
            moviesData = movies
            DispatchQueue.main.async {
                self.tableViewMovies.reloadData()
            }
        }else{
            DispatchQueue.main.async {
                self.showAlert(message: "Unable to get data from server.", actiontitle: "try again") { okAction in
                    self.getAllMoviesApiCall()
                }
            }
        }
    }
    
}



extension ViewController: CheckBoxDelegate{
    func didClickCheckBox(sender: UIButton) {
        if sender.currentImage == UIImage(named: "square"){
            sender.setImage(UIImage(named: "checkmark.square"), for: .normal)
            self.moviesData?.results?[sender.tag].isSelectedCheckBox = true
        }else{
            sender.setImage(UIImage(named: "square"), for: .normal)
            self.moviesData?.results?[sender.tag].isSelectedCheckBox = false
        }
    }
}
