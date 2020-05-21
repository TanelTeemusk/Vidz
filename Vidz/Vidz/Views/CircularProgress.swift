//
//  CircularProgress.swift
//  Vidz
//
//  Created by Tanel Teemusk on 21.05.2020.
//  Copyright © 2020 Teemusk. All rights reserved.
//

import SwiftUI

struct CircularProgress: View {
    @Binding var value:CGFloat
    @ObservedObject var progress = Progress()
    
    var body: some View {
        return ZStack {
            Circle()
                .trim(from: 0, to: value)
                .stroke(Color.black, lineWidth:4)
                .frame(width:40)
                .rotationEffect(Angle(degrees:-90))
        }
    }
}

struct CircularProgress_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            CircularProgress(value: .constant(0.8))
        }
        .previewLayout(.fixed(width: 350, height: 70))
    }
}
