//
//  TaskDetailViewModel.swift
//  TodoClean
//
//  Created by user272495 on 5/13/25.
//

import Foundation

class TaskDetailViewModel: ObservableObject {
    @Published var name = ""
    @Published var dueDate = Date()
    @Published var errorMessage: String? = nil
    
    func validate() -> Task? {
        guard !name.isEmpty else {
            errorMessage = "Name is empty"
            return nil
        }
        errorMessage = nil
        return Task(id: UUID(), name: name, dueDate: dueDate, isCompleted: false)
    }
}
