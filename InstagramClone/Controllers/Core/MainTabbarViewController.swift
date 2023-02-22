//
//  MainTabbarViewController.swift
//  InstagramClone
//
//  Created by Oğuzhan Kaymak on 5.01.2023.
//

import UIKit

class MainTabbarViewController: UITabBarController {

    var coordinator: TabBarCoordinator?

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = Color.backgroundColor
        tabBar.tintColor = UIColor.label
    }
}
