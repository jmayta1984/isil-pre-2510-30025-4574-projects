//
//  TaskListView.swift
//  TodoClean
//
//  Created by user272495 on 5/13/25.
//

import SwiftUI

struct TaskListView: View {
    @StateObject var viewModel = TaskListViewModel()
  
    var body: some View {
        NavigationStack {
            List {
                ForEach(viewModel.tasks){ task in
                    Text(task.name)
                        .onTapGesture {
                            viewModel.selectedTask = task
                        }
                }
                .onDelete { indexSet in
                    viewModel.deleteTask(indexSet: indexSet)
                }
            }
            .navigationTitle("To do")
            .toolbar {
                ToolbarItem {
                    Button(action: {
                        viewModel.showDetail = true
                    }) {
                        Image(systemName: "plus.circle.fill")
                            .resizable()
                            .frame(width: 30, height: 30)
                    }
                }
            }
            .sheet(isPresented: $viewModel.showDetail) {
                TaskDetailView { task in
                    viewModel.addTask(task: task)
                }
            }
            .sheet(item: $viewModel.selectedTask) { selectedtask in
                TaskDetailView(selectedTask: selectedtask) { task in
                    viewModel.updateTask(task: task)
                }
            }
        }
       
    }
}

#Preview {
    TaskListView()
}
