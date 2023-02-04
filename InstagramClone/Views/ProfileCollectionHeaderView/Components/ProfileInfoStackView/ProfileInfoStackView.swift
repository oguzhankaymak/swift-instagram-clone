//
//  ProfileInfoStackView.swift
//  InstagramClone
//
//  Created by Oğuzhan Kaymak on 2.02.2023.
//

import UIKit

final class ProfileInfoStackView: UIStackView {

    lazy var postCountView = TitleAndCountLabelView(titleLabelText: "Posts")
    lazy var followersCountView = TitleAndCountLabelView(titleLabelText: "Followers")
    lazy var followingCountView = TitleAndCountLabelView(titleLabelText: "Following")

    // MARK: - init
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
        addUIElements()
        configureConstraints()
    }

    required init(coder: NSCoder) {
        fatalError("ProfileInfoStackView has not been implemented")
    }

    private func configure() {
        translatesAutoresizingMaskIntoConstraints = false
        distribution = .fillProportionally
        axis = .horizontal
        alignment = .center

        postCountView.countLabel.text = "20"
        followersCountView.countLabel.text = "754"
        followingCountView.countLabel.text = "564"
    }

    private func addUIElements() {
        addArrangedSubview(postCountView)
        addArrangedSubview(followersCountView)
        addArrangedSubview(followingCountView)
    }
}

// MARK: - configureConstraints
extension ProfileInfoStackView {
    private func configureConstraints() {

        let postCountViewConstraints: [NSLayoutConstraint] = [
            postCountView.heightAnchor.constraint(equalToConstant: self.frame.height / 6)
        ]

        let followersCountViewConstraints: [NSLayoutConstraint] = [
            followersCountView.heightAnchor.constraint(equalToConstant: self.frame.height / 6)
        ]

        let followingCountViewConstraints: [NSLayoutConstraint] = [
            followingCountView.heightAnchor.constraint(equalToConstant: self.frame.height / 6)
        ]

        NSLayoutConstraint.activate(postCountViewConstraints)
        NSLayoutConstraint.activate(followersCountViewConstraints)
        NSLayoutConstraint.activate(followingCountViewConstraints)
    }
}
