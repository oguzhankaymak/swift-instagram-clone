//
//  ReelCellRightButtonsView.swift
//  InstagramClone
//
//  Created by Oğuzhan Kaymak on 30.01.2023.
//

import UIKit

final class ReelCellRightButtonsView: UIView {

    lazy var cameraButton: UIButton = {
        let iconImage = UIImage(
            systemName: "camera",
            withConfiguration: UIImage.SymbolConfiguration(pointSize: 18, weight: .bold)
        )

        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(iconImage, for: .normal)
        button.tintColor = Color.white
        return button
    }()

    lazy var likeButton: UIButton = {
        let iconImage = UIImage(
            systemName: "heart",
            withConfiguration: UIImage.SymbolConfiguration(pointSize: 18, weight: .bold)
        )

        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(iconImage, for: .normal)
        button.tintColor = Color.white
        return button
    }()

    lazy var likeCountLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = AppFont.postText
        label.textColor = Color.white
        return label
    }()

    lazy var commentButton: UIButton = {
        let iconImage = UIImage(
            systemName: "bubble.right",
            withConfiguration: UIImage.SymbolConfiguration(pointSize: 18, weight: .bold)
        )

        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(iconImage, for: .normal)
        button.tintColor = Color.white
        return button
    }()

    lazy var commentCountLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = AppFont.postText
        label.textColor = Color.white
        return label
    }()

    lazy var shareButton: UIButton = {
        let iconImage = UIImage(
            systemName: "paperplane",
            withConfiguration: UIImage.SymbolConfiguration(pointSize: 18, weight: .bold)
        )

        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(iconImage, for: .normal)
        button.tintColor = Color.white
        return button
    }()

    lazy var detailsButton: UIButton = {
        let iconImage = UIImage(
            systemName: "ellipsis",
            withConfiguration: UIImage.SymbolConfiguration(pointSize: 16, weight: .bold)
        )

        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(iconImage, for: .normal)
        button.tintColor = Color.white
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
        addSubview(cameraButton)
        addSubview(likeButton)
        addSubview(likeCountLabel)
        addSubview(commentButton)
        addSubview(commentCountLabel)
        addSubview(shareButton)
        addSubview(detailsButton)
    }
}

// MARK: - configureConstraints
extension ReelCellRightButtonsView {
    private func configureConstraints() {
        let cameraButtonConstraints: [NSLayoutConstraint] = [
            cameraButton.topAnchor.constraint(equalTo: topAnchor),
            cameraButton.trailingAnchor.constraint(equalTo: trailingAnchor)
        ]

        let likeButtonConstraints: [NSLayoutConstraint] = [
            likeButton.centerYAnchor.constraint(equalTo: centerYAnchor),
            likeButton.trailingAnchor.constraint(equalTo: trailingAnchor)
        ]

        let likeCountLabelConstraints: [NSLayoutConstraint] = [
            likeCountLabel.topAnchor.constraint(equalTo: likeButton.bottomAnchor, constant: 8),
            likeCountLabel.centerXAnchor.constraint(equalTo: likeButton.centerXAnchor)
        ]

        let commentButtonConstraints: [NSLayoutConstraint] = [
            commentButton.topAnchor.constraint(
                equalTo: likeCountLabel.bottomAnchor,
                constant: frame.size.height / 20
            ),
            commentButton.trailingAnchor.constraint(equalTo: trailingAnchor)
        ]

        let commentCountLabelConstraints: [NSLayoutConstraint] = [
            commentCountLabel.topAnchor.constraint(equalTo: commentButton.bottomAnchor, constant: 8),
            commentCountLabel.centerXAnchor.constraint(equalTo: commentButton.centerXAnchor)
        ]

        let shareButtonConstraints: [NSLayoutConstraint] = [
            shareButton.topAnchor.constraint(
                equalTo: commentCountLabel.bottomAnchor,
                constant: frame.size.height / 20
            ),
            shareButton.trailingAnchor.constraint(equalTo: trailingAnchor)
        ]

        let detailsButtonConstraints: [NSLayoutConstraint] = [
            detailsButton.topAnchor.constraint(
                equalTo: shareButton.bottomAnchor,
                constant: frame.size.height / 20
            ),
            detailsButton.trailingAnchor.constraint(equalTo: trailingAnchor)
        ]

        NSLayoutConstraint.activate(cameraButtonConstraints)
        NSLayoutConstraint.activate(likeButtonConstraints)
        NSLayoutConstraint.activate(likeCountLabelConstraints)
        NSLayoutConstraint.activate(commentButtonConstraints)
        NSLayoutConstraint.activate(commentCountLabelConstraints)
        NSLayoutConstraint.activate(shareButtonConstraints)
        NSLayoutConstraint.activate(detailsButtonConstraints)
    }
}
