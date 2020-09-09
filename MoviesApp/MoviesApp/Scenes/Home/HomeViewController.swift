//
//  ViewController.swift
//  MoviesApp
//
//  Created by Omnia Samy on 9/6/20.
//  Copyright © 2020 Omnia Samy. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    
    let homeViewModel = HomeViewModel()
    
    @IBOutlet private weak var homeTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.title = "Movies"
        observe()
        
        homeTableView.dataSource = self
        homeTableView.delegate = self
        
        homeTableView.register(UINib(nibName: MovieCell.className, bundle: nil),
                               forCellReuseIdentifier: MovieCell.className)
        
        homeViewModel.getMovieList(page: 1)
    }
    
    private func observe() {
        self.homeViewModel.movieList.addObserver(self) {
            self.homeTableView.reloadData()
        }
    }
}

extension HomeViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return homeViewModel.movieList.value?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: MovieCell.className, for: indexPath) as? MovieCell,
            let movie = homeViewModel.movieList.value?[indexPath.row] else {
                return UITableViewCell()
        }
        
        cell.bind(movie: movie)
        return cell
    }
}

extension HomeViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
}
