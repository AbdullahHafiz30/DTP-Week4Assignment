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
            Text(task.title)
                .font(.title)
                .frame(height: 55)
                .frame(maxWidth: .infinity)
                .background(Color.secondary.opacity(0.2))
                .cornerRadius(8)
            
            Text(task.description)
                .padding()
                .font(.headline)
                .frame(maxWidth: .infinity)
                .background(Color.primary.opacity(0.1))
                .cornerRadius(8)
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

