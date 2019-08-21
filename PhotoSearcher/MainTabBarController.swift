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
        
        viewControllers = [generateNavigationVC(rootVC: photosVC, title: "Photos", image: #imageLiteral(resourceName: "photos")), generateNavigationVC(rootVC: ViewController(), title: "Favourites", image: #imageLiteral(resourceName: "heart"))]
    }
    
    private func generateNavigationVC(rootVC: UIViewController, title: String, image: UIImage) -> UINavigationController {
        let navigationVC = UINavigationController(rootViewController: rootVC)
        
        navigationVC.tabBarItem.title = title
        navigationVC.tabBarItem.image = image
        
        return navigationVC
    }
    
    
}
