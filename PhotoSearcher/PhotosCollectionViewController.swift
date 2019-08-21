//
//  PhotosCollectionViewController.swift
//  PhotoSearcher
//
//  Created by Александр Омельчук on 21.08.2019.
//  Copyright © 2019 Александр Омельчук. All rights reserved.
//

import UIKit

class PhotosCollectionViewController: UICollectionViewController {
    
    override func viewDidLoad() {
        super .viewDidLoad()
        setupCollectionView()
        setupNavigationBar()
        collectionView.backgroundColor = .green
    }
    
    private func setupCollectionView() {
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "CellID")
        
    }
    
    private func setupNavigationBar() {
        let titleLable = UILabel()
        titleLable.text = "PHOTOS"
        titleLable.font = UIFont.systemFont(ofSize: 15, weight: .medium)
        titleLable.textColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: titleLable)
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CellID", for: indexPath)
        cell.backgroundColor = .blue
        return cell
    }
    
}
