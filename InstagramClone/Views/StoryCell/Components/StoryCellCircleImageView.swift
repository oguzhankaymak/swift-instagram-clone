//
//  StoryCellCircleImageView.swift
//  InstagramClone
//
//  Created by Oğuzhan Kaymak on 30.01.2023.
//

import UIKit

final class StoryCellCircleImageView: UIImageView {

    // MARK: - init
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }

    required init?(coder: NSCoder) {
        fatalError("StoryCellCircleImageView has not been implemented")
    }

    private func configure() {
        translatesAutoresizingMaskIntoConstraints = false
        layer.borderWidth = 2
        layer.cornerRadius = 56/2
        clipsToBounds = true
        layer.masksToBounds = true
        layer.borderColor = BorderColor.story
    }
}
