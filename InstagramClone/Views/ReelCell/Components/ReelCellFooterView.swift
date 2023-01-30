//
//  ReelCellFooterView.swift
//  InstagramClone
//
//  Created by Oğuzhan Kaymak on 30.01.2023.
//

import UIKit

final class ReelCellFooterView: UIView {

    lazy var profileImageView: UIImageView = {
        var imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.layer.cornerRadius = 18
        imageView.layer.masksToBounds = true
        return imageView
    }()

    lazy var usernameLabel: UILabel = {
        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = AppFont.postTitle
        label.textColor = Color.white
        return label
    }()

    lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = Color.white
        label.font = AppFont.postSmallText
        return label
    }()

    // MARK: - init
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
        addUIElements()
        configureConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("PostCellOperationButtonsView has not been implemented")
    }

    private func configure() {
        translatesAutoresizingMaskIntoConstraints = false
    }

    private func addUIElements() {
        addSubview(profileImageView)
        addSubview(usernameLabel)
        addSubview(descriptionLabel)
    }
}

// MARK: - configureConstraints
extension ReelCellFooterView {
    private func configureConstraints() {

        let profileImageViewConstraints: [NSLayoutConstraint] = [
            profileImageView.topAnchor.constraint(equalTo: topAnchor),
            profileImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            profileImageView.widthAnchor.constraint(equalToConstant: 36),
            profileImageView.heightAnchor.constraint(equalToConstant: 36)
        ]

        let usernameLabelConstraints: [NSLayoutConstraint] = [
            usernameLabel.centerYAnchor.constraint(equalTo: profileImageView.centerYAnchor),
            usernameLabel.leadingAnchor.constraint(equalTo: profileImageView.trailingAnchor, constant: 10)
        ]

        let descriptionLabelConstraints: [NSLayoutConstraint] = [
            descriptionLabel.topAnchor.constraint(equalTo: profileImageView.bottomAnchor, constant: 10),
            descriptionLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            descriptionLabel.trailingAnchor.constraint(equalTo: trailingAnchor)
        ]

        NSLayoutConstraint.activate(profileImageViewConstraints)
        NSLayoutConstraint.activate(usernameLabelConstraints)
        NSLayoutConstraint.activate(descriptionLabelConstraints)
    }
}
