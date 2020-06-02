//
//  PlayerViewController.swift
//  VideoPlayer_SwiftUI
//
//  Created by Raju on 1/6/20.
//  Copyright © 2020 Raju. All rights reserved.
//

import Foundation
import SwiftUI
import AVKit

struct PlayerViewController: UIViewControllerRepresentable {
    @Binding var player : AVPlayer
    
    func makeUIViewController(context: UIViewControllerRepresentableContext<PlayerViewController>) -> AVPlayerViewController {
        let controller = AVPlayerViewController()
        controller.player = player
//        controller.player?.isMuted = true
//        controller.showsPlaybackControls = false
//        controller.videoGravity = .resizeAspectFill
        self.autoReplayPlayer(player: player)
        self.updatePlayerStateOnAppActiveResign(player: player)
        return controller
    }

    func updateUIViewController(_ uiViewController: AVPlayerViewController, context: UIViewControllerRepresentableContext<PlayerViewController>) {}
    
    func autoReplayPlayer(player: AVPlayer) {
        NotificationCenter.default.addObserver(forName: NSNotification.Name.AVPlayerItemDidPlayToEndTime, object: player.currentItem, queue: .main) { notification in
            player.seek(to: CMTime.zero)
            player.play()
        }
    }
    
    func updatePlayerStateOnAppActiveResign(player: AVPlayer) {
        NotificationCenter.default.addObserver(forName: UIApplication.didBecomeActiveNotification, object: player.currentItem, queue: .main) { notification in
            if player.status == .readyToPlay && player.currentItem?.status == .readyToPlay {
                player.play()
            }
        }
        NotificationCenter.default.addObserver(forName: UIApplication.willResignActiveNotification, object: player.currentItem, queue: .main) { notification in
            player.pause()
        }
    }
}
