//
//  ShopViewController.swift
//  InstagramClone
//
//  Created by Oğuzhan Kaymak on 5.01.2023.
//

import UIKit

class ShopViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = Color.backgroundColor

        navigationController?.navigationBar.tintColor = .label
        navigationController?.navigationBar.backgroundColor = .systemBackground

        let label = UILabel()
        label.textColor = Color.label
        label.text = "Shop"
        label.font = AppFont.navigationTitle

        navigationItem.leftBarButtonItem = UIBarButtonItem.init(customView: label)
    }

}
