//
//  ContentView.swift
//  SwiftToDo
//
//  Created by Josh Kennedy on 5/3/21.
//

import SwiftUI

struct ToDoListView: View {
    @EnvironmentObject var storage: ToDoStorage
    
    var body: some View {
        NavigationView {
            List {
                ForEach(storage.toDos) { todo in
                    VStack {
                        ToDoListViewItem(todoItem: Binding<ToDoItem>(get: {todo}, set: { _ in }))
                    }
                }
            }
            .navigationTitle("Your To Do List").navigationBarItems(trailing: NavigationLink(
                destination: CreateToDoView()) {
                Image(systemName: "plus.circle.fill")
                Text("Add")
            })
        }
    }
}

struct ToDoListView_Previews: PreviewProvider {
    static var testItems: Array<ToDoItem> = [ToDoItem(title: "Watch Anime", important: true, status: .needToDo), ToDoItem(title: "Write Code", important: true, status: .inProgress), ToDoItem(title: "Sleep", important: false, status: .needToDo)]
    static var storage: ToDoStorage = ToDoStorage(toDos: testItems);
    
    static var previews: some View {
        ToDoListView().environmentObject(storage)
    }
}
