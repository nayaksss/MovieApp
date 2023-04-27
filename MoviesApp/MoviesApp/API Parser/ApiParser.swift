//
//  ApiParser.swift
//  MoviesApp
//
//  Created by Vinayak T on 21/04/23.
//

import Foundation

class APIParser{
    static var shared = APIParser()
    var moviesDataDelegate: MoviesDataDelegate?
    
    
    func getAllMovies(){
        guard let url = URL(string: "https://itunes.apple.com/search?media=music&term=bollywood") else{
            self.moviesDataDelegate?.getMoviewData(result: false, movies: nil)
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data else{
                self.moviesDataDelegate?.getMoviewData(result: false, movies: nil)
                return
            }
            print(data)
            let moviesData = try? JSONDecoder().decode(MoviesModel.self, from: data)
            self.moviesDataDelegate?.getMoviewData(result: true, movies: moviesData)
            
        }.resume()
    }
    
}
