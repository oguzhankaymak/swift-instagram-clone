//
//  SearchResultCollectionViewCell.swift
//  InstagramClone
//
//  Created by Oğuzhan Kaymak on 11.01.2023.
//

import UIKit

class SearchResultCell: UICollectionViewCell {
    static let identifier = "search-result-cell-identifier"

    private lazy var profileImageViewSize = contentView.frame.height

    private lazy var profileImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.layer.borderWidth = 2
        imageView.layer.cornerRadius = profileImageViewSize / 2
        imageView.clipsToBounds = true
        imageView.layer.masksToBounds = true
        imageView.layer.borderColor = BorderColor.story
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()

    private lazy var searchResultBodyView = SearchResultCellBodyView(frame: .zero)

    override init(frame: CGRect) {
        super.init(frame: frame)
        addUIElements()
        configureConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("Search result cell didn't implement")
    }

    private func addUIElements() {
        contentView.addSubview(profileImageView)
        contentView.addSubview(searchResultBodyView)
    }
}

// MARK: - configureModel
extension SearchResultCell {
    func configure(with model: SearchResultCellViewModel) {
        let imageUrl = URL(string: model.profileImagePath)
        profileImageView.sd_setImage(with: imageUrl)
        searchResultBodyView.usernameLabel.text = model.username
        searchResultBodyView.nameSurnameLabel.text = model.nameSurname
    }
}

// MARK: - configureConstraints
extension SearchResultCell {
    private func configureConstraints() {
        let profileImageViewConstraints: [NSLayoutConstraint] = [
            profileImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            profileImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            profileImageView.widthAnchor.constraint(equalToConstant: profileImageViewSize),
            profileImageView.heightAnchor.constraint(equalToConstant: profileImageViewSize)
        ]

        let searchResultBodyViewConstraints: [NSLayoutConstraint] = [
            searchResultBodyView.centerYAnchor.constraint(equalTo: profileImageView.centerYAnchor),
            searchResultBodyView.leadingAnchor.constraint(equalTo: profileImageView.trailingAnchor, constant: 10),
            searchResultBodyView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            searchResultBodyView.heightAnchor.constraint(equalToConstant: 40)
        ]

        NSLayoutConstraint.activate(profileImageViewConstraints)
        NSLayoutConstraint.activate(searchResultBodyViewConstraints)
    }
}
