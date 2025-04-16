//
//  ProfileCard.swift
//  Demo
//
//  Created by user272495 on 4/15/25.
//

import SwiftUI

struct ProfileCard: View {
    var body: some View {
        
        VStack {
            Image(systemName: "person.circle.fill")
                .resizable()
                .frame(width: 100, height: 100)
            Text("Jorge Guillermo")
                .font(.title)
                .bold()
            Text("Docente a tiempo parcial")
                .font(.subheadline)
                .foregroundStyle(.gray)
        }
        .padding()
        .background(Color(.secondarySystemBackground))
        .cornerRadius(24)
        .shadow(radius: 8)
        
    }
}

#Preview {
    ProfileCard()
}
