//
//  TaskDetailView.swift
//  TodoClean
//
//  Created by user272495 on 5/13/25.
//

import SwiftUI

struct TaskDetailView: View {
    
    @Environment(\.dismiss) var dismiss
    @StateObject var viewModel =  TaskDetailViewModel()

    var selectedTask: Task? = nil
    
    var title: String {
        selectedTask == nil ? "New task" : "Update task"
    }
    
    var onSave: (Task) -> Void
    
    
    var body: some View {
        NavigationStack {
            Form {
                
                Section {
                    TextField("Name", text: $viewModel.name)
                        .autocorrectionDisabled()
                    DatePicker("Due date",
                               selection: $viewModel.dueDate,
                               in: Date()... ,
                               displayedComponents: [.date] )
                }
                Section {
                    Button(action: {
                        if let task = viewModel.validate(id: selectedTask?.id) {
                            onSave(task)
                            dismiss()
                        }
                        
                    }) {
                        Text("Save")
                    }
                }
                Group {
                    if let error = viewModel.errorMessage {
                        Text(error).foregroundStyle(.red)
                    }
                }
            }
            .navigationTitle(title)
            .onAppear {
                if let selectedTask = selectedTask {
                    viewModel.loadData(task: selectedTask)
                }
            }
            
        }
    }
}
