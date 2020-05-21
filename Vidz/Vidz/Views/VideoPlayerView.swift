//
//  VideoPlayerView.swift
//  Vidz
//
//  Created by Tanel Teemusk on 19.05.2020.
//  Copyright © 2020 Teemusk. All rights reserved.
//

import UIKit
import AVKit

class VideoPlayerView: UIView {

    private let playerLayer = AVPlayerLayer()
    
    var urlString: String = "" {
        didSet {
            if oldValue == urlString { return }
            initPlayer(with: urlString)
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.black
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        playerLayer.frame = bounds
    }
    
    private func initPlayer(with urlString: String) {
        guard let url = FileHandler.getFileLocation(with: urlString) else {
            return
        }
        
        let player = AVPlayer(url: url)
        player.actionAtItemEnd = .none
        
        player.volume = 0.2
        playerLayer.player = player
        layer.addSublayer(playerLayer)
        
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(playerItemDidReachEnd(notification:)),
                                               name: .AVPlayerItemDidPlayToEndTime,
                                               object: player.currentItem)
    }
    
    func play() {
        playerLayer.player?.play()
    }
    
    func cancel() {
        playerLayer.player?.pause()
//        playerLayer.player?.replaceCurrentItem(with: nil)
//        playerLayer.player = nil
//        playerLayer.removeFromSuperlayer()
//        NotificationCenter.default.removeObserver(self)
        print("Player killed")
    }
    
    @objc func playerItemDidReachEnd(notification: Notification) {
        if let playerItem = notification.object as? AVPlayerItem {
            playerItem.seek(to: CMTime.zero, completionHandler: nil)
            print("Video looped")
        }
    }
    
    deinit {
        print("\(self) deinit")
        cancel()
    }
}
