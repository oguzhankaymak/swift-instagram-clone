//
//  SearchViewController.swift
//  InstagramClone
//
//  Created by Oğuzhan Kaymak on 5.01.2023.
//

import UIKit

class SearchViewController: UIViewController {

    private lazy var collectionView: UICollectionView = {
        let section = CompositionalLayoutSectionHelper.createSearchSection()
        let layout = UICollectionViewCompositionalLayout(section: section)

        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = .systemBackground
        return collectionView
    }()

    private let searchController: UISearchController = {
        let controller = UISearchController()
        controller.searchBar.placeholder = "Search"
        controller.searchBar.searchBarStyle = .minimal
        return controller
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.searchController = searchController
        addUIElements()
        configureCollectionView()
        configureConstraints()
    }

    private func addUIElements() {
        view.addSubview(collectionView)
    }

}

// MARK: - configureCollectionView
extension SearchViewController {
    private func configureCollectionView() {
        collectionView.dataSource = self
        collectionView.register(DiscoverImageCell.self, forCellWithReuseIdentifier: DiscoverImageCell.identifier)
        collectionView.register(DiscoverVideoCell.self, forCellWithReuseIdentifier: DiscoverVideoCell.identifier)
    }
}

// MARK: - UICollectionViewDataSource
extension SearchViewController: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return discoversData.count
    }

    func collectionView(
        _ collectionView: UICollectionView,
        cellForItemAt indexPath: IndexPath
    ) -> UICollectionViewCell {

        let discoverData = discoversData[indexPath.row]

        switch discoverData.contentType {
        case .image:
            guard let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: DiscoverImageCell.identifier,
                for: indexPath
            ) as? DiscoverImageCell else {
                return UICollectionViewCell()

            }

            cell.configure(with: DiscoverImageCellViewModel(imagePath: discoverData.contentPath))
            return cell
        case .video:
            guard let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: DiscoverVideoCell.identifier,
                for: indexPath
            ) as? DiscoverVideoCell else {
                return UICollectionViewCell()

            }

            cell.configure(with: DiscoverVideoCellViewModel(videoPath: discoverData.contentPath))
            return cell
        }

    }
}

// MARK: - configureConstraints
extension SearchViewController {
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
