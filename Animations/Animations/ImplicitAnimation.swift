//
//  ImplicitAnimation.swift
//  Animations
//
//  Created by user272495 on 7/1/25.
//

import SwiftUI

struct ImplicitAnimation: View {
    
    @State var isBig = false
    var body: some View {
        VStack {
            Circle()
                .fill(isBig ? .red : .blue)
                .frame(
                    width: isBig ? 200 : 100,
                    height: isBig ? 200 : 100)
                .offset(y: isBig ? 200 : 0)
                .animation(.easeInOut(duration: 2), value: isBig)
                .onTapGesture {
                    isBig.toggle()
                }
        }
    }
}
#Preview {
    ImplicitAnimation()
}
