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
    
    func validate(id: UUID?) -> Task? {
        guard !name.isEmpty else {
            errorMessage = "Name is empty"
            return nil
        }
        errorMessage = nil
        return Task(id: id ?? UUID(), name: name, dueDate: dueDate, isCompleted: false)
    }
    
    func loadData(task: Task) {
        name = task.name
        dueDate = task.dueDate
    }
}
