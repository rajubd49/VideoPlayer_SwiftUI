//
//  LocalVideoView.swift
//  VideoPlayer_SwiftUI
//
//  Created by Raju on 1/6/20.
//  Copyright © 2020 Raju. All rights reserved.
//

import SwiftUI
import AVKit

struct LocalVideoView: View {
    @State private var player = AVPlayer()
    
    var body: some View {
        PlayerViewController(player: $player)
            .frame(height: 300, alignment: .center)
            .onAppear {
                if self.player.currentItem == nil, let path = Bundle.main.path(forResource: "background", ofType: "mp4") {
                    self.player.replaceCurrentItem(with: AVPlayerItem(url: URL(fileURLWithPath: path)))
                }
                self.player.play()
            }
            .onDisappear {
                self.player.pause()
            }
    }
}

struct LocalVideoView_Previews: PreviewProvider {
    static var previews: some View {
        LocalVideoView()
        .previewLayout(.sizeThatFits)
    }
}
