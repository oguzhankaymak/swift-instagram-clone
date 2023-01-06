//
//  TextCollectionViewCell.swift
//  InstagramClone
//
//  Created by Oğuzhan Kaymak on 28.12.2022.
//

import UIKit
import SDWebImage

class StoryCell: UICollectionViewCell {
    static let identifier = "story-cell-identifier"

    private lazy var circleImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.layer.borderWidth = 2
        imageView.layer.cornerRadius = 56/2
        imageView.clipsToBounds = true
        imageView.layer.masksToBounds = true
        imageView.layer.borderColor = BorderColor.story
        return imageView
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.backgroundColor = Color.backgroundColor
        addUIElements()
        configureConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("Story cell didn't implement")
    }

    private func addUIElements() {
        contentView.addSubview(circleImageView)
    }
}

// MARK: - configureModel
extension StoryCell {
    func configure(with storyCellModel: StoryCellViewModel) {
        let imageUrl = URL(string: storyCellModel.imagePath)
        circleImageView.sd_setImage(with: imageUrl)
    }
}

// MARK: - configureConstraints
extension StoryCell {
    private func configureConstraints() {
        let circleImageViewConstraints: [NSLayoutConstraint] = [
            circleImageView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            circleImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            circleImageView.widthAnchor.constraint(equalToConstant: 56),
            circleImageView.heightAnchor.constraint(equalToConstant: 56)
        ]

        NSLayoutConstraint.activate(circleImageViewConstraints)
    }
}
