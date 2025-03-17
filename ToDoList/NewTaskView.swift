//
//  NewTaskView.swift
//  ToDoList
//
//  Created by Abdullah Hafiz on 14/09/1446 AH.
//

import SwiftUI

// Custom button style with a subtle scale and opacity animation
struct AnimatedButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding()
            .frame(maxWidth: .infinity)
            .background(configuration.isPressed ? Color.accentColor.opacity(0.7) : Color.accentColor)
            .foregroundColor(.white)
            .cornerRadius(8)
            .scaleEffect(configuration.isPressed ? 0.95 : 1.0)
            .animation(.easeOut(duration: 0.2), value: configuration.isPressed)
    }
}

struct NewTaskView: View {
    @ObservedObject var viewModel: TaskViewModel
    @State private var taskTitle: String = ""
    @State private var taskDescription: String = ""
    @Environment(\.dismiss) private var dismiss
    
    // Form validation: both fields must be non-empty.
    var isFormValid: Bool {
        !taskTitle.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty &&
        !taskDescription.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            
            // Task title input
            Text("Enter task")
                .font(.headline)
            TextField("Task title", text: $taskTitle)
                .padding()
                .background(RoundedRectangle(cornerRadius: 8).strokeBorder(Color.gray, lineWidth: 1))
            
            // Task description input
            Text("Enter task description")
                .font(.headline)
            TextField("Task description", text: $taskDescription)
                .padding()
                .background(RoundedRectangle(cornerRadius: 8).strokeBorder(Color.gray, lineWidth: 1))
            
            // Custom animated button
            Button(action: {
                viewModel.addTask(with: taskTitle, description: taskDescription)
                dismiss()
            }) {
                Text("Add Task")
                    .font(.headline)
            }
            .buttonStyle(AnimatedButtonStyle())
            .disabled(!isFormValid)
            .opacity(isFormValid ? 1.0 : 0.5)
            
            Spacer()
        }
        .padding()
        .navigationTitle("Add Task")
    }
}

struct NewTaskView_Previews: PreviewProvider {
    static var previews: some View {
        NewTaskView(viewModel: TaskViewModel())
    }
}
