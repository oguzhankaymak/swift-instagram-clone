//
//  HomeViewController.swift
//  InstagramClone
//
//  Created by Oğuzhan Kaymak on 5.01.2023.
//

import UIKit

class HomeViewController: UIViewController {
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewCompositionalLayout { (sectionIndex, _) -> NSCollectionLayoutSection? in
            switch sectionIndex {
            case 0:
                return CompositionalLayoutSectionHelper.createStoriesSection()
            case 1:
                return CompositionalLayoutSectionHelper.createPostsSection()
            default:
                return nil
            }
        }

        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = .systemBackground
        return collectionView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        addUIElements()
        configureNavigationBar()
        configureCollectionView()
        configureConstraints()
    }

    private func addUIElements() {
        view.addSubview(collectionView)
    }
}

// MARK: - configureNavigationBar
extension HomeViewController {
    private func configureNavigationBar() {
        navigationController?.navigationBar.tintColor = .label
        navigationController?.navigationBar.backgroundColor = .systemBackground

        let label = UILabel()
        label.textColor = .label
        label.text = "Instagram"
        label.font = .systemFont(ofSize: 26, weight: .bold)

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

        let heartImage = UIImage(
            systemName: "heart",
            withConfiguration: UIImage.SymbolConfiguration(pointSize: 16)
        )

        let heartBarButtonItem = UIBarButtonItem(
            image: heartImage,
            style: .plain,
            target: self,
            action: #selector(console)
        )

        let messageImage = UIImage(
            systemName: "text.bubble",
            withConfiguration: UIImage.SymbolConfiguration(pointSize: 16)
        )

        let messageBarButtonItem = UIBarButtonItem(
            image: messageImage,
            style: .plain,
            target: self,
            action: #selector(console)
        )

        navigationItem.rightBarButtonItems = [plusBarButtonItem, heartBarButtonItem, messageBarButtonItem]
    }

    @objc private func console() {
        print("click")
    }
}

// MARK: - configureCollectionView
extension HomeViewController {
    private func configureCollectionView() {
        collectionView.dataSource = self
        collectionView.register(StoryCell.self, forCellWithReuseIdentifier: StoryCell.identifier)
        collectionView.register(PostCell.self, forCellWithReuseIdentifier: PostCell.identifier)
    }
}

// MARK: - UICollectionViewDataSource
extension HomeViewController: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch section {
        case 0:
            return storiesData.count
        case 1:
            return postsData.count
        default:
            return 0
        }
    }

    func collectionView(
        _ collectionView: UICollectionView,
        cellForItemAt indexPath: IndexPath
    ) -> UICollectionViewCell {

        switch indexPath.section {
        case 0:
            guard let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: StoryCell.identifier,
                for: indexPath
            ) as? StoryCell else {
                return UICollectionViewCell()
            }

            let story = storiesData[indexPath.row]
            let storyCellModel: StoryCellViewModel = StoryCellViewModel(
                username: story.username,
                imagePath: story.imagePath
            )
            cell.configure(with: storyCellModel)

            return cell
        case 1:
            guard let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: PostCell.identifier,
                for: indexPath
            ) as? PostCell else {
                return UICollectionViewCell()
            }

            let post =  postsData[indexPath.row]
            let postCellModel: PostCellViewModel = PostCellViewModel(
                username: post.username,
                profileImagePath: post.profileImagePath,
                imagePath: post.imagePath,
                likeCount: post.likeCount,
                commentCount: post.commentCount,
                description: post.description,
                dateDesc: post.dateDesc
            )
            cell.configure(with: postCellModel)

            return cell
        default:
            return UICollectionViewCell()
        }
    }
}

// MARK: - configureConstraints
extension HomeViewController {
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
