//
//  PostCellImageView.swift
//  InstagramClone
//
//  Created by Oğuzhan Kaymak on 29.01.2023.
//

import UIKit

final class PostCellImageView: UIImageView {

    // MARK: - init
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }

    required init?(coder: NSCoder) {
        fatalError("PostCellImageView has not been implemented")
    }

    private func configure() {
        translatesAutoresizingMaskIntoConstraints = false
    }
}
