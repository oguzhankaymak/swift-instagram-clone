//
//  ReelCell.swift
//  InstagramClone
//
//  Created by Oğuzhan Kaymak on 11.01.2023.
//

import UIKit
import AVKit
import AVFoundation

class ReelCell: UICollectionViewCell {
    static let identifier = "reel-cell-identifier"

    private var queuePlayer: AVQueuePlayer?
    private var avPlayerLayer: AVPlayerLayer?
    private var avPlayerLooper: AVPlayerLooper?
    private var playerItemStatusObserver: NSKeyValueObservation?

    private lazy var activityIndicatorView: UIActivityIndicatorView = {
        let view = UIActivityIndicatorView(style: .medium)
        view.center = contentView.center
        return view
    }()

    private lazy var operationsView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.isHidden = true
        return view
    }()

    private lazy var cameraButton: UIButton = {
        let iconImage = UIImage(
            systemName: "camera",
            withConfiguration: UIImage.SymbolConfiguration(pointSize: 18, weight: .bold)
        )

        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(iconImage, for: .normal)
        button.tintColor = Color.label
        return button
    }()

    private lazy var likeButton: UIButton = {
        let iconImage = UIImage(
            systemName: "heart",
            withConfiguration: UIImage.SymbolConfiguration(pointSize: 18, weight: .bold)
        )

        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(iconImage, for: .normal)
        button.tintColor = Color.label
        return button
    }()

    private lazy var likeCountLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = AppFont.postText
        label.textColor = Color.label
        return label
    }()

    private lazy var commentButton: UIButton = {
        let iconImage = UIImage(
            systemName: "bubble.right",
            withConfiguration: UIImage.SymbolConfiguration(pointSize: 18, weight: .bold)
        )

        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(iconImage, for: .normal)
        button.tintColor = Color.label
        return button
    }()

    private lazy var commentCountLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = AppFont.postText
        label.textColor = Color.label
        return label
    }()

    private lazy var shareButton: UIButton = {
        let iconImage = UIImage(
            systemName: "paperplane",
            withConfiguration: UIImage.SymbolConfiguration(pointSize: 18, weight: .bold)
        )

        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(iconImage, for: .normal)
        button.tintColor = Color.label
        return button
    }()

    private lazy var detailsButton: UIButton = {
        let iconImage = UIImage(
            systemName: "ellipsis",
            withConfiguration: UIImage.SymbolConfiguration(pointSize: 16, weight: .bold)
        )

        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(iconImage, for: .normal)
        button.tintColor = Color.label
        return button
    }()

    private lazy var bottomView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.isHidden = true
        return view
    }()

    private lazy var profileImageView: UIImageView = {
        var imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.layer.cornerRadius = 18
        imageView.layer.masksToBounds = true
        return imageView
    }()

    private lazy var usernameLabel: UILabel = {
        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = AppFont.postTitle
        label.textColor = Color.label
        return label
    }()

    private lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = Color.label
        label.font = AppFont.postSmallText
        return label
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
    }

    required init?(coder: NSCoder) {
        fatalError("Reel cell didn't not implemented")
    }

    // MARK: - Public funcs
    public func removeVideoPlayer() {
        avPlayerLayer?.removeFromSuperlayer()
        avPlayerLayer = nil
        queuePlayer = nil
        avPlayerLooper = nil
        playerItemStatusObserver = nil
        contentView.subviews.forEach({ $0.removeFromSuperview() })
    }

    public func createVideoPlayer(with videoURL: URL) {
        contentView.addSubview(activityIndicatorView)
        activityIndicatorView.startAnimating()
        let asset: AVAsset = AVAsset(url: videoURL)
        let playerItem = AVPlayerItem(asset: asset)
        queuePlayer = AVQueuePlayer(playerItem: playerItem)

        guard let player = queuePlayer else { return }

        avPlayerLooper = AVPlayerLooper(
            player: player,
            templateItem: playerItem
        )

        avPlayerLayer = AVPlayerLayer(player: queuePlayer)
        avPlayerLayer?.frame = contentView.bounds
        avPlayerLayer?.videoGravity = .resizeAspectFill

        playerItemStatusObserver = playerItem.observe(
            \.status,
             options: [.old, .new],
             changeHandler: { [weak self] playerItem, _ in
            if playerItem.status == .readyToPlay {
                self?.activityIndicatorView.stopAnimating()
                self?.operationsView.isHidden = false
                self?.bottomView.isHidden = false
            }
        })

        guard let layer = avPlayerLayer else { return }
        contentView.layer.addSublayer(layer)
        addUIElements()
        playVideo()
    }

    private func playVideo() {
        queuePlayer?.play()
    }

    private func addUIElements() {
        contentView.addSubview(operationsView)
        operationsView.addSubview(cameraButton)
        operationsView.addSubview(likeButton)
        operationsView.addSubview(likeCountLabel)
        operationsView.addSubview(commentButton)
        operationsView.addSubview(commentCountLabel)
        operationsView.addSubview(shareButton)
        operationsView.addSubview(detailsButton)
        contentView.addSubview(bottomView)
        bottomView.addSubview(profileImageView)
        bottomView.addSubview(usernameLabel)
        bottomView.addSubview(descriptionLabel)
        configureConstraints()
    }
}

