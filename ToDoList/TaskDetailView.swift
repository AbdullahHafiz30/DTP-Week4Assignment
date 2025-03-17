//
//  TaskDetailView.swift
//  ToDoList
//
//  Created by Abdullah Hafiz on 14/09/1446 AH.
//

import SwiftUI

struct TaskDetailView: View {
    let task: Task
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            Divider()  // Top horizontal line
            
            Text(task.title)
                .font(.largeTitle)
                .lineLimit(2)
                .multilineTextAlignment(.leading)
            
            Divider()  // Bottom horizontal line
            
            Text(task.description)
                .font(.body)
                .multilineTextAlignment(.leading)
                .foregroundColor(.secondary)
            
            Spacer()
        }
        .padding()
        .navigationTitle("Task Details")
    }
}

#Preview {
    let sampleTask = Task(title: "Example Task", description: "This is the description for the example task. It provides more detailed information about the task.")
    NavigationStack {
        TaskDetailView(task: sampleTask)
    }
}

