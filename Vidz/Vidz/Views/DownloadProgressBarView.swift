//
//  DownloadProgressBarView.swift
//  Vidz
//
//  Created by Tanel Teemusk on 20.05.2020.
//  Copyright © 2020 Teemusk. All rights reserved.
//

import SwiftUI
import Combine

struct DownloadProgressBarView: View {
    
    @Binding var state : DownloadButtonStates
    @ObservedObject var progress: Progress

    var body: some View {
        HStack {
            ZStack {
                Circle()
                    .trim(from: 0, to: 1)
                    .stroke(Color(UIColor(white: 0.84, alpha: 1)), lineWidth:4)
                Circle()
                    .trim(from: 0, to: CGFloat(progress.progress))
                    .stroke(Color.black, lineWidth:4)
                    .rotationEffect(Angle(degrees:-90))
            }.frame(width: 30, height: 30, alignment: .center)
            Button(action: {
                self.state = .initial
            }) {
                HStack {
                    Text("Cancel download")
                } //Button hstack
                    .frame(minWidth: 0, maxWidth: 240)
                    .padding(10)
                    .foregroundColor(Color.white)
                    .background(Color.primary)
                    .cornerRadius(40)
            } //Button
        } //Hstack
    }
}

struct DownloadProgressBarView_Previews: PreviewProvider {
    
    static var previews: some View {
        Group {
            Text("yo")
            //DownloadProgressBarView(state: .constant(.downloading))
        }.previewLayout(.fixed(width: 350, height: 70))
    }
}
