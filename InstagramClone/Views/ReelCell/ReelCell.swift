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
        let indicator = UIActivityIndicatorView(style: .medium)
        indicator.center = contentView.center
        indicator.color = Color.white
        return indicator
    }()

    private lazy var rightButtonsView = ReelCellRightButtonsView(
        frame: CGRect(
            x: 0,
            y: 0,
            width: contentView.frame.size.width,
            height: contentView.frame.size.height
        )
    )

    private lazy var reelFooterView = ReelCellFooterView(frame: .zero)

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
                self?.rightButtonsView.isHidden = false
                self?.reelFooterView.isHidden = false
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
        contentView.addSubview(rightButtonsView)
        contentView.addSubview(reelFooterView)
        configureConstraints()
    }
}

// MARK: - configureModel
extension ReelCell {
    func configure(with model: ReelCellViewModel) {
        rightButtonsView.likeCountLabel.text = model.likeCount
        rightButtonsView.commentCountLabel.text = model.commentCount

        let profileImageUrl = URL(string: model.profileImageUrl)
        reelFooterView.profileImageView.sd_setImage(with: profileImageUrl)
        reelFooterView.usernameLabel.text = model.username
        reelFooterView.descriptionLabel.text = model.description

    }
}

// MARK: - configureConstraints
extension ReelCell {
    private func configureConstraints() {
        let rightButtonsViewConstraints: [NSLayoutConstraint] = [
            rightButtonsView.topAnchor.constraint(
                equalTo: contentView.topAnchor,
                constant: contentView.frame.size.height / 16
            ),
            rightButtonsView.bottomAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.bottomAnchor),
            rightButtonsView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20)
        ]

        let reelFooterViewConstraints: [NSLayoutConstraint] = [
            reelFooterView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            reelFooterView.trailingAnchor.constraint(equalTo: rightButtonsView.leadingAnchor, constant: -20),
            reelFooterView.bottomAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.bottomAnchor),
            reelFooterView.heightAnchor.constraint(equalToConstant: 100)
        ]

        NSLayoutConstraint.activate(rightButtonsViewConstraints)
        NSLayoutConstraint.activate(reelFooterViewConstraints)
    }
}
