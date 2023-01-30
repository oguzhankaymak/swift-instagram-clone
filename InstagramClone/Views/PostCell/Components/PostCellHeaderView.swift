//
//  PostCellHeaderView.swift
//  InstagramClone
//
//  Created by Oğuzhan Kaymak on 29.01.2023.
//

import UIKit

final class PostCellHeaderView: UIView {
    lazy var profileImageView: UIImageView = {
        var imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.layer.cornerRadius = 15
        imageView.layer.masksToBounds = true
        return imageView
    }()

    lazy var usernameLabel: UILabel = {
        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = AppFont.postTitle
        label.textColor = Color.label
        return label
    }()

    lazy var detailsButton: UIButton = {
        let iconImage = UIImage(systemName: "ellipsis", withConfiguration: UIImage.SymbolConfiguration(pointSize: 16))

        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(iconImage, for: .normal)
        button.tintColor = Color.gray
        return button
    }()

    // MARK: - init
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
        addUIElements()
        configureConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("PostCellHeaderView has not been implemented")
    }

    private func configure() {
        translatesAutoresizingMaskIntoConstraints = false
    }

    private func addUIElements() {
        addSubview(profileImageView)
        addSubview(usernameLabel)
        addSubview(detailsButton)
    }
}

// MARK: - configureConstraints
extension PostCellHeaderView {
    private func configureConstraints() {
        let profileImageViewConstraints = [
            profileImageView.topAnchor.constraint(equalTo: topAnchor, constant: 8),
            profileImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            profileImageView.widthAnchor.constraint(equalToConstant: 30),
            profileImageView.heightAnchor.constraint(equalToConstant: 30)
        ]

        let usernameLabelConstraints = [
            usernameLabel.leadingAnchor.constraint(equalTo: profileImageView.trailingAnchor, constant: 8),
            usernameLabel.centerYAnchor.constraint(equalTo: profileImageView.centerYAnchor)
        ]

        let detailsButtonConstraints = [
            detailsButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            detailsButton.centerYAnchor.constraint(equalTo: usernameLabel.centerYAnchor)
        ]

        NSLayoutConstraint.activate(profileImageViewConstraints)
        NSLayoutConstraint.activate(usernameLabelConstraints)
        NSLayoutConstraint.activate(detailsButtonConstraints)
    }
}
