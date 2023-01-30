//
//  PostCellFooter.swift
//  InstagramClone
//
//  Created by Oğuzhan Kaymak on 29.01.2023.
//

import UIKit

final class PostCellBottomButtonsView: UIView {
    private lazy var likeButton: UIButton = {
        let iconImage = UIImage(systemName: "heart", withConfiguration: UIImage.SymbolConfiguration(pointSize: 18))

        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(iconImage, for: .normal)
        button.tintColor = Color.label
        return button
    }()

    private lazy var commentButton: UIButton = {
        let iconImage = UIImage(
            systemName: "bubble.right",
            withConfiguration: UIImage.SymbolConfiguration(pointSize: 18)
        )

        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(iconImage, for: .normal)
        button.tintColor = Color.label
        return button
    }()

    private lazy var shareButton: UIButton = {
        let iconImage = UIImage(systemName: "paperplane", withConfiguration: UIImage.SymbolConfiguration(pointSize: 18))

        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(iconImage, for: .normal)
        button.tintColor = Color.label
        return button
    }()

    private lazy var bookmarkButton: UIButton = {
        let iconImage = UIImage(systemName: "bookmark", withConfiguration: UIImage.SymbolConfiguration(pointSize: 18))

        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(iconImage, for: .normal)
        button.tintColor = Color.label
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
        fatalError("PostCellOperationButtonsView has not been implemented")
    }

    private func configure() {
        translatesAutoresizingMaskIntoConstraints = false
    }

    private func addUIElements() {
        addSubview(likeButton)
        addSubview(commentButton)
        addSubview(shareButton)
        addSubview(bookmarkButton)
    }

}

// MARK: - configureConstraints
extension PostCellBottomButtonsView {
    private func configureConstraints() {
        let likeButtonConstraints = [
            likeButton.topAnchor.constraint(equalTo: topAnchor),
            likeButton.leadingAnchor.constraint(equalTo: leadingAnchor)
        ]

        let commentButtonConstraints = [
            commentButton.topAnchor.constraint(equalTo: topAnchor),
            commentButton.leadingAnchor.constraint(equalTo: likeButton.trailingAnchor, constant: 10)
        ]

        let shareButtonConstraints = [
            shareButton.topAnchor.constraint(equalTo: topAnchor),
            shareButton.leadingAnchor.constraint(equalTo: commentButton.trailingAnchor, constant: 10)
        ]

        let bookmarkButtonConstraints = [
            bookmarkButton.topAnchor.constraint(equalTo: topAnchor),
            bookmarkButton.trailingAnchor.constraint(equalTo: trailingAnchor)
        ]

        NSLayoutConstraint.activate(likeButtonConstraints)
        NSLayoutConstraint.activate(commentButtonConstraints)
        NSLayoutConstraint.activate(shareButtonConstraints)
        NSLayoutConstraint.activate(bookmarkButtonConstraints)
    }
}
