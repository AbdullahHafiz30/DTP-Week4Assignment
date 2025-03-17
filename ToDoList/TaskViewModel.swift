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
    
    // Sort tasks so incomplete ones appear first
    var sortedTasks: [Task] {
        tasks.sorted { !$0.isCompleted && $1.isCompleted }
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
    
    // Toggle a task’s completion
    func toggleTaskCompletion(_ task: Task) {
        if let index = tasks.firstIndex(where: { $0.id == task.id }) {
            tasks[index].isCompleted.toggle()
            saveTasks()
        }
    }
    
    // Delete task(s)
    func deleteTasks(at offsets: IndexSet) {
        tasks.remove(atOffsets: offsets)
        saveTasks()
    }
    
    func loadTasks() {
        guard let data = UserDefaults.standard.data(forKey: "tasks") else { return }
        do {
            let decoded = try JSONDecoder().decode([Task].self, from: data)
            tasks = decoded
        } catch {
            print("Unable to decode expenses: \(error.localizedDescription)")
        }
    }
    
    func saveTasks() {
        do {
            let data = try JSONEncoder().encode(tasks)
            UserDefaults.standard.set(data, forKey: "tasks")
        } catch {
            print("Unable to encode expenses: \(error.localizedDescription)")
        }
    }
}
