//
//  ReelsViewController.swift
//  InstagramClone
//
//  Created by Oğuzhan Kaymak on 5.01.2023.
//

import UIKit

class ReelsViewController: UIViewController {

    private lazy var collectionView: UICollectionView = {
        let section = CompositionalLayoutSectionHelper.createReelsSection()
        let layout = UICollectionViewCompositionalLayout(section: section)

        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = Color.black
        collectionView.isPagingEnabled = true
        collectionView.contentInsetAdjustmentBehavior = .never
        return collectionView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        configureNavigationBar()
        addUIElements()
        configureCollectionView()
        configureConstraints()
    }

    private func addUIElements() {
        view.addSubview(collectionView)

    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        if(self.traitCollection.userInterfaceStyle == .light) {
            tabBarController?.tabBar.barTintColor = .black
            tabBarController?.tabBar.tintColor = Color.white
        }
    }

    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        collectionView.reloadData()

        if(self.traitCollection.userInterfaceStyle == .light) {
            tabBarController?.tabBar.barTintColor = Color.backgroundColor
            tabBarController?.tabBar.tintColor = Color.label
        }

    }
}

// MARK: - configureNavigationBar
extension ReelsViewController {
    private func configureNavigationBar() {
        navigationController?.setNavigationBarHidden(true, animated: true)
        navigationController?.navigationBar.isHidden = true
    }
}

// MARK: - configureCollectionView
extension ReelsViewController {
    private func configureCollectionView() {
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(ReelCell.self, forCellWithReuseIdentifier: ReelCell.identifier)
    }
}

// MARK: - UICollectionViewDataSource
extension ReelsViewController: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return reelsData.count
    }

    func collectionView(
        _ collectionView: UICollectionView,
        cellForItemAt indexPath: IndexPath
    ) -> UICollectionViewCell {

        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: ReelCell.identifier,
            for: indexPath
        ) as? ReelCell else {
            return UICollectionViewCell()

        }

        let currentReel = reelsData[indexPath.row]

        let model = ReelCellViewModel(
            username: currentReel.username,
            profileImageUrl: currentReel.profileImageUrl,
            videoPath: currentReel.videoPath,
            description: currentReel.description,
            likeCount: currentReel.likeCount,
            commentCount: currentReel.commentCount
        )

        cell.configure(with: model)
        return cell
    }
}

// MARK: - UICollectionViewDelegate
extension ReelsViewController: UICollectionViewDelegate {
    func collectionView(
        _ collectionView: UICollectionView,
        willDisplay cell: UICollectionViewCell,
        forItemAt indexPath: IndexPath
    ) {
        let currentReel = reelsData[indexPath.row]
        if let videoUrl = URL(string: currentReel.videoPath) {
            (cell as? ReelCell)?.createVideoPlayer(with: videoUrl)
        }
    }
    func collectionView(
        _ collectionView: UICollectionView,
        didEndDisplaying cell: UICollectionViewCell,
        forItemAt indexPath: IndexPath
    ) {
        (cell as? ReelCell)?.removeVideoPlayer()
    }
}

// MARK: - configureConstraints
extension ReelsViewController {
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
