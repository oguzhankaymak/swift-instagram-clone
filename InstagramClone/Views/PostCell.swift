//
//  MyCollectionViewCell.swift
//  InstagramClone
//
//  Created by Oğuzhan Kaymak on 28.12.2022.
//

import UIKit
import SDWebImage

class PostCell: UICollectionViewCell {
    static let identifier = "post-cell-identifier"

    private lazy var containerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = Color.backgroundColor
        return view
    }()

    private lazy var profileImageView: UIImageView = {
        var imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.layer.cornerRadius = 15
        imageView.layer.masksToBounds = true
        return imageView
    }()

    private lazy var usernameLabel: UILabel = {
        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = AppFont.postTitle
        label.textColor = Color.label
        return label
    }()

    private lazy var detailsButton: UIButton = {
        let iconImage = UIImage(systemName: "ellipsis", withConfiguration: UIImage.SymbolConfiguration(pointSize: 16))

        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(iconImage, for: .normal)
        button.tintColor = Color.gray
        return button
    }()

    private lazy var postImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

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

    private lazy var likeCountLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = AppFont.postTitle
        label.textColor = Color.label
        return label
    }()

    private lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = Color.label
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.sizeToFit()
        return label
    }()

    private lazy var showCommentButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitleColor(Color.gray, for: .normal)
        button.titleLabel?.font = AppFont.postText
        return button
    }()

    private lazy var dateLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = AppFont.postSmallText
        label.textColor = Color.gray
        return label
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        addUIElements()
        configureConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("Post cell didn't implement")
    }

    private func addUIElements() {
        contentView.addSubview(containerView)
        containerView.addSubview(profileImageView)
        containerView.addSubview(usernameLabel)
        containerView.addSubview(detailsButton)
        containerView.addSubview(postImageView)
        containerView.addSubview(likeButton)
        containerView.addSubview(commentButton)
        containerView.addSubview(shareButton)
        containerView.addSubview(bookmarkButton)
        containerView.addSubview(likeCountLabel)
        containerView.addSubview(descriptionLabel)
        containerView.addSubview(showCommentButton)
        containerView.addSubview(dateLabel)
    }
}

// MARK: - configureModel
extension PostCell {
    func configure(with postCellModel: PostCellViewModel) {
        let profileImageUrl = URL(string: postCellModel.profileImagePath)
        profileImageView.sd_setImage(with: profileImageUrl)

        usernameLabel.text = postCellModel.username
        likeCountLabel.text = "\(postCellModel.likeCount) likes"

        showCommentButton.setTitle("View all \(postCellModel.commentCount) comments", for: .normal)

        let descriptionText = boldText(string: postCellModel.username)
        descriptionText.append(regularText(string: " \(postCellModel.description)"))
        descriptionLabel.attributedText = descriptionText
        dateLabel.text = postCellModel.dateDesc

        let postImageUrl = URL(string: postCellModel.imagePath)
        postImageView.sd_setImage(with: postImageUrl)

    }
}

// MARK: - configureConstraints
extension PostCell {
    private func boldText(string: String) -> NSMutableAttributedString {
        return NSMutableAttributedString(
            string: string,
            attributes: [NSAttributedString.Key.font: AppFont.postSmallBoldText]
        )
    }

    private func regularText(string: String) -> NSMutableAttributedString {
        return NSMutableAttributedString(
            string: string,
            attributes: [NSAttributedString.Key.font: AppFont.postSmallText]
        )
    }

