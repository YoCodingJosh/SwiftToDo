//
//  SwiftToDoApp.swift
//  SwiftToDo
//
//  Created by Josh Kennedy on 5/3/21.
//

import SwiftUI

@main
struct SwiftToDoApp: App {
    var storage: ToDoStorage = ToDoStorage()
    
    var body: some Scene {
        WindowGroup {
            ToDoListView().environmentObject(storage)
        }
    }
}
