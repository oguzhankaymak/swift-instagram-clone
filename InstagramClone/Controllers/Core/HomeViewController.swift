//
//  HomeViewController.swift
//  InstagramClone
//
//  Created by Oğuzhan Kaymak on 5.01.2023.
//

import UIKit

class HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        configureNavigationBar()
    }

}

// MARK: - configureNavigationBar
extension HomeViewController {
    private func configureNavigationBar() {
        navigationController?.navigationBar.tintColor = .label
        navigationController?.navigationBar.backgroundColor = .systemBackground

        let label = UILabel()
        label.textColor = .label
        label.text = "Instagram"
        label.font = .systemFont(ofSize: 26, weight: .bold)

        navigationItem.leftBarButtonItem = UIBarButtonItem.init(customView: label)

        let plusImage = UIImage(
            systemName: "plus.square",
            withConfiguration: UIImage.SymbolConfiguration(pointSize: 16)
        )

        let plusBarButtonItem = UIBarButtonItem(
            image: plusImage,
            style: .plain,
            target: self,
            action: #selector(console)
        )

        let heartImage = UIImage(
            systemName: "heart",
            withConfiguration: UIImage.SymbolConfiguration(pointSize: 16)
        )

        let heartBarButtonItem = UIBarButtonItem(
            image: heartImage,
            style: .plain,
            target: self,
            action: #selector(console)
        )

        let messageImage = UIImage(
            systemName: "text.bubble",
            withConfiguration: UIImage.SymbolConfiguration(pointSize: 16)
        )

        let messageBarButtonItem = UIBarButtonItem(
            image: messageImage,
            style: .plain,
            target: self,
            action: #selector(console)
        )

        navigationItem.rightBarButtonItems = [plusBarButtonItem, heartBarButtonItem, messageBarButtonItem]
    }

    @objc private func console() {
        print("click")
    }
}
