//
//  ContentView.swift
//  SwiftToDo
//
//  Created by Josh Kennedy on 5/3/21.
//

import SwiftUI

struct ToDoListView: View {
    @EnvironmentObject var storage: ToDoStorage
    
    @GestureState var isDetectingLongPress = false
    @State var gestureFinished = false
    @State var canShowQuickAction = false
    
    var longPress: some Gesture {
        LongPressGesture(minimumDuration: 1)
            .updating($isDetectingLongPress) { currentState, gestureState,
                                               transaction in
                gestureState = currentState
                canShowQuickAction = isDetectingLongPress && gestureFinished
            }
            .onEnded { finished in
                self.gestureFinished.toggle()
                
                canShowQuickAction = isDetectingLongPress && gestureFinished
            }
    }
    
    var body: some View {
        NavigationView {
            List {
                ForEach(storage.toDos) { todo in
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
                    }.gesture(longPress)
                }
                Text("Is Long Press? " + ($isDetectingLongPress.wrappedValue ? "yes" : "no"))
                Text("Is Gesture Finished? " + ($gestureFinished.wrappedValue ? "yes" : "no"))
                Text("Show Quick Edit View? " + ($canShowQuickAction.wrappedValue ? "yes" : "no"))
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
