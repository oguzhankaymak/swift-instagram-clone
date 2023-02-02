//
//  SearchResultCellBodyView.swift
//  InstagramClone
//
//  Created by Oğuzhan Kaymak on 30.01.2023.
//

import UIKit

final class SearchResultCellBodyView: UIView {

    lazy var usernameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = AppFont.postSmallBoldText
        label.textColor = Color.label
        return label
    }()

    lazy var nameSurnameLabel: UILabel = {
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
        fatalError("SearchResultCellBody has not been implemented")
    }

    private func configure() {
        translatesAutoresizingMaskIntoConstraints = false
    }

    private func addUIElements() {
        addSubview(usernameLabel)
        addSubview(nameSurnameLabel)
    }
}

// MARK: - configureConstraints
extension SearchResultCellBodyView {
    private func configureConstraints() {
        let usernameLabelConstraints: [NSLayoutConstraint] = [
            usernameLabel.topAnchor.constraint(equalTo: topAnchor),
            usernameLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            usernameLabel.trailingAnchor.constraint(equalTo: trailingAnchor)
        ]

        let nameSurnameLabelConstraints: [NSLayoutConstraint] = [
            nameSurnameLabel.topAnchor.constraint(equalTo: usernameLabel.bottomAnchor, constant: 2),
            nameSurnameLabel.leadingAnchor.constraint(equalTo: usernameLabel.leadingAnchor)
        ]

        NSLayoutConstraint.activate(usernameLabelConstraints)
        NSLayoutConstraint.activate(nameSurnameLabelConstraints)
    }
}
