//
//  ContactForm.swift
//  Demo
//
//  Created by user272495 on 4/15/25.
//

import SwiftUI

struct ContactForm: View {
    
    @State var name = ""
    @State var email = ""
    @State var subscribe = false
    
    
    var body: some View {
        Form {
            Section (header: Text( "General data") ){
                TextField("Name", text: $name)
                TextField("Email", text: $email)
            }
            
            Section {
                Toggle("Suscribe to", isOn: $subscribe)
                
            }
            
        
        }
    }
}

#Preview {
    ContactForm()
}
