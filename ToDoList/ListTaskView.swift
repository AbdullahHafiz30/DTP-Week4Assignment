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
        NavigationStack {
            List {
                ForEach(viewModel.tasks, id: \.id) { task in
                    TaskRowView(task: task, toggleCompletion: {
                        viewModel.toggleTaskCompletion(task)
                    })
                    .listRowBackground(Color.clear)
                    .listRowSeparator(.hidden)
                    .padding(.vertical, 4)
                }
                .onDelete(perform: viewModel.deleteTasks)
                .onMove(perform: viewModel.moveTasks)
            }
            .listStyle(PlainListStyle())
            .navigationTitle("To Do List")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    EditButton()
                }
            }
        }
    }
}

#Preview {
    NavigationStack {
        ListTaskView(viewModel: TaskViewModel())
    }
}
