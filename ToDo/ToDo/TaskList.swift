//
//  TaskList.swift
//  ToDo
//
//  Created by user272495 on 4/15/25.
//

import SwiftUI

struct TaskList: View {
    
    @State var tasks = [
        Task(title: "Estudiar", description: "Repasar SwiftUI", createdAt: Date()),
        
        Task(title: "Asistir a clases", description: "Sede Miraflores", createdAt: Date())
    ]
    
    @State var showDetail = false
    
    var body: some View {
        
        NavigationStack {
            List {
                ForEach(tasks) { task in
                    
                    Text(task.title)
                }
                
            }
            .navigationTitle(Text("Tasks"))
            .toolbar {
                Button (action: {
                    showDetail = true
                })
                {
                    Image(systemName: "plus")
                }
            }
            .sheet(isPresented: $showDetail) {
                TaskDetail{ task in
                    tasks.append(task)
                }
            }
        }
        
    }
}

#Preview {
    TaskList()
}