// MARK: - configureModel
extension ReelCell {
    func configure(with model: ReelCellViewModel) {
        let profileImageUrl = URL(string: model.profileImageUrl)
        profileImageView.sd_setImage(with: profileImageUrl)
        usernameLabel.text = model.username
        descriptionLabel.text = model.description
        likeCountLabel.text = model.likeCount
        commentCountLabel.text = model.commentCount
    }
}

// MARK: - configureConstraints
extension ReelCell {
    private func configureConstraints() {
        let operationsViewConstraints: [NSLayoutConstraint] = [
            operationsView.topAnchor.constraint(equalTo: contentView.topAnchor),
            operationsView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            operationsView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor)
        ]

        let cameraButtonConstraints: [NSLayoutConstraint] = [
            cameraButton.topAnchor.constraint(
                equalTo: operationsView.topAnchor,
                constant: contentView.frame.size.height / 12
            ),
            cameraButton.trailingAnchor.constraint(equalTo: operationsView.trailingAnchor, constant: -20)
        ]

        let likeButtonConstraints: [NSLayoutConstraint] = [
            likeButton.centerYAnchor.constraint(equalTo: operationsView.centerYAnchor, constant: 50),
            likeButton.trailingAnchor.constraint(equalTo: operationsView.trailingAnchor, constant: -20)
        ]

        let likeCountLabelConstraints: [NSLayoutConstraint] = [
            likeCountLabel.topAnchor.constraint(equalTo: likeButton.bottomAnchor, constant: 8),
            likeCountLabel.centerXAnchor.constraint(equalTo: likeButton.centerXAnchor)
        ]

        let commentButtonConstraints: [NSLayoutConstraint] = [
            commentButton.topAnchor.constraint(equalTo: likeCountLabel.bottomAnchor, constant: 30),
            commentButton.trailingAnchor.constraint(
                equalTo: operationsView.trailingAnchor,
                constant: -20
            )
        ]

        let commentCountLabelConstraints: [NSLayoutConstraint] = [
            commentCountLabel.topAnchor.constraint(equalTo: commentButton.bottomAnchor, constant: 8),
            commentCountLabel.centerXAnchor.constraint(equalTo: commentButton.centerXAnchor)
        ]

        let shareButtonConstraints: [NSLayoutConstraint] = [
            shareButton.topAnchor.constraint(equalTo: commentCountLabel.bottomAnchor, constant: 30),
            shareButton.trailingAnchor.constraint(
                equalTo: operationsView.trailingAnchor,
                constant: -20
            )
        ]

        let detailsButtonConstraints: [NSLayoutConstraint] = [
            detailsButton.topAnchor.constraint(equalTo: shareButton.bottomAnchor, constant: 30),
            detailsButton.trailingAnchor.constraint(
                equalTo: operationsView.trailingAnchor,
                constant: -20
            )
        ]

        let bottomViewConstraints: [NSLayoutConstraint] = [
            bottomView.bottomAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.bottomAnchor),
            bottomView.heightAnchor.constraint(equalToConstant: 100),
            bottomView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20)
        ]

        let profileImageViewConstraints: [NSLayoutConstraint] = [
            profileImageView.topAnchor.constraint(equalTo: bottomView.topAnchor),
            profileImageView.leadingAnchor.constraint(equalTo: bottomView.leadingAnchor),
            profileImageView.widthAnchor.constraint(equalToConstant: 36),
            profileImageView.heightAnchor.constraint(equalToConstant: 36)
        ]

        let usernameLabelConstraints: [NSLayoutConstraint] = [
            usernameLabel.centerYAnchor.constraint(equalTo: profileImageView.centerYAnchor),
            usernameLabel.leadingAnchor.constraint(equalTo: profileImageView.trailingAnchor, constant: 10)
        ]

        let descriptionLabelConstraints: [NSLayoutConstraint] = [
            descriptionLabel.topAnchor.constraint(equalTo: profileImageView.bottomAnchor, constant: 10),
            descriptionLabel.leadingAnchor.constraint(equalTo: bottomView.leadingAnchor),
            descriptionLabel.trailingAnchor.constraint(equalTo: bottomView.trailingAnchor, constant: -40)
        ]

        NSLayoutConstraint.activate(cameraButtonConstraints)
        NSLayoutConstraint.activate(operationsViewConstraints)
        NSLayoutConstraint.activate(likeButtonConstraints)
        NSLayoutConstraint.activate(likeCountLabelConstraints)
        NSLayoutConstraint.activate(commentButtonConstraints)
        NSLayoutConstraint.activate(commentCountLabelConstraints)
        NSLayoutConstraint.activate(shareButtonConstraints)
        NSLayoutConstraint.activate(detailsButtonConstraints)
        NSLayoutConstraint.activate(bottomViewConstraints)
        NSLayoutConstraint.activate(profileImageViewConstraints)
        NSLayoutConstraint.activate(usernameLabelConstraints)
        NSLayoutConstraint.activate(descriptionLabelConstraints)
    }
}
