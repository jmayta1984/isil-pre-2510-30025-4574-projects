//
//  TaskDetail.swift
//  ToDo
//
//  Created by user272495 on 4/15/25.
//

import SwiftUI

struct TaskDetail: View {
    
    @State var title = ""
    @State var description = ""
    
    var onSave: (Task) -> Void = { _ in }
    
    var body: some View {
        NavigationStack {
            VStack (spacing: 16) {
                TextField("Title", text: $title)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                
                TextField("Description", text: $description)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
            }
            .padding()
            .toolbar {
                Button(action: {
                    let task = Task(title: title, description: description, createdAt: Date())
                    onSave(task)
                }) {
                    Text("Save")
                }
            }
        }
       
    }
}

#Preview {
    TaskDetail()
}
