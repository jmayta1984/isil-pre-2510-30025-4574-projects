//
//  InfiniteRotation.swift
//  Animations
//
//  Created by user272495 on 7/1/25.
//

import SwiftUI

struct InfiniteRotation: View {
    @State var rotate = false
    var body: some View {
        VStack {
            Image(systemName: "arrow.2.circlepath")
                .resizable()
                .scaledToFit()
                .frame(width: 60, height: 60)
                .rotationEffect(Angle(degrees: rotate ? 180 : 0))

                .animation(.linear(duration: 2).repeatForever(autoreverses: false), value: rotate)
        }

        .onAppear {
            rotate = true
        }
    }
}

#Preview {
    InfiniteRotation()
}
