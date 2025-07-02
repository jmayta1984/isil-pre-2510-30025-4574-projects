//
//  TransitionAnimation.swift
//  Animations
//
//  Created by user272495 on 7/1/25.
//

import SwiftUI

struct TransitionAnimation: View {
    @State var showRectangle = false
    
    var body: some View {
        VStack {
            if showRectangle {
                Rectangle()
                    .frame(width: 200, height: 200)
                    .transition(.move(edge: .bottom))
                    .animation(.easeInOut, value: showRectangle)
            }
            Button {
                withAnimation {
                    showRectangle.toggle()
                }
                
            } label: {
                Text("Show")
            }

        }
    }
}

#Preview {
    TransitionAnimation()
}
