//
//  TaskRowView.swift
//  ToDoList
//
//  Created by Abdullah Hafiz on 17/09/1446 AH.
//

import SwiftUI

struct TaskRowView: View {
    let task: Task
    var toggleCompletion: () -> Void  // Closure to toggle completion

    var body: some View {
        HStack {
            // Checkbox button
            Button(action: toggleCompletion) {
                Image(systemName: task.isCompleted ? "checkmark.square.fill" : "square")
                    .foregroundColor(task.isCompleted ? .green : .gray)
                    .imageScale(.large)
            }
            .buttonStyle(PlainButtonStyle())
            .padding(.trailing, 8)
            
            // Task text content
            NavigationLink(destination: TaskDetailView(task: task)) {
                VStack(alignment: .leading, spacing: 4) {
                    Text(task.title)
                        .font(.custom("DINAlternate-Bold", size: 17))
                        .lineLimit(2)
                        .multilineTextAlignment(.leading)
                        .strikethrough(task.isCompleted, color: .gray)
                    
                    Text(task.description)
                        .font(.caption)
                        .foregroundColor(.secondary)
                        .multilineTextAlignment(.leading)
                        .strikethrough(task.isCompleted, color: .gray)
                }
            }
            Spacer()
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 8)
                .stroke(Color.gray, lineWidth: 1)
        )
    }
}
