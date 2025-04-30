//
//  ContactForm.swift
//  Credentials
//
//  Created by user272495 on 4/29/25.
//


import SwiftUI

struct ContactForm: View {
    
    @State var name = ""
    @State var birthDate = Date()
    @State var showCredentials = false
    
    var body: some View {
        NavigationStack {
            
            Form {
                TextField("Name", text: $name)
                DatePicker("Birthday", selection: $birthDate, displayedComponents: [.date])
              
            }
            .navigationTitle("Contact form")
            .toolbar(content: {
                Button(action: {
                    showCredentials = true
                }) {
                    Image(systemName: "checkmark")
                }
            })
            .sheet(isPresented: $showCredentials) {
               ProfileCard(name: name, birthDate: birthDate)
            }
        }
    }
}

#Preview {
    ContactForm()
}
