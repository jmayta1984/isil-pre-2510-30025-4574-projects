//
//  ContactListViewModel.swift
//  Agenda
//
//  Created by user272495 on 4/22/25.
//

import Foundation

class ContactListViewModel: ObservableObject {
    @Published var contacts = [Contact]()
    
    func addContact(contact: Contact) {
        contacts.append(contact)
    }
    
    func deleteContact(at offset: IndexSet){
        contacts.remove(atOffsets: offset)
    }
    
    func updateContact(contact: Contact){
        contacts = contacts.map { it in
            it.id == contact.id ? contact : it
        }
    }
}
