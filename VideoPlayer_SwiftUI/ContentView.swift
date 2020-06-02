//
//  ContentView.swift
//  VideoPlayer_SwiftUI
//
//  Created by Raju on 1/6/20.
//  Copyright © 2020 Raju. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            LocalVideoView()
                .tabItem {
                    Image(systemName: "video")
                    Text("Local Video")
                }

            RemoteVideoView()
                .tabItem {
                    Image(systemName: "video.fill")
                    Text("Remote Video")
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
        .previewLayout(.sizeThatFits)
    }
}
