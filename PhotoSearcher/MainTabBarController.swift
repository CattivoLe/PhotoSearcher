//
//  MainTabBarController.swift
//  PhotoSearcher
//
//  Created by Александр Омельчук on 21.08.2019.
//  Copyright © 2019 Александр Омельчук. All rights reserved.
//

import UIKit

class MainTabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super .viewDidLoad()
        
        view.backgroundColor = .orange
        
        let photosVC = PhotosCollectionViewController(collectionViewLayout: UICollectionViewFlowLayout())
        let navigationVC = UINavigationController(rootViewController: photosVC)
        
        navigationVC.tabBarItem.title = "Photos"
        navigationVC.tabBarItem.image = #imageLiteral(resourceName: "photos")
        
        viewControllers = [navigationVC, ViewController()]
    }
    
    
}
