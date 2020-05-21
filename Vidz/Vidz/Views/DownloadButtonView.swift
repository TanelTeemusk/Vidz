//
//  DownloadViews.swift
//  Vidz
//
//  Created by Tanel Teemusk on 20.05.2020.
//  Copyright © 2020 Teemusk. All rights reserved.
//

import SwiftUI

struct DownloadButtonView: View {
    
    @Binding var state : DownloadButtonStates

    var body: some View {
        Button(action: {
            self.state = .downloading
        }) {
            HStack {
                Text("Download")
            } //Button hstack
            .frame(minWidth: 0, maxWidth: 240)
            .padding(10)
            .foregroundColor(Color.white)
            .background(Color.primary)
            .cornerRadius(40)
        } //Button
    }
}


struct DownloadButtonView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            DownloadButtonView(state: .constant(.initial))
        }.previewLayout(.fixed(width: 350, height: 70))
    }
}
