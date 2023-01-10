//
//  DiscoverVideoCell.swift
//  InstagramClone
//
//  Created by Oğuzhan Kaymak on 10.01.2023.
//

import UIKit
import AVKit
import AVFoundation

class DiscoverVideoCell: UICollectionViewCell {
    static let identifier = "discover-video-cell-identifier"

    private var player: AVPlayer!

    private lazy var avpController: AVPlayerViewController = {
        let controller = AVPlayerViewController()
        controller.view.translatesAutoresizingMaskIntoConstraints = false
        controller.showsPlaybackControls = false
        return controller
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
    }

    required init?(coder: NSCoder) {
        fatalError("Discover video cell didn't not implemented")
    }

    private func createVideoPlayer(videoUrl: URL) {
        player = AVPlayer(url: videoUrl)
        avpController.player = player
        player.play()
        contentView.addSubview(avpController.view)
        configureConstraints()
    }
}

// MARK: - configureModel
extension DiscoverVideoCell {
    func configure(with discoverVideoCellModel: DiscoverVideoCellViewModel) {
        guard let videoUrl = URL(string: discoverVideoCellModel.videoPath) else {
            return
        }

        createVideoPlayer(videoUrl: videoUrl)
    }
}

// MARK: - configureConstraints
extension DiscoverVideoCell {
    private func configureConstraints() {
        let videoPlayerViewViewConstraints: [NSLayoutConstraint] = [
            avpController.view.topAnchor.constraint(equalTo: contentView.topAnchor),
            avpController.view.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            avpController.view.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            avpController.view.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ]

        NSLayoutConstraint.activate(videoPlayerViewViewConstraints)
    }
}
