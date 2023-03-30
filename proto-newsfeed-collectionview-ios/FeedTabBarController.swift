//
//  FeedTabBarController.swift
//  proto-newsfeed-collectionview-ios
//
//  Created by Santosh Krishnamurthy on 3/30/23.
//

import UIKit

class FeedTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let navController = UINavigationController(rootViewController: NewsFeedViewController(collectionViewLayout: UICollectionViewFlowLayout()))
        navController.title = "News Feed"
        navController.tabBarItem.image = UIImage(systemName: "list.bullet.rectangle")
        
        
        let secondVC = UIViewController()
        secondVC.view.backgroundColor = .yellow
        secondVC.title = "Second Tab"
        secondVC.tabBarItem.image = UIImage(systemName: "checklist")
        

        viewControllers = [navController, secondVC]
        
        tabBar.isTranslucent = false
    }
    
    // delegate method that is called when
    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        
        print("Tabbar item clicked: \(item.title ?? "No Title") index: \(self.selectedIndex)")
    }

}
