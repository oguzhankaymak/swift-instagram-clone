//
//  SearchResultViewController.swift
//  InstagramClone
//
//  Created by Oğuzhan Kaymak on 11.01.2023.
//

import UIKit

class SearchResultViewController: UIViewController {

    public var searchedUsers: [User] = [User]()

    public lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = .init(width: view.frame.width, height: view.frame.height / 15)
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = Color.backgroundColor
        return collectionView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        addUIElements()
        configureCollectionView()
        configureConstraints()
    }

    private func addUIElements() {
        view.addSubview(collectionView)
    }
}

// MARK: - configureCollectionView
extension SearchResultViewController {
    private func configureCollectionView() {
        collectionView.dataSource = self
        collectionView.register(SearchResultCell.self, forCellWithReuseIdentifier: SearchResultCell.identifier)
    }
}

// MARK: - UICollectionViewDataSource
extension SearchResultViewController: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return searchedUsers.count
    }

    func collectionView(
        _ collectionView: UICollectionView,
        cellForItemAt indexPath: IndexPath
    ) -> UICollectionViewCell {

        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: SearchResultCell.identifier,
            for: indexPath
        ) as? SearchResultCell else {
            return UICollectionViewCell()

        }

        let user = searchedUsers[indexPath.row]

        cell.configure(with: SearchResultCellViewModel(
            username: user.username,
            nameSurname: user.nameSurname,
            profileImagePath: user.profileImagePath)
        )

        return cell

    }
}

// MARK: - configureConstraints
extension SearchResultViewController {
    private func configureConstraints() {
        let collectionViewConstraints: [NSLayoutConstraint] = [
            collectionView.topAnchor.constraint(equalTo: view.topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ]

        NSLayoutConstraint.activate(collectionViewConstraints)
    }
}
