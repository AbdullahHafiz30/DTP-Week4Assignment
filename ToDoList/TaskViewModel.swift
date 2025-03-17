//
//  TaskViewModel.swift
//  ToDoList
//
//  Created by Abdullah Hafiz on 14/09/1446 AH.
//

import Foundation
import SwiftUI

class TaskViewModel: ObservableObject {
    @Published var tasks: [Task] = []
    
    init() {
        loadTasks()
    }
    
    
    // Add a new task
    func addTask(with title: String, description: String) {
        let trimmedTitle = title.trimmingCharacters(in: .whitespacesAndNewlines)
        let trimmedDescription = description.trimmingCharacters(in: .whitespacesAndNewlines)
        guard !trimmedTitle.isEmpty, !trimmedDescription.isEmpty else { return }
        withAnimation(.easeIn(duration: 0.45)) {
            tasks.append(Task(title: trimmedTitle, description: trimmedDescription))
            saveTasks()
        }
    }
    
    // Enable drag-and-drop reordering
    func moveTasks(from source: IndexSet, to destination: Int) {
        tasks.move(fromOffsets: source, toOffset: destination)
        saveTasks()
    }
    
    // Toggle a task’s completion and automatically move it to the bottom if completed, or top if incomplete.
    func toggleTaskCompletion(_ task: Task) {
        if let index = tasks.firstIndex(where: { $0.id == task.id }) {
            tasks[index].isCompleted.toggle()
            let updatedTask = tasks.remove(at: index)
            if updatedTask.isCompleted {
                // Append to bottom if marked complete
                tasks.append(updatedTask)
            } else {
                // Insert at the top if marked incomplete
                tasks.insert(updatedTask, at: 0)
            }
            saveTasks()
        }
    }
    
    // Delete task(s)
    func deleteTasks(at offsets: IndexSet) {
        tasks.remove(atOffsets: offsets)
        saveTasks()
    }
    
    // Persistence
    func loadTasks() {
        guard let data = UserDefaults.standard.data(forKey: "tasks") else { return }
        do {
            let decoded = try JSONDecoder().decode([Task].self, from: data)
            tasks = decoded
        } catch {
            print("Unable to decode tasks: \(error.localizedDescription)")
        }
    }
    
    func saveTasks() {
        do {
            let data = try JSONEncoder().encode(tasks)
            UserDefaults.standard.set(data, forKey: "tasks")
        } catch {
            print("Unable to encode tasks: \(error.localizedDescription)")
        }
    }
}
