//
//  PlayerView.swift
//  Vidz
//
//  Created by Tanel Teemusk on 19.05.2020.
//  Copyright © 2020 Teemusk. All rights reserved.
//

import SwiftUI

struct PlayerView: UIViewRepresentable {
    
    var urlString: String
    var videoPlayer = VideoPlayerView()
    
    func updateUIView(_ uiView: UIView, context: UIViewRepresentableContext<PlayerView>) {
    }
    
    func makeUIView(context: Context) -> UIView {
        videoPlayer.urlString = urlString
        return videoPlayer
    }
    
    
}
