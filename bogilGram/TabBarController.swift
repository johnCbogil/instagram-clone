//
//  TabBarController.swift
//  bogilGram
//
//  Created by John Bogil on 8/13/18.
//  Copyright © 2018 John Bogil. All rights reserved.
//

import UIKit

class TabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let flowLayout = UICollectionViewFlowLayout()
        let userProfileController = UserProfileController.init(collectionViewLayout: flowLayout)
        
        let navigationController = UINavigationController.init(rootViewController: userProfileController)
        navigationController.tabBarItem.image = #imageLiteral(resourceName: "profile_unselected")
        navigationController.tabBarItem.image = #imageLiteral(resourceName: "profile_selected")
        tabBar.tintColor = .black
        self.viewControllers = [navigationController, UIViewController()]
        
        
    }
}
