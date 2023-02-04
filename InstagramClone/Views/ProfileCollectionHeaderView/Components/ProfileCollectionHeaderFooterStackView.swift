//
//  ProfileCollectionHeaderFooterStackView.swift
//  InstagramClone
//
//  Created by Oğuzhan Kaymak on 4.02.2023.
//

import UIKit

protocol ProfileCollectionHeaderFooterStackViewDelegate: AnyObject {
    func editProfileButtonDidTap()
    func shareProfileButtonTap()
    func suggestFriendButtonDidTap()
}

final class ProfileCollectionHeaderFooterStackView: UIStackView {

    weak var delegate: ProfileCollectionHeaderFooterStackViewDelegate?

    private lazy var editProfileButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Edit profile", for: .normal)
        button.titleLabel?.textAlignment = .center
        button.backgroundColor = .systemGray5
        button.setTitleColor(Color.label, for: .normal)
        button.layer.cornerRadius = 8
        button.addTarget(self, action: #selector(editProfileButtonDidTap), for: .touchUpInside)
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
        button.addTarget(self, action: #selector(shareProfileButtonDidTap), for: .touchUpInside)
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
        button.addTarget(self, action: #selector(suggestFriendButtonDidTap), for: .touchUpInside)
        return button
    }()

    // MARK: - init
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
        addUIElements()
        configureConstraints()
    }

    required init(coder: NSCoder) {
        fatalError("ProfileCollectionHeaderFooterStackView has not been implemented")
    }

    private func configure() {
        translatesAutoresizingMaskIntoConstraints = false
        distribution = .fillProportionally
        spacing = 10
        axis = .horizontal
        alignment = .center
    }

    private func addUIElements() {
        addArrangedSubview(editProfileButton)
        addArrangedSubview(shareProfileButton)
        addArrangedSubview(suggestFriendButton)
    }

    @objc private func editProfileButtonDidTap() {
        delegate?.editProfileButtonDidTap()
    }

    @objc private func shareProfileButtonDidTap() {
        delegate?.shareProfileButtonTap()
    }

    @objc private func suggestFriendButtonDidTap() {
        delegate?.suggestFriendButtonDidTap()
    }
}

// MARK: - configureConstraints
extension ProfileCollectionHeaderFooterStackView {
    private func configureConstraints() {

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

        NSLayoutConstraint.activate(editProfileButtonConstraints)
        NSLayoutConstraint.activate(shareProfileButtonConstraints)
        NSLayoutConstraint.activate(suggestFriendButtonConstraints)
    }
}
