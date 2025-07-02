//
//  MainView.swift
//  SneakerMate
//
//  Created by user272495 on 6/24/25.
//

import SwiftUI

struct MainView: View {
    @StateObject var authViewModel = AuthViewModel()
    
    var body: some View {
        Group {
            if authViewModel.user == nil {
                LoginView()
            } else {
                ContentView()
            }
        }
        .environmentObject(authViewModel)
    }
}
