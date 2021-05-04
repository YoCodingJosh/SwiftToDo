//
//  ToDoStorage.swift
//  SwiftToDo
//
//  Created by Josh Kennedy on 5/4/21.
//

import Foundation

class ToDoStorage: ObservableObject {
    @Published var toDos: Array<ToDoItem> = [ToDoItem]() {
        didSet {
            UserDefaults.standard.set(try? PropertyListEncoder().encode(toDos), forKey: "toDos")
        }
    }
    
    init(toDos: Array<ToDoItem> = [ToDoItem]()) {
        if (toDos != [ToDoItem]()) {
            self.toDos = toDos
        } else {
            if let data = UserDefaults.standard.value(forKey: "toDos") as? Data {
                if let userDefaultToDos = try? PropertyListDecoder().decode(Array<ToDoItem>.self, from: data) {
                    self.toDos = userDefaultToDos
                }
            }
        }
    }
}
