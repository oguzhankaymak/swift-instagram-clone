//
//  ProfileViewHeaderCollectionReusableView.swift
//  InstagramClone
//
//  Created by Oğuzhan Kaymak on 22.01.2023.
//

import UIKit

protocol ProfileCollectionReusableHeaderViewDelegate: AnyObject {
    func editProfileButtonDidTap()
    func shareProfileButtonTap()
    func suggestFriendButtonDidTap()
}

class ProfileCollectionReusableHeaderView: UICollectionReusableView {

    static let identifier = "profile-collection-reusable-header-view"

    weak var delegate: ProfileCollectionReusableHeaderViewDelegate?

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

    private lazy var profileInfoStackView = ProfileInfoStackView(
        frame:
            CGRect(
                x: 0,
                y: 0,
                width: 0,
                height: frame.height
            )
    )

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

    private lazy var footerStackView = ProfileCollectionHeaderFooterStackView(
        frame:
            CGRect(
                x: 0,
                y: 0,
                width: frame.size.width - 40,
                height: frame.size.height - 20
            )
    )

    public func configure(with profileImagePathUrl: String) {
        addUIElements()
        let profileImageUrl = URL(string: profileImagePathUrl)
        profileImageView.sd_setImage(with: profileImageUrl)
        configureConstraints()

        footerStackView.delegate = self
    }

    private func addUIElements() {
        self.addSubview(containerView)
        containerView.addSubview(profileImageView)
        containerView.addSubview(profileInfoStackView)
        containerView.addSubview(nameSurnameLabel)
        containerView.addSubview(bioLabel)
        containerView.addSubview(footerStackView)
    }
}

extension ProfileCollectionReusableHeaderView: ProfileCollectionHeaderFooterStackViewDelegate {
    func shareProfileButtonTap() {
        delegate?.shareProfileButtonTap()
    }

    func suggestFriendButtonDidTap() {
        delegate?.suggestFriendButtonDidTap()
    }

    func editProfileButtonDidTap() {
        delegate?.editProfileButtonDidTap()
    }
}

extension ProfileCollectionReusableHeaderView {
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
            profileInfoStackView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
            profileInfoStackView.centerYAnchor.constraint(equalTo: profileImageView.centerYAnchor),
            profileInfoStackView.heightAnchor.constraint(equalToConstant: self.frame.height / 3)
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

        NSLayoutConstraint.activate(containerViewConstraints)
        NSLayoutConstraint.activate(profileImageViewConstraints)
        NSLayoutConstraint.activate(profileInfoStackViewConstraints)

        NSLayoutConstraint.activate(nameSurnameLabelConstraints)
        NSLayoutConstraint.activate(bioLabelConstraints)
        NSLayoutConstraint.activate(footerStackViewConstraints)

    }
}
