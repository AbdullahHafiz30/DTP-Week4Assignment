//
//  NewTaskView.swift
//  ToDoList
//
//  Created by Abdullah Hafiz on 14/09/1446 AH.
//

import SwiftUI

struct NewTaskView: View {
    @ObservedObject var viewModel: TaskViewModel
    @State private var taskTitle: String = ""
    @State private var taskDescription: String = ""
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        Form {
            Section(header: Text("New Task")) {
                TextField("Enter task", text: $taskTitle)
                    .font(.body)
                    .accessibilityLabel("Task title input")
                    .accessibilityHint("Enter the title for your new task")
                TextField("Description", text: $taskDescription)
                    .font(.body)
                    .accessibilityLabel("Task description input")
                    .accessibilityHint("Enter a description for your new task")
            }
            
            Button("Add Task") {
                viewModel.addTask(with: taskTitle, description: taskDescription)
                dismiss() // Close the view after adding the task
            }
            .font(.body)
            .accessibilityLabel("Add Task")
            .accessibilityHint("Adds the new task and returns to the task list")
            .disabled(taskTitle.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty)
            .disabled(taskDescription.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty)
        }
        .navigationTitle("Add Task")
        
    }
}

struct NewTaskView_Previews: PreviewProvider {
    static var previews: some View {
        NewTaskView(viewModel: TaskViewModel())
    }
}
