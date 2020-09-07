//
//  AppDelegate+Extension.swift
//  MoviesApp
//
//  Created by Omnia Samy on 9/6/20.
//  Copyright © 2020 Omnia Samy. All rights reserved.
//

import Foundation

extension AppDelegate {
    
    func initNetwork() {
        
        let defaults = NetworkDefaults(baseUrl: "https://api.themoviedb.org/3",
                                       apiKey: "81214f14b3b4fc4623c6b48bb307ab11"
        )
        
        NetworkManager.shared = NetworkManager(config: defaults)
    }
}
