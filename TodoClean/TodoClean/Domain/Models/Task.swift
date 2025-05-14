//
//  Task.swift
//  TodoClean
//
//  Created by user272495 on 5/13/25.
//

import Foundation

struct Task: Identifiable {
    let id: UUID
    let name: String
    let dueDate: Date
    let isCompleted: Bool
}
