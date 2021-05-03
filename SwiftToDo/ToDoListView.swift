//
//  ContentView.swift
//  SwiftToDo
//
//  Created by Josh Kennedy on 5/3/21.
//

import SwiftUI

struct ToDoListView: View {
    var body: some View {
        List {
            ForEach([ToDoItem(title: "Write Code", important: true), ToDoItem(title: "Watch Anime", important: true), ToDoItem(title: "Sleep", important: false)]) { todo in
                HStack {
                    switch(todo.status) {
                    case ToDoItemStatus.needToDo:
                        Text("📋")
                    case ToDoItemStatus.inProgress:
                        Text("🚧")
                    case ToDoItemStatus.complete:
                        Text("✅")
                    }
                    if (todo.important) {
                        Text(todo.title).bold()
                    } else {
                        Text(todo.title)
                    }
                    Spacer()
                    Text(todo.important ? "‼️" : "")
                }
            }
        }
    }
}

struct ToDoListView_Previews: PreviewProvider {
    static var previews: some View {
        ToDoListView()
    }
}
