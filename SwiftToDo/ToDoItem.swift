//
//  ToDoItem.swift
//  SwiftToDo
//
//  Created by Josh Kennedy on 5/3/21.
//

import Foundation

enum ToDoItemStatus {
    case needToDo
    case inProgress
    case complete
}

struct ToDoItem: Identifiable {
    var id = UUID()
    var title: String
    var important: Bool
    var status: ToDoItemStatus
    
    init(title: String, important: Bool, status: ToDoItemStatus = .needToDo) {
        self.title = title
        self.important = important
        self.status = status
    }
}
