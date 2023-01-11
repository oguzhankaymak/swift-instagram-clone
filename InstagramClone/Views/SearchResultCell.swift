//
//  SearchResultCollectionViewCell.swift
//  InstagramClone
//
//  Created by Oğuzhan Kaymak on 11.01.2023.
//

import UIKit

class SearchResultCell: UICollectionViewCell {
    static let identifier = "search-result-cell-identifier"

    private lazy var profieImageViewSize = contentView.frame.height - 10

    private lazy var profieImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.layer.borderWidth = 2
        imageView.layer.cornerRadius = profieImageViewSize / 2
        imageView.clipsToBounds = true
        imageView.layer.masksToBounds = true
        imageView.layer.borderColor = BorderColor.story
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()

    private lazy var profileInfoView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private lazy var usernameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = AppFont.postSmallBoldText
        label.textColor = Color.label
        return label
    }()

    private lazy var nameSurnameLabel: UILabel = {
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
        fatalError("Search result cell didn't implement")
    }

    private func addUIElements() {
        contentView.addSubview(profieImageView)
        contentView.addSubview(profileInfoView)
        profileInfoView.addSubview(usernameLabel)
        profileInfoView.addSubview(nameSurnameLabel)
    }
}

// MARK: - configureModel
extension SearchResultCell {
    func configure(with model: SearchResultCellViewModel) {
        let imageUrl = URL(string: model.profileImagePath)
        profieImageView.sd_setImage(with: imageUrl)
        usernameLabel.text = model.username
        nameSurnameLabel.text = model.nameSurname
    }
}

// MARK: - configureConstraints
extension SearchResultCell {
    private func configureConstraints() {
        let profieImageViewConstraints: [NSLayoutConstraint] = [
            profieImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            profieImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            profieImageView.widthAnchor.constraint(equalToConstant: profieImageViewSize),
            profieImageView.heightAnchor.constraint(equalToConstant: profieImageViewSize)
        ]

        let profileInfoViewConstraints: [NSLayoutConstraint] = [
            profileInfoView.centerYAnchor.constraint(equalTo: profieImageView.centerYAnchor),
            profileInfoView.leadingAnchor.constraint(equalTo: profieImageView.trailingAnchor, constant: 10),
            profileInfoView.heightAnchor.constraint(equalToConstant: 40)
        ]

        let usernameLabelConstraints: [NSLayoutConstraint] = [
            usernameLabel.topAnchor.constraint(equalTo: profileInfoView.topAnchor),
            usernameLabel.leadingAnchor.constraint(equalTo: profileInfoView.leadingAnchor)
        ]

        let nameSurnameLabelConstraints: [NSLayoutConstraint] = [
            nameSurnameLabel.topAnchor.constraint(equalTo: usernameLabel.bottomAnchor, constant: 2),
            nameSurnameLabel.leadingAnchor.constraint(equalTo: profileInfoView.leadingAnchor)
        ]

        NSLayoutConstraint.activate(profieImageViewConstraints)
        NSLayoutConstraint.activate(profileInfoViewConstraints)
        NSLayoutConstraint.activate(usernameLabelConstraints)
        NSLayoutConstraint.activate(nameSurnameLabelConstraints)
    }
}
