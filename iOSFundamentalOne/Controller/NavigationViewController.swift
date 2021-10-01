//
//  NavigationViewController.swift
//  iOSFundamentalOne
//
//  Created by iei19100007 on 23/08/21.
//

import UIKit

class NavigationViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let catalogueViewController = CatalogueViewController()
        let aboutViewController = AboutViewController()
        
        let catalogue = UINavigationController(rootViewController: catalogueViewController)
        let about = UINavigationController(rootViewController: aboutViewController)
        
        catalogue.tabBarItem = UITabBarItem(title: "Catalogue", image: UIImage(systemName: "cart"), tag: 0)
        about.tabBarItem = UITabBarItem(title: "About", image: UIImage(systemName: "person"), tag: 1)
        
        self.viewControllers = [catalogue, about]
		
		self.tabBar.barTintColor = UIColor.systemBackground
        
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
