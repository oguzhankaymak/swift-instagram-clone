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

    private lazy var postHeaderView = PostCellHeaderView(frame: .zero)
    private lazy var postImageView = PostCellImageView(frame: .zero)
    private lazy var postBottomButtonsView = PostCellBottomButtonsView(frame: .zero)
    private lazy var postFooterView = PostCellFooterView(frame: .zero)

    override init(frame: CGRect) {
        super.init(frame: frame)
        addUIElements()
        configureConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("Post cell didn't implement")
    }

    private func addUIElements() {
        contentView.addSubview(postHeaderView)
        contentView.addSubview(postImageView)
        contentView.addSubview(postBottomButtonsView)
        contentView.addSubview(postFooterView)
    }
}

// MARK: - configureModel
extension PostCell {
    func configure(with postCellModel: PostCellViewModel) {
        let profileImageUrl = URL(string: postCellModel.profileImagePath)

        postHeaderView.profileImageView.sd_setImage(with: profileImageUrl)
        postHeaderView.usernameLabel.text = postCellModel.username

        postFooterView.likeCountLabel.text = "\(postCellModel.likeCount) likes"
        postFooterView.showCommentButton.setTitle(
            "View all \(postCellModel.commentCount) comments",
            for: .normal
        )

        let descriptionText = boldText(string: postCellModel.username)
        descriptionText.append(regularText(string: " \(postCellModel.description)"))
        postFooterView.descriptionLabel.attributedText = descriptionText
        postFooterView.dateLabel.text = postCellModel.dateDesc

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
        let postHeaderViewConstraints: [NSLayoutConstraint] = [
            postHeaderView.topAnchor.constraint(equalTo: contentView.topAnchor),
            postHeaderView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            postHeaderView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            postHeaderView.heightAnchor.constraint(equalToConstant: 40)
        ]

        let postImageViewConstraints: [NSLayoutConstraint] = [
            postImageView.topAnchor.constraint(equalTo: postHeaderView.bottomAnchor, constant: 8),
            postImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            postImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            postImageView.heightAnchor.constraint(equalToConstant: contentView.frame.width * 0.8)
        ]

        let postBottomButtonsViewConstraints: [NSLayoutConstraint] = [
            postBottomButtonsView.topAnchor.constraint(equalTo: postImageView.bottomAnchor, constant: 10),
            postBottomButtonsView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
            postBottomButtonsView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8),
            postBottomButtonsView.heightAnchor.constraint(equalToConstant: 30)
        ]

        let postFooterViewConstraints: [NSLayoutConstraint] = [
            postFooterView.topAnchor.constraint(equalTo: postBottomButtonsView.bottomAnchor, constant: 5),
            postFooterView.leadingAnchor.constraint(equalTo: postBottomButtonsView.leadingAnchor),
            postFooterView.trailingAnchor.constraint(equalTo: postBottomButtonsView.trailingAnchor),
            postFooterView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -2)
        ]

        NSLayoutConstraint.activate(postHeaderViewConstraints)
        NSLayoutConstraint.activate(postImageViewConstraints)
        NSLayoutConstraint.activate(postBottomButtonsViewConstraints)
        NSLayoutConstraint.activate(postFooterViewConstraints)
    }
}
