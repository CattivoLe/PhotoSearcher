//
//  PhotosCollectionViewController.swift
//  PhotoSearcher
//
//  Created by Александр Омельчук on 21.08.2019.
//  Copyright © 2019 Александр Омельчук. All rights reserved.
//

import UIKit

class PhotosCollectionViewController: UICollectionViewController {
    
    let networkService = NetworkService()
    
    private lazy var addBarButtonItem: UIBarButtonItem = {
        return UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addBarButtonTapped))
    }()
    
    private lazy var actionBarButtonItem: UIBarButtonItem = {
        return UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(actionBarButtonTapped))
    }()
    
    override func viewDidLoad() {
        super .viewDidLoad()
        setupCollectionView()
        setupNavigationBar()
        setupSearchBar()
        
        collectionView.backgroundColor = .green
    }
    
    //MARK: - Navigation Items Action
    
    @objc private func addBarButtonTapped(){
        print(#function)
    }
    
    @objc private func actionBarButtonTapped() {
        print(#function)
    }
    
    //MARK: - Setup UI Elements
    
    private func setupCollectionView() {
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "CellID")
    }
    
    private func setupNavigationBar() {
        let titleLable = UILabel()
        titleLable.text = "PHOTOS"
        titleLable.font = UIFont.systemFont(ofSize: 15, weight: .medium)
        titleLable.textColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: titleLable)
        navigationItem.rightBarButtonItems = [actionBarButtonItem, addBarButtonItem]
    }
    
    private func setupSearchBar() {
        let searchController = UISearchController(searchResultsController: nil)
        navigationItem.searchController = searchController
        navigationItem.hidesSearchBarWhenScrolling = false
        searchController.searchBar.delegate = self
        searchController.hidesNavigationBarDuringPresentation = false
        searchController.obscuresBackgroundDuringPresentation = false
    }
    
    //MARK: - UICollectionViewDataSource, Delegate
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CellID", for: indexPath)
        cell.backgroundColor = .blue
        return cell
    }
    
}

    //MARK: - UISearchBar Delegate

extension PhotosCollectionViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
 //       networkService.request(searchTerm: searchText) { (<#Data?#>, <#Error?#>) in
 //           <#code#>
 //       }
    }
}
