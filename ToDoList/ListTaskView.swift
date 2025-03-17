//
//  ListTaskView.swift
//  ToDoList
//
//  Created by Abdullah Hafiz on 14/09/1446 AH.
//

import SwiftUI

struct ListTaskView: View {
    @ObservedObject var viewModel: TaskViewModel
    
    var body: some View {
        List {
            ForEach(viewModel.sortedTasks, id: \.id) { Task in
                NavigationLink(destination: TaskDetailView(task: Task)){
                    Text(Task.title).font(.custom("DINAlternate-Bold", size: 17))
                    
                    Text(Task.description).font(.caption).foregroundColor(.secondary)
                }
                .listRowBackground(Color.clear)
                .listRowSeparator(.visible)
                .accessibilityLabel("List of tasks")
                .accessibilityHint("Tap on a task to see more details")
            
            }.onDelete(perform: viewModel.deleteTasks)
        }.listStyle(GroupedListStyle())
    }
}

#Preview {
    NavigationStack {
        ListTaskView(viewModel: TaskViewModel())
    }
    
}
