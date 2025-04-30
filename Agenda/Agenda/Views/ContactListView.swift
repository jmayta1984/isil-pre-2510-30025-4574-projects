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
                ContactList(
                    showDetail: $showDetail,
                    selectedContact: $selectedContact,
                    viewModel: viewModel)
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
                    contact: selectedContact) { contact in
                        if (selectedContact == nil) {
                            viewModel.addContact(contact: contact)
                        } else {
                            viewModel.updateContact(contact: contact)
                        }
                    }
                
                
            }
        }
    }
}

struct ContactList: View {
    @Binding var showDetail: Bool
    @Binding var selectedContact: Contact?
    @ObservedObject var viewModel: ContactListViewModel
    var body: some View {
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
}


#Preview {
    ContactListView()
}
