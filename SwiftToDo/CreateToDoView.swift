//
//  CreateToDo.swift
//  SwiftToDo
//
//  Created by Josh Kennedy on 5/4/21.
//

import SwiftUI

struct CreateToDoView: View {
    @State var title: String = ""
    @State var important: Bool = false
    @State var status: ToDoItemStatus = ToDoItemStatus.needToDo
    
    var body: some View {
        List {
            Section(header: Text("Task Name")) {
                TextField("Eat Snacks", text: $title)
            }
            Section {
                Toggle(isOn: $important) {
                    Text("Important ‼️")
                }
                Picker("Status", selection: $status) {
                    Text("📋 To Do").tag(ToDoItemStatus.needToDo)
                    Text("🚧 In Progress").tag(ToDoItemStatus.inProgress)
                    Text("✅ Complete").tag(ToDoItemStatus.complete)
                }.pickerStyle(InlinePickerStyle())
            }
        }.listStyle(GroupedListStyle())
    }
}

struct CreateToDoView_Previews: PreviewProvider {
    static var previews: some View {
        CreateToDoView()
    }
}
