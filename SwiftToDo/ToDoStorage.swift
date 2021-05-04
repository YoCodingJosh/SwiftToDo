//
//  ToDoStorage.swift
//  SwiftToDo
//
//  Created by Josh Kennedy on 5/4/21.
//

import Foundation

class ToDoStorage: ObservableObject {
    @Published var toDos: Array<ToDoItem> = [ToDoItem]()
    
    init(toDos: Array<ToDoItem> = [ToDoItem]()) {
        self.toDos = toDos
    }
}
