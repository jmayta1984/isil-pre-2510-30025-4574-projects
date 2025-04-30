//
//  ContactListView.swift
//  Agenda
//
//  Created by user272495 on 4/22/25.
//

import SwiftUI

struct ContactListView: View {
    @StateObject var viewModel = ContactListViewModel()
    
    @State var showDetail = false
    
    @State var selectedContact: Contact?
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(viewModel.contacts) { contact in
                    HStack {
                        Text(contact.name)
                    }
                    .onTapGesture {
                        showDetail = true
                        selectedContact = contact
                    }
                    
                }
                .onDelete { indexSet in
                    viewModel.deleteContact(at: indexSet)
                }
            }
            .navigationTitle(Text("Agenda"))
            .toolbar {
                ToolbarItem {
                    Button(action: {
                        showDetail = true
                        selectedContact = nil
                    }) {
                        Image(systemName: "plus")
                    }
                }
            }
            .sheet(isPresented: $showDetail) {
                ContactDetailView (
                    contact: selectedContact,
                    onUpdate: { contact in
                        viewModel.updateContact(contact: contact)
                    },
                    onAdd: { contact in
                        viewModel.addContact(contact: contact)
                    }
                )
            }
        }
    }
}

#Preview {
    ContactListView()
}
