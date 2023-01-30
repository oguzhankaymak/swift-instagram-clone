//
//  PostCellFooter.swift
//  InstagramClone
//
//  Created by Oğuzhan Kaymak on 30.01.2023.
//

import UIKit

final class PostCellFooterView: UIView {
    lazy var likeCountLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = AppFont.postTitle
        label.textColor = Color.label
        return label
    }()

    lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = Color.label
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.sizeToFit()
        return label
    }()

    lazy var showCommentButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitleColor(Color.gray, for: .normal)
        button.titleLabel?.font = AppFont.postText
        return button
    }()

    lazy var dateLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = AppFont.postSmallText
        label.textColor = Color.gray
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
        addSubview(likeCountLabel)
        addSubview(descriptionLabel)
        addSubview(showCommentButton)
        addSubview(dateLabel)
    }
}

// MARK: - configureConstraints
extension PostCellFooterView {
    private func configureConstraints() {
        let likeCountLabelConstraints: [NSLayoutConstraint] = [
            likeCountLabel.topAnchor.constraint(equalTo: topAnchor),
            likeCountLabel.leadingAnchor.constraint(equalTo: leadingAnchor)
        ]

        let descriptionLabelConstraints: [NSLayoutConstraint] = [
            descriptionLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            descriptionLabel.topAnchor.constraint(equalTo: likeCountLabel.bottomAnchor, constant: 6),
            descriptionLabel.trailingAnchor.constraint(equalTo: trailingAnchor)
        ]

        let showCommentButtonConstraints: [NSLayoutConstraint] = [
            showCommentButton.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 4),
            showCommentButton.leadingAnchor.constraint(equalTo: descriptionLabel.leadingAnchor)
        ]

        let dateLabelConstraints: [NSLayoutConstraint] = [
            dateLabel.topAnchor.constraint(equalTo: showCommentButton.bottomAnchor, constant: 4),
            dateLabel.leadingAnchor.constraint(equalTo: showCommentButton.leadingAnchor),
            dateLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -2)
        ]

        NSLayoutConstraint.activate(likeCountLabelConstraints)
        NSLayoutConstraint.activate(descriptionLabelConstraints)
        NSLayoutConstraint.activate(showCommentButtonConstraints)
        NSLayoutConstraint.activate(dateLabelConstraints)
    }
}
