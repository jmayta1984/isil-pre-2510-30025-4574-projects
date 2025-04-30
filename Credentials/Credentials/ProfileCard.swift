//
//  Credentials.swift
//  Credentials
//
//  Created by user272495 on 4/29/25.
//

import SwiftUI

struct ProfileCard: View {
    var name: String
    var birthDate: Date
    var body: some View {
        
        VStack {
            Image(systemName: "person.circle.fill")
                .resizable()
                .frame(width: 100, height: 100)
            Text(name)
                .font(.title)
                .bold()
            Text("\(birthDate)")
                .font(.subheadline)
                .foregroundStyle(.gray)
        }
        .padding()
        .background(Color(.secondarySystemBackground))
        .cornerRadius(24)
        .shadow(radius: 8)
        
    }
}
