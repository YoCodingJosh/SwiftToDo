//
//  ContentView.swift
//  SwiftToDo
//
//  Created by Josh Kennedy on 5/3/21.
//

import SwiftUI

struct ToDoListView: View {
    @EnvironmentObject var storage: ToDoStorage
    
    @State var showQuickActionView: Bool = false
    
    var body: some View {
        NavigationView {
            List {
                ForEach(storage.toDos) { todo in
                    VStack {
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
                        }.contentShape(Rectangle()).onTapGesture {
                            if (!showQuickActionView) {
                                print("go to edit screen for item")
                            }
                        }.simultaneousGesture(LongPressGesture(minimumDuration: 0.25).onEnded { _ in
                            self.showQuickActionView.toggle()
                        })
                        self.showQuickActionView ? VStack {
                            Spacer()
                            QuickActionView()
                        } : nil
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
