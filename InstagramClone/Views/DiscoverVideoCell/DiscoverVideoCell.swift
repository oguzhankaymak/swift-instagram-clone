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

    private var queuePlayer: AVQueuePlayer?
    private var avPlayerLayer: AVPlayerLayer?
    private var avPlayerLooper: AVPlayerLooper?
    private var playerItemStatusObserver: NSKeyValueObservation?

    private lazy var activityIndicatorView: UIActivityIndicatorView = {
        let view = UIActivityIndicatorView()
        view.center = contentView.center
        return view
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
    }

    required init?(coder: NSCoder) {
        fatalError("Discover video cell didn't not implemented")
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
            }
        })

        guard let layer = avPlayerLayer else { return }
        contentView.layer.addSublayer(layer)
        playVideo()
    }

    private func playVideo() {
        queuePlayer?.play()
    }
}
