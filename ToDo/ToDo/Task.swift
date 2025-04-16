//
//  Task.swift
//  ToDo
//
//  Created by user272495 on 4/15/25.
//

import Foundation

struct Task: Identifiable {
    let id: UUID = UUID()
    let title: String
    let description: String
    let createdAt: Date
    var isCompleted: Bool = false
}
