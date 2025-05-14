
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
    @Published var selectedTask: Task? = nil
    private let taskDao = TaskDao()
    
    
    init(){
        fetchTasks()
    }
    
    func addTask(task: Task) {
        taskDao.addTask(task: task)
        fetchTasks()
    }
    
    func deleteTask(indexSet: IndexSet) {
        if let index = indexSet.first {
            taskDao.deleteTask(id: tasks[index].id)
            fetchTasks()
        }
        
    }
    
    func updateTask(task: Task) {
        taskDao.updateTask(task: task)
        fetchTasks()
    }
    
    func fetchTasks(){
        tasks = taskDao.fetchTask().map { entity in
            Task(id: entity.id ?? UUID(), name: entity.name ?? "", dueDate: entity.dueDate ?? Date(), isCompleted: entity.isCompleted ?? false)
        }
    }
}

