//
//  ProfileViewController.swift
//  InstagramClone
//
//  Created by Oğuzhan Kaymak on 5.01.2023.
//

import UIKit

class ProfileViewController: UIViewController {
    var coordinator: ProfileCoordinatorProtocol?

    private lazy var collectionView: UICollectionView = {
        let section = CompositionalLayoutSectionHelper.createProfilePostSection()
        let layout = UICollectionViewCompositionalLayout(section: section)

        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = Color.backgroundColor
        return collectionView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = Color.backgroundColor
        configureNavigationBar()
        addUIElements()
        configureConstraints()
        configureCollectionView()
    }

    private func addUIElements() {
        view.addSubview(collectionView)
    }
}

// MARK: - configureNavigationBar
extension ProfileViewController {
    private func configureNavigationBar() {
        navigationController?.navigationBar.tintColor = .label
        navigationController?.navigationBar.backgroundColor = Color.backgroundColor

        let label = UILabel()
        label.textColor = Color.label
        label.text = "oguzhankaymakk"
        label.font = AppFont.navigationTitle

        navigationItem.leftBarButtonItem = UIBarButtonItem.init(customView: label)

        let plusImage = UIImage(
            systemName: "plus.square",
            withConfiguration: UIImage.SymbolConfiguration(pointSize: 16)
        )

        let plusBarButtonItem = UIBarButtonItem(
            image: plusImage,
            style: .plain,
            target: self,
            action: #selector(console)
        )

        let menuImage = UIImage(
            systemName: "text.justify",
            withConfiguration: UIImage.SymbolConfiguration(pointSize: 16)
        )

        let menuBarButtonItem = UIBarButtonItem(
            image: menuImage,
            style: .plain,
            target: self,
            action: #selector(console)
        )

        navigationItem.rightBarButtonItems = [menuBarButtonItem, plusBarButtonItem ]
    }

    @objc private func console() {
        print("click")
    }
}

// MARK: - configureCollectionView
extension ProfileViewController {
    private func configureCollectionView() {
        collectionView.delegate = self
        collectionView.dataSource = self

        collectionView.register(
            ProfileCollectionReusableHeaderView.self,
            forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
            withReuseIdentifier: ProfileCollectionReusableHeaderView.identifier
        )
        collectionView.register(ProfilePostCell.self, forCellWithReuseIdentifier: ProfilePostCell.identifier )
    }
}

// MARK: - UICollectionViewDataSource
extension ProfileViewController: UICollectionViewDataSource, UICollectionViewDelegate {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return postsData.count
    }

    func collectionView(
        _ collectionView: UICollectionView,
        cellForItemAt indexPath: IndexPath
    ) -> UICollectionViewCell {

        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: ProfilePostCell.identifier,
            for: indexPath
        ) as? ProfilePostCell else { return UICollectionViewCell()}

        let currentPost = postsData[indexPath.row]

        cell.configure(with: ProfilePostCellViewModel(imagePath: currentPost.imagePath))
        return cell
    }

    func collectionView(
        _ collectionView: UICollectionView,
        viewForSupplementaryElementOfKind kind: String,
        at indexPath: IndexPath
    ) -> UICollectionReusableView {
        guard let headerView = collectionView.dequeueReusableSupplementaryView(
            ofKind: UICollectionView.elementKindSectionHeader,
            withReuseIdentifier: ProfileCollectionReusableHeaderView.identifier,
            for: indexPath
        ) as? ProfileCollectionReusableHeaderView else { return UICollectionViewCell() }

        headerView.configure(with: "https://www.oguzhankaymak.net/oguzhankaymak.jpg")
        headerView.delegate = self

        return headerView
    }
}

extension ProfileViewController: ProfileCollectionReusableHeaderViewDelegate {
    func shareProfileButtonTap() {
        print("shareProfileButtonTap")
    }

    func suggestFriendButtonDidTap() {
        print("suggestFriendButtonDidTap")
    }

    func editProfileButtonDidTap() {
        print("editProfileButtonDidTap")
    }
}

// MARK: - configureConstraints
extension ProfileViewController {
    private func configureConstraints() {
        let collectionViewConstraints: [NSLayoutConstraint] = [
            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ]

        NSLayoutConstraint.activate(collectionViewConstraints)
    }
}
