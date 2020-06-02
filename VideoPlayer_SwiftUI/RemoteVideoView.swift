//
//  RemoteVideoView.swift
//  VideoPlayer_SwiftUI
//
//  Created by Raju on 1/6/20.
//  Copyright © 2020 Raju. All rights reserved.
//

import SwiftUI
import AVKit

struct RemoteVideoView: View {
    @State private var player = AVPlayer(url: URL(string: "http://techslides.com/demos/sample-videos/small.mp4")!)
    
    var body: some View {
        PlayerViewController(player: $player)
            .frame(height: 300, alignment: .center)
            .onAppear {
                self.player.play()
            }
            .onDisappear {
                self.player.pause()
            }
    }
}

struct RemoteVideoView_Previews: PreviewProvider {
    static var previews: some View {
        RemoteVideoView()
        .previewLayout(.sizeThatFits)
    }
}
