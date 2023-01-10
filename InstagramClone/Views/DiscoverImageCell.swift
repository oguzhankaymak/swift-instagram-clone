//
//  MyCollectionViewCell.swift
//  InstagramClone
//
//  Created by Oğuzhan Kaymak on 28.12.2022.
//

import UIKit
import SDWebImage
import AVKit
import AVFoundation

class DiscoverImageCell: UICollectionViewCell {
    static let identifier = "discover-image-cell-identifier"

    private var player: AVPlayer!
    private lazy var avpController = AVPlayerViewController()

    private lazy var containerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = Color.backgroundColor
        return view
    }()

    private lazy var discoverImageView: UIImageView = {
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
        contentView.addSubview(discoverImageView)
    }
}

// MARK: - configureModel
extension DiscoverImageCell {
    func configure(with discoverImageCellModel: DiscoverImageCellViewModel) {
        let imageUrl = URL(string: discoverImageCellModel.imagePath)
        discoverImageView.sd_setImage(with: imageUrl)
    }
}

// MARK: - configureConstraints
extension DiscoverImageCell {
    private func configureConstraints() {
        let discoverImageViewConstraints: [NSLayoutConstraint] = [
            discoverImageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            discoverImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            discoverImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            discoverImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ]

        NSLayoutConstraint.activate(discoverImageViewConstraints)
    }
}
