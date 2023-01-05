//
//  MainTabbarViewController.swift
//  InstagramClone
//
//  Created by Oğuzhan Kaymak on 5.01.2023.
//

import UIKit

class MainTabbarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground

        let vc1 = UINavigationController(rootViewController: HomeViewController())
        let vc2 = UINavigationController(rootViewController: SearchViewController())
        let vc3 = UINavigationController(rootViewController: ReelsViewController())
        let vc4 = UINavigationController(rootViewController: ShopViewController())
        let vc5 = UINavigationController(rootViewController: ProfileViewController())

        vc1.tabBarItem.image = UIImage(systemName: "house")
        vc1.tabBarItem.selectedImage = UIImage(systemName: "house.fill")

        vc2.tabBarItem.image = UIImage(systemName: "magnifyingglass")

        vc3.tabBarItem.image = UIImage(systemName: "play.tv")
        vc3.tabBarItem.selectedImage = UIImage(systemName: "play.tv.fill")

        vc4.tabBarItem.image = UIImage(systemName: "bag")
        vc4.tabBarItem.selectedImage = UIImage(systemName: "bag.fill")

        vc5.tabBarItem.image = UIImage(systemName: "person.crop.circle")
        vc5.tabBarItem.selectedImage = UIImage(systemName: "person.crop.circle.fill")

        UITabBar.appearance().tintColor = .label

        setViewControllers([vc1, vc2, vc3, vc4, vc5], animated: true)
    }
}
