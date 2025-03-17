//
//  Task.swift
//  ToDoList
//
//  Created by Abdullah Hafiz on 14/09/1446 AH.
//

import SwiftUI

struct Task: Identifiable, Codable, Hashable {
    public var id: UUID = UUID()
    public var title: String
    public var description: String
    public var isCompleted: Bool = false
    
    init(id: UUID = UUID(), title: String, description: String, isCompleted: Bool = false){
        self.id = id
        self.title = title
        self.description = description
        self.isCompleted = isCompleted
    }
}
