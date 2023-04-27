//
//  MovieTableViewCell.swift
//  MoviesApp
//
//  Created by Vinayak T on 21/04/23.
//

import UIKit

class MovieTableViewCell: UITableViewCell {

    // MARK: Outlets
    @IBOutlet weak var btnCheckBox: UIButton!
    @IBOutlet weak var imageViewMovie: UIImageView!
    @IBOutlet weak var lblMovieTitle: UILabel!
    @IBOutlet weak var lblMovieDescription: UILabel!
    
    
    //MARK: Properties
    var checkBoxDelegate: CheckBoxDelegate?
    
    
    //MARK: Methods
    override func awakeFromNib() {
        super.awakeFromNib()
        initialSetUp()
    }
    
    override func prepareForReuse() {
        initialSetUp()
    }
    
    
    // MARK: Actions
    @IBAction func btnCheckBoxClick(_ sender: UIButton) {
        self.checkBoxDelegate?.didClickCheckBox(sender: sender)
    }
    
    
    //MARK: Functions
    fileprivate func initialSetUp() {
        self.btnCheckBox.setImage(UIImage(named: "square"), for: .normal)
        imageViewMovie.image = nil
        lblMovieTitle .text = ""
        lblMovieDescription.text = ""
    }
    
    func configureCell(data: MoviesModel, indexPath:IndexPath){
        self.lblMovieTitle.text = data.results?[indexPath.row].artistName
        self.lblMovieDescription.text = data.results?[indexPath.row].collectionName
        
        self.btnCheckBox.tag = indexPath.row
        if data.results?[indexPath.row].isSelectedCheckBox ?? false{
            self.btnCheckBox.setImage(UIImage(named: "checkmark.square"), for: .normal)
            
        }else{
            self.btnCheckBox.setImage(UIImage(named: "square"), for: .normal)
        }
        
        DispatchQueue.global(qos: .userInteractive).async {
            guard let urlString = data.results?[indexPath.row].artworkUrl100 else { self.changeImageViewMovie(image: UIImage(named: "icon_noImageAvailable")); return }
            
            if let image = ImageCache.shared.getImage(forUrlString: urlString){
                self.changeImageViewMovie(image: image)
            }else{
                guard let url = URL(string: urlString) else { self.changeImageViewMovie(image: UIImage(named: "icon_noImageAvailable")); return }
                guard let imageData = try? Data(contentsOf: url) else { self.changeImageViewMovie(image: UIImage(named: "icon_noImageAvailable")); return }
                guard let image = UIImage(data: imageData)else { self.changeImageViewMovie(image: UIImage(named: "icon_noImageAvailable")); return }
                self.changeImageViewMovie(image: image)
                ImageCache.shared.setImage(image: image, forUrlString: urlString)
            }
        }
    }
    
    private func changeImageViewMovie(image:UIImage?){
        DispatchQueue.main.async {
            self.imageViewMovie.image = image
        }
    }
}
