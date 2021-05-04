//
//  ToDoItem.swift
//  SwiftToDo
//
//  Created by Josh Kennedy on 5/3/21.
//

import Foundation

enum ToDoItemStatus: Int, Codable {
    case needToDo = 1
    case inProgress = 2
    case complete = 3
}

struct ToDoItem: Identifiable, Codable, Equatable {
    var id = UUID()
    var title: String
    var important: Bool
    var status: ToDoItemStatus
    
    private enum CodingKeys: String, CodingKey {
        case id
        case title
        case important
        case status
    }
    
    init(title: String, important: Bool, status: ToDoItemStatus = .needToDo) {
        self.title = title
        self.important = important
        self.status = status
    }
}