    private func configureConstraints() {
        let containerViewConstraints: [NSLayoutConstraint] = [
            containerView.topAnchor.constraint(equalTo: contentView.topAnchor),
            containerView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            containerView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            containerView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ]

        let profileImageViewConstraints: [NSLayoutConstraint] = [
            profileImageView.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 8),
            profileImageView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 10),
            profileImageView.widthAnchor.constraint(equalToConstant: 30),
            profileImageView.heightAnchor.constraint(equalToConstant: 30)
        ]

        let usernameLabelConstraints: [NSLayoutConstraint] = [
            usernameLabel.leadingAnchor.constraint(equalTo: profileImageView.trailingAnchor, constant: 8),
            usernameLabel.centerYAnchor.constraint(equalTo: profileImageView.centerYAnchor)
        ]

        let detailsButtonConstraints: [NSLayoutConstraint] = [
            detailsButton.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -10),
            detailsButton.centerYAnchor.constraint(equalTo: usernameLabel.centerYAnchor)
        ]

        let postImageViewConstraints: [NSLayoutConstraint] = [
            postImageView.topAnchor.constraint(equalTo: profileImageView.bottomAnchor, constant: 8),
            postImageView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            postImageView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
            postImageView.heightAnchor.constraint(equalToConstant: 300)
        ]

        let likeButtonConstraints: [NSLayoutConstraint] = [
            likeButton.topAnchor.constraint(equalTo: postImageView.bottomAnchor, constant: 10),
            likeButton.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 8)
        ]

        let commentButtonConstraints: [NSLayoutConstraint] = [
            commentButton.topAnchor.constraint(equalTo: postImageView.bottomAnchor, constant: 10),
            commentButton.leadingAnchor.constraint(equalTo: likeButton.trailingAnchor, constant: 10)
        ]

        let shareButtonConstraints: [NSLayoutConstraint] = [
            shareButton.topAnchor.constraint(equalTo: postImageView.bottomAnchor, constant: 10),
            shareButton.leadingAnchor.constraint(equalTo: commentButton.trailingAnchor, constant: 10)
        ]

        let bookmarkButtonConstraints: [NSLayoutConstraint] = [
            bookmarkButton.topAnchor.constraint(equalTo: postImageView.bottomAnchor, constant: 10),
            bookmarkButton.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -8)
        ]

        let likeCountLabelConstraints: [NSLayoutConstraint] = [
            likeCountLabel.leadingAnchor.constraint(equalTo: likeButton.leadingAnchor),
            likeCountLabel.topAnchor.constraint(equalTo: likeButton.bottomAnchor, constant: 16)
        ]

        let descriptionLabelConstraints: [NSLayoutConstraint] = [
            descriptionLabel.leadingAnchor.constraint(equalTo: likeCountLabel.leadingAnchor),
            descriptionLabel.topAnchor.constraint(equalTo: likeCountLabel.bottomAnchor, constant: 6),
            descriptionLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8)
        ]

        let showCommentButtonConstraints: [NSLayoutConstraint] = [
            showCommentButton.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 4),
            showCommentButton.leadingAnchor.constraint(equalTo: descriptionLabel.leadingAnchor)
        ]

        let dateLabelConstraints: [NSLayoutConstraint] = [
            dateLabel.topAnchor.constraint(equalTo: showCommentButton.bottomAnchor, constant: 4),
            dateLabel.leadingAnchor.constraint(equalTo: showCommentButton.leadingAnchor),
            dateLabel.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -2)
        ]

        NSLayoutConstraint.activate(containerViewConstraints)
        NSLayoutConstraint.activate(profileImageViewConstraints)
        NSLayoutConstraint.activate(usernameLabelConstraints)
        NSLayoutConstraint.activate(detailsButtonConstraints)
        NSLayoutConstraint.activate(postImageViewConstraints)
        NSLayoutConstraint.activate(likeButtonConstraints)
        NSLayoutConstraint.activate(commentButtonConstraints)
        NSLayoutConstraint.activate(shareButtonConstraints)
        NSLayoutConstraint.activate(bookmarkButtonConstraints)
        NSLayoutConstraint.activate(likeCountLabelConstraints)
        NSLayoutConstraint.activate(descriptionLabelConstraints)
        NSLayoutConstraint.activate(showCommentButtonConstraints)
        NSLayoutConstraint.activate(dateLabelConstraints)
    }
}
