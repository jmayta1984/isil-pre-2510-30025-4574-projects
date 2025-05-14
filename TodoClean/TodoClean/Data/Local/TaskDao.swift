//
//  TaskDao.swift
//  TodoClean
//
//  Created by user272495 on 5/13/25.
//

import CoreData

struct TaskDao {
    private let context = PersitenceController.shared.container.viewContext
    
    func fetchTask() -> [TaskEntity] {
        
        let request: NSFetchRequest<TaskEntity> = TaskEntity.fetchRequest()
        
        do{
           return try context.fetch(request)
        } catch let error {
            fatalError(error.localizedDescription)
        }
    }
    
    func addTask(task: Task) {
        let taskEntity = TaskEntity(context: context)
        taskEntity.fromTask(task: task)
        saveContext()
    }
    func deleteTask(id: UUID) {
        let request: NSFetchRequest<TaskEntity> = TaskEntity.fetchRequest()
        request.predicate = NSPredicate(format: "id = %@", id as CVarArg)
        
        do{
            if let entity = try context.fetch(request).first {
                context.delete(entity)
                saveContext()
            }
            
        } catch let error {
            fatalError(error.localizedDescription)
        }
    }
    
    func updateTask(task: Task) {
        let request: NSFetchRequest<TaskEntity> = TaskEntity.fetchRequest()
        request.predicate = NSPredicate(format: "id = %@", task.id as CVarArg)
        
        do{
            if let entity = try context.fetch(request).first {
                entity.dueDate = task.dueDate
                entity.name = task.name
                entity.isCompleted = task.isCompleted
                saveContext()
            }
            
        } catch let error {
            fatalError(error.localizedDescription)
        }
    }
    
    private func saveContext(){
        do {
            try context.save()
        } catch let error {
            fatalError(error.localizedDescription)
        }
    }
}
