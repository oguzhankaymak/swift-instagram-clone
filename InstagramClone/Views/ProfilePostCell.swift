//
//  TabCell.swift
//  InstagramClone
//
//  Created by Oğuzhan Kaymak on 22.01.2023.
//

import UIKit
import SDWebImage

class ProfilePostCell: UICollectionViewCell {
    static let identifier = "profile-post-cell-identifier"

    private lazy var containerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = Color.backgroundColor
        return view
    }()

    private lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        addUIElements()
        configureConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("Discover image cell didn't implement")
    }

    private func addUIElements() {
        contentView.addSubview(imageView)
    }
}

// MARK: - configureModel
extension ProfilePostCell {
    func configure(with model: ProfilePostCellViewModel) {
        let imageUrl = URL(string: model.imagePath)
        imageView.sd_setImage(with: imageUrl)
    }
}

// MARK: - configureConstraints
extension ProfilePostCell {
    private func configureConstraints() {
        let discoverImageViewConstraints: [NSLayoutConstraint] = [
            imageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            imageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            imageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ]

        NSLayoutConstraint.activate(discoverImageViewConstraints)
    }
}
