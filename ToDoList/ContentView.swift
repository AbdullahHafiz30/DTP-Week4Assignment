//
//  ContentView.swift
//  ToDoList
//
//  Created by Abdullah Hafiz on 14/09/1446 AH.
//

import SwiftUI

struct ContentView: View {
    @State var isDark: Bool = false
    @StateObject private var viewModel = TaskViewModel()
    
    
    var body: some View {
        NavigationStack {
            ZStack {
                VStack {
                    ToggleView(isDarkMode: $isDark)
                        .accessibilityLabel("Dark mode toggle")
                        .accessibilityHint("Switch between dark and light themes")
                    
                    Spacer()
                    
                    ListTaskView(viewModel: viewModel)
                    
                    
                }.navigationBarTitle("To Do List")
                    .toolbar {
                        ToolbarItem(placement: .navigationBarTrailing) {
                            NavigationLink(destination: NewTaskView(viewModel: viewModel)) {
                                Text("Add Task")
                                Image(systemName: "plus")
                                
                            }
                            .accessibilityLabel("Add new task")
                            .accessibilityHint("Navigates to the add task screen")
                        }
                    }.preferredColorScheme(isDark ? .dark : .light)
            }
        }
    }
}
#Preview {
    ContentView()
}
