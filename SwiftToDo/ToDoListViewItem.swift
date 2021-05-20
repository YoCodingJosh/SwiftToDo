//
//  ToDoListViewItem.swift
//  SwiftToDo
//
//  Created by Josh Kennedy on 5/20/21.
//

import SwiftUI

struct ToDoListViewItem: View {
    @Binding var todoItem: ToDoItem
    
    @State var showQuickActionView: Bool = false
    
    var body: some View {
        HStack {
            switch(todoItem.status) {
            case ToDoItemStatus.needToDo:
                Text("📋")
            case ToDoItemStatus.inProgress:
                Text("🚧")
            case ToDoItemStatus.complete:
                Text("✅")
            }
            if (todoItem.important) {
                Text(todoItem.title).font(.title3).bold()
            } else {
                Text(todoItem.title)
            }
            Spacer()
            Text(todoItem.important ? "‼️" : "")
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

//struct ToDoListViewItem_Previews: PreviewProvider {
//    static var previews: some View {
//        ToDoListViewItem()
//    }
//}
