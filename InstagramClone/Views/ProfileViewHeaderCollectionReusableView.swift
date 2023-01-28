//
//  ProfileViewHeaderCollectionReusableView.swift
//  InstagramClone
//
//  Created by Oğuzhan Kaymak on 22.01.2023.
//

import UIKit

class ProfileViewHeaderCollectionReusableView: UICollectionReusableView {

    static let identifier = "profile-view-header-identifier"

    private lazy var containerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = Color.backgroundColor
        return view
    }()

    private lazy var profileImageView: UIImageView = {
        var imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.layer.cornerRadius = self.frame.height / 6
        imageView.layer.masksToBounds = true
        return imageView
    }()

    private lazy var profileInfoStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.distribution = .fillProportionally
        stackView.axis = .horizontal
        stackView.alignment = .center
        return stackView
    }()

    private lazy var postInfoView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private lazy var postsCountLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = AppFont.postTitle
        label.textColor = Color.label
        label.text = "12"
        return label
    }()

    private lazy var postsLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = AppFont.postText
        label.textColor = Color.label
        label.text = "Posts"
        return label
    }()

    private lazy var followersInfoView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private lazy var followersCountLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = AppFont.postTitle
        label.textColor = Color.label
        label.text = "642"
        return label
    }()

    private lazy var followersLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = AppFont.postText
        label.textColor = Color.label
        label.text = "Followers"
        return label
    }()

    private lazy var followingInfoView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private lazy var followingCountLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = AppFont.postTitle
        label.textColor = Color.label
        label.text = "642"
        return label
    }()

    private lazy var followingLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = AppFont.postText
        label.textColor = Color.label
        label.text = "Following"
        return label
    }()

    private lazy var nameSurnameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = AppFont.postSmallBoldText
        label.textColor = Color.label
        label.text = "Oğuzhan Kaymak"
        return label
    }()

    private lazy var bioLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = AppFont.postSmallText
        label.textColor = Color.label
        label.text = "Mobile App Developer"
        return label
    }()

    private lazy var footerStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.distribution = .fillProportionally
        stackView.spacing = 10
        stackView.axis = .horizontal
        stackView.alignment = .center
        return stackView
    }()

    private lazy var editProfileButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Edit profile", for: .normal)
        button.titleLabel?.textAlignment = .center
        button.backgroundColor = .systemGray5
        button.setTitleColor(Color.label, for: .normal)
        button.layer.cornerRadius = 8
        return button
    }()

    private lazy var shareProfileButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Share profile", for: .normal)
        button.titleLabel?.textAlignment = .center
        button.backgroundColor = .systemGray5
        button.setTitleColor(Color.label, for: .normal)
        button.layer.cornerRadius = 8
        return button
    }()

    private lazy var suggestFriendButton: UIButton = {
        let iconImage = UIImage(
            systemName: "person.badge.plus",
            withConfiguration: UIImage.SymbolConfiguration(pointSize: 14)
        )

        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(iconImage, for: .normal)
        button.tintColor = Color.label
        button.backgroundColor = .systemGray5
        button.layer.cornerRadius = 8
        return button
    }()

    private let label: UILabel = {
        let label = UILabel()
        label.text = "header"
        label.textAlignment = .center
        label.textColor = .white
        return label
    }()

    public func configure(with profileImagePathUrl: String) {
        addUIElements()
        let profileImageUrl = URL(string: profileImagePathUrl)
        profileImageView.sd_setImage(with: profileImageUrl)
        configureConstraints()
    }

    private func addUIElements() {
        self.addSubview(containerView)
        containerView.addSubview(profileImageView)
        containerView.addSubview(profileInfoStackView)

        profileInfoStackView.addArrangedSubview(postInfoView)
        profileInfoStackView.addArrangedSubview(followersInfoView)
        profileInfoStackView.addArrangedSubview(followingInfoView)

        postInfoView.addSubview(postsCountLabel)
        postInfoView.addSubview(postsLabel)

        followersInfoView.addSubview(followersCountLabel)
        followersInfoView.addSubview(followersLabel)

        followingInfoView.addSubview(followingCountLabel)
        followingInfoView.addSubview(followingLabel)

        containerView.addSubview(nameSurnameLabel)
        containerView.addSubview(bioLabel)

        containerView.addSubview(footerStackView)
        footerStackView.addArrangedSubview(editProfileButton)
        footerStackView.addArrangedSubview(shareProfileButton)
        footerStackView.addArrangedSubview(suggestFriendButton)
    }
}

