//
//  ContentView.swift
//  SwiftToDo
//
//  Created by Josh Kennedy on 5/3/21.
//

import SwiftUI

struct ToDoListView: View {
    var body: some View {
        NavigationView {
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
                            Text(todo.title).font(.title3).bold()
                        } else {
                            Text(todo.title)
                        }
                        Spacer()
                        Text(todo.important ? "‼️" : "")
                    }
                }
            }.navigationTitle("Your To Do List").navigationBarItems(trailing: NavigationLink(
                destination: CreateToDoView()) {
                Image(systemName: "plus.circle.fill")
                Text("Add")
            })
        }
    }
}

struct ToDoListView_Previews: PreviewProvider {
    static var previews: some View {
        ToDoListView()
    }
}
