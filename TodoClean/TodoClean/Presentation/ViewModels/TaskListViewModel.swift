
//
//  TaskListViewModel.swift
//  TodoClean
//
//  Created by user272495 on 5/13/25.
//

import Foundation

class TaskListViewModel: ObservableObject {
    @Published var showDetail = false
    @Published var tasks = [Task]()
    
    func addTask(task: Task) {
        tasks.append(task)
    }
}

