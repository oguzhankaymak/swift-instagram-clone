//
//  TitleAndCountLabelView.swift
//  InstagramClone
//
//  Created by Oğuzhan Kaymak on 2.02.2023.
//

import UIKit

final class TitleAndCountLabelView: UIView {

    lazy var countLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = AppFont.postTitle
        label.textColor = Color.label
        label.text = "12"
        return label
    }()

    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = AppFont.postText
        label.textColor = Color.label
        label.text = "Posts"
        return label
    }()

    // MARK: - init
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
        addUIElements()
        configureConstraints()
    }

    convenience init(titleLabelText: String) {
        self.init(frame: .zero)
        titleLabel.text = titleLabelText
    }

    required init?(coder: NSCoder) {
        fatalError("ProfileCountAndTitleLabelView has not been implemented")
    }

    private func configure() {
        translatesAutoresizingMaskIntoConstraints = false
    }

    private func addUIElements() {
        addSubview(countLabel)
        addSubview(titleLabel)
    }
}

// MARK: - configureConstraints
extension TitleAndCountLabelView {
    private func configureConstraints() {

        let countLabelConstraints: [NSLayoutConstraint] = [
            countLabel.centerXAnchor.constraint(equalTo: centerXAnchor)
        ]

        let titleLabelConstraints: [NSLayoutConstraint] = [
            titleLabel.topAnchor.constraint(equalTo: countLabel.bottomAnchor, constant: 4),
            titleLabel.centerXAnchor.constraint(equalTo: centerXAnchor)
        ]

        NSLayoutConstraint.activate(countLabelConstraints)
        NSLayoutConstraint.activate(titleLabelConstraints)
    }
}