extension ProfileViewHeaderCollectionReusableView {
    private func configureConstraints() {
        let containerViewConstraints: [NSLayoutConstraint] = [
            containerView.topAnchor.constraint(equalTo: self.topAnchor, constant: 20),
            containerView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            containerView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            containerView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ]

        let profileImageViewConstraints: [NSLayoutConstraint] = [
            profileImageView.topAnchor.constraint(equalTo: containerView.topAnchor),
            profileImageView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            profileImageView.widthAnchor.constraint(equalToConstant: self.frame.height / 3),
            profileImageView.heightAnchor.constraint(equalToConstant: self.frame.height / 3)
        ]

        let profileInfoStackViewConstraints: [NSLayoutConstraint] = [
            profileInfoStackView.leadingAnchor.constraint(equalTo: profileImageView.trailingAnchor),
            profileInfoStackView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            profileInfoStackView.centerYAnchor.constraint(equalTo: profileImageView.centerYAnchor),
            profileInfoStackView.heightAnchor.constraint(equalToConstant: self.frame.height / 3)
        ]

        let postInfoViewConstraints: [NSLayoutConstraint] = [
            postInfoView.heightAnchor.constraint(equalToConstant: self.frame.height / 6)
        ]

        let postsCountLabelConstraints: [NSLayoutConstraint] = [
            postsCountLabel.centerXAnchor.constraint(equalTo: postInfoView.centerXAnchor)
        ]

        let postsLabelConstraints: [NSLayoutConstraint] = [
            postsLabel.topAnchor.constraint(equalTo: postsCountLabel.bottomAnchor, constant: 4),
            postsLabel.centerXAnchor.constraint(equalTo: postInfoView.centerXAnchor)
        ]

        let followersInfoViewConstraints: [NSLayoutConstraint] = [
            followersInfoView.heightAnchor.constraint(equalToConstant: self.frame.height / 6)
        ]

        let followersCountLabelConstraints: [NSLayoutConstraint] = [
            followersCountLabel.centerXAnchor.constraint(equalTo: followersInfoView.centerXAnchor)
        ]

        let followersLabelConstraints: [NSLayoutConstraint] = [
            followersLabel.topAnchor.constraint(equalTo: followersCountLabel.bottomAnchor, constant: 4),
            followersLabel.centerXAnchor.constraint(equalTo: followersInfoView.centerXAnchor)
        ]

        let followingInfoViewConstraints: [NSLayoutConstraint] = [
            followingInfoView.heightAnchor.constraint(equalToConstant: self.frame.height / 6)
        ]

        let followingCountLabelConstraints: [NSLayoutConstraint] = [
            followingCountLabel.centerXAnchor.constraint(equalTo: followingInfoView.centerXAnchor)
        ]

        let followingLabelConstraints: [NSLayoutConstraint] = [
            followingLabel.topAnchor.constraint(equalTo: followingCountLabel.bottomAnchor, constant: 4),
            followingLabel.centerXAnchor.constraint(equalTo: followingInfoView.centerXAnchor)
        ]

        let nameSurnameLabelConstraints: [NSLayoutConstraint] = [
            nameSurnameLabel.topAnchor.constraint(
                equalTo: profileImageView.bottomAnchor,
                constant: self.frame.size.height / 24
            ),
            nameSurnameLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor)
        ]

        let bioLabelConstraints: [NSLayoutConstraint] = [
            bioLabel.topAnchor.constraint(
                equalTo: nameSurnameLabel.bottomAnchor,
                constant: self.frame.size.height / 20
            ),
            bioLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor)
        ]

        let footerStackViewConstraints: [NSLayoutConstraint] = [
            footerStackView.topAnchor.constraint(equalTo: bioLabel.bottomAnchor),
            footerStackView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            footerStackView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
            footerStackView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor)
        ]

        let editProfileButtonConstraints: [NSLayoutConstraint] = [
            editProfileButton.heightAnchor.constraint(equalToConstant: self.frame.size.height / 8)
        ]

        let shareProfileButtonConstraints: [NSLayoutConstraint] = [
            shareProfileButton.heightAnchor.constraint(equalToConstant: self.frame.size.height / 8)
        ]

        let suggestFriendButtonConstraints: [NSLayoutConstraint] = [
            suggestFriendButton.widthAnchor.constraint(equalToConstant: self.frame.size.width / 8),
            suggestFriendButton.heightAnchor.constraint(equalToConstant: self.frame.size.height / 8)
        ]

        NSLayoutConstraint.activate(containerViewConstraints)
        NSLayoutConstraint.activate(profileImageViewConstraints)
        NSLayoutConstraint.activate(profileInfoStackViewConstraints)
        NSLayoutConstraint.activate(postInfoViewConstraints)
        NSLayoutConstraint.activate(postsCountLabelConstraints)
        NSLayoutConstraint.activate(postsLabelConstraints)
        NSLayoutConstraint.activate(followersInfoViewConstraints)
        NSLayoutConstraint.activate(followersCountLabelConstraints)
        NSLayoutConstraint.activate(followersLabelConstraints)
        NSLayoutConstraint.activate(followingInfoViewConstraints)
        NSLayoutConstraint.activate(followingCountLabelConstraints)
        NSLayoutConstraint.activate(followingLabelConstraints)

        NSLayoutConstraint.activate(nameSurnameLabelConstraints)
        NSLayoutConstraint.activate(bioLabelConstraints)
        NSLayoutConstraint.activate(footerStackViewConstraints)
        NSLayoutConstraint.activate(editProfileButtonConstraints)
        NSLayoutConstraint.activate(shareProfileButtonConstraints)
        NSLayoutConstraint.activate(suggestFriendButtonConstraints)
    }
}
