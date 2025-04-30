//
//  ContactDetailView.swift
//  Agenda
//
//  Created by user272495 on 4/22/25.
//

import SwiftUI

struct ContactDetailView: View {
    
    @State var name = ""
    @State var company = ""
    @State var phone = ""
    
    @State var contact: Contact?
    
    @Environment(\.dismiss) var dismiss
    var onUpdate: (Contact) -> Void = {_ in }
    var onAdd: (Contact) -> Void = {_ in }
    
    var body: some View {
        
        NavigationStack {
            Form {
                Section {
                    TextField("Name", text: $name)
                    TextField("Company", text: $company)
                    TextField("Phone", text: $phone)
                }
            }
            .navigationTitle(contact == nil ? "New contact":"Edit contact")
            .toolbar {
                ToolbarItem {
                    Button(action: {
                       
                        if let contact = contact {
                            
                            onUpdate(contact)
                        } else {
                            onAdd(Contact(
                                name: name,
                                company: company,
                                phone: phone))
                        }
                       
                        dismiss()
                    }) {
                        Text("Save")
                    }
                }
            }
            .onAppear {
                if let contact = contact {
                    name = contact.name
                    company = contact.company
                    phone = contact.phone
                }
            }
        }
    }
}

#Preview {
    ContactDetailView()
}
