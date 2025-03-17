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
        VStack {
            List {
                Section(header: Text("Details")) {
                    Text(task.title).font(.largeTitle)
                    Text(task.description).font(.body).fontWeight(.light).font(.body)
                }
            }
        }.navigationTitle("Task Details")
        // the deatil page should view the title on top and the description under it
    }
}

#Preview {
    let sampletask = Task(title: "Hello", description: "World")
    TaskDetailView(task: sampletask)
}
