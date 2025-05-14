//
//  TaskEntity+Extensions.swift
//  TodoClean
//
//  Created by user272495 on 5/13/25.
//

extension TaskEntity {
    func fromTask(task: Task)  {
        self.id = task.id
        self.name = task.name
        self.isCompleted = task.isCompleted
        self.dueDate = task.dueDate
    }
}
