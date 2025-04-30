//
//  Contact.swift
//  Agenda
//
//  Created by user272495 on 4/22/25.
//

import Foundation

struct Contact: Identifiable {
    let id: UUID = UUID()
    var name: String
    var company: String
    var phone: String
    
}
