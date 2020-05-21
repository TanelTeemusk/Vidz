//
//  VideoDetails.swift
//  Vidz
//
//  Created by Tanel Teemusk on 19.05.2020.
//  Copyright © 2020 Teemusk. All rights reserved.
//

import SwiftUI

enum DownloadButtonStates {
    case initial
    case downloading
    case downloaded
}

struct VideoDetails: View {
    var data: VideoItemData
    var downloader = VideoDownloader()
    var playerView = PlayerView()
    
    @State var buttonState : DownloadButtonStates = .initial
    
    var body: some View {
        stateUpdated()
        return VStack {
            self.playerView
            Text(self.data.videoDescription)
                .font(.caption)
            Spacer()
            if self.buttonState == .initial {
                DownloadButtonView(state: $buttonState)
            } else if self.buttonState == .downloading {
                DownloadProgressBarView(state: $buttonState, progress: downloader.progress)
            } else if self.buttonState == .downloaded {
                Text("Video downloaded")
                    
            }
        }
        .navigationBarTitle(Text("\(data.name)"))
        .onAppear() {
            print("Video Details onAppear")
            self.buttonState = self.getDownloadState()
            self.playerView.videoPlayer.urlString = self.data.url
            self.playerView.videoPlayer.play()
        }
        .onDisappear() {
            self.downloader.cancel()
            self.playerView.videoPlayer.cancel()
        }
        
    }
    
    func stateUpdated() {
        switch buttonState {
        case .initial:
            downloader.cancel()
        case .downloading:
            downloader.load(from: self.data.url) {
                self.buttonState = .downloaded
            }
        case .downloaded:
            break
        }
    }
    
    func getDownloadState() -> DownloadButtonStates {
        return FileHandler.fileExists(with: self.data.url) ? .downloaded : .initial
    }
}

struct VideoDetails_Previews: PreviewProvider {
    static var previews: some View {
        VideoDetails(data: VideoItemData(id: 0, name: "unnamed", videoDescription: "hello", thumbnailUrl: "rainbowlake", url: "https://teemusk.com/temp/videos/04.mp4"))
    }
}
