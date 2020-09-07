//
//  HomeViewModel.swift
//  MoviesApp
//
//  Created by Omnia Samy on 9/7/20.
//  Copyright © 2020 Omnia Samy. All rights reserved.
//

import Foundation

class HomeViewModel {
    
    var movieList: DynamicValue<[Movie]?> = DynamicValue<[Movie]?>(nil)
    
    func getMovieList(page: Int) {
        // call api
        NetworkManager.shared.getMoviesList(page: page, completion: { (result: Result<NetworkResponse<Movie>, NetworkError>, _) in
            
            switch result {
            case .success(let data):
                print("data \(data)")
                self.movieList.value = data.results
                
            case .failure(let error):
                print("error \(error)")
            }
        })
    }
}
