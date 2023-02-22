//
//  SearchViewController.swift
//  InstagramClone
//
//  Created by Oğuzhan Kaymak on 5.01.2023.
//

import UIKit

class SearchViewController: UIViewController {
    var coordinator: SearchCoordinatorProtocol?

    private lazy var collectionView: UICollectionView = {
        let section = CompositionalLayoutSectionHelper.createSearchSection()
        let layout = UICollectionViewCompositionalLayout(section: section)

        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = Color.backgroundColor
        return collectionView
    }()

    private let searchController: UISearchController = {
        let controller = UISearchController(searchResultsController: SearchResultViewController())
        controller.searchBar.placeholder = "Search"
        return controller
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        configureNavigationBar()
        addUIElements()
        configureCollectionView()
        configureConstraints()
    }

    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        collectionView.reloadData()
    }

    private func addUIElements() {
        view.addSubview(collectionView)
    }

}

// MARK: - configureNavigationBar
extension SearchViewController {
    private func configureNavigationBar() {
        navigationItem.searchController = searchController
        searchController.searchResultsUpdater = self
        if #available(iOS 16.0, *) {
            navigationItem.preferredSearchBarPlacement = .stacked
        }
    }
}

// MARK: - configureCollectionView
extension SearchViewController {
    private func configureCollectionView() {
        collectionView.dataSource = self
        collectionView.delegate = self
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

            return cell
        }
    }
}

extension SearchViewController: UICollectionViewDelegate {
    func collectionView(
        _ collectionView: UICollectionView,
        willDisplay cell: UICollectionViewCell,
        forItemAt indexPath: IndexPath
    ) {

        let discoverData = discoversData[indexPath.row]

        switch discoverData.contentType {
        case .image:
            break
        case .video:
            if let videoUrl = URL(string: discoverData.contentPath) {
                (cell as? DiscoverVideoCell)?.createVideoPlayer(with: videoUrl)
            }
        }
    }

    func collectionView(
        _ collectionView: UICollectionView,
        didEndDisplaying cell: UICollectionViewCell,
        forItemAt indexPath: IndexPath
    ) {
        (cell as? DiscoverVideoCell)?.removeVideoPlayer()
    }
}

// MARK: - UpdateSearchResults
extension SearchViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        let searchBar = searchController.searchBar
        guard let searchText = searchBar.text,
            let searchResultViewController = searchController.searchResultsController as? SearchResultViewController
        else {
            return
        }

        if (!searchText.trimmingCharacters(in: .whitespaces).isEmpty &&
             searchText.trimmingCharacters(in: .whitespaces).count >= 3) {

            searchResultViewController.searchedUsers = usersData.filter({ user in
                return user.username.lowercased().contains(searchText.lowercased()) ||
                user.nameSurname.lowercased().contains(searchText.lowercased())
            })

            searchResultViewController.collectionView.reloadData()
        } else {
            searchResultViewController.searchedUsers.removeAll()
            searchResultViewController.collectionView.reloadData()
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
