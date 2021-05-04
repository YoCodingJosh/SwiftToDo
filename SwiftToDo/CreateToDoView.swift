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
    
    @Environment(\.presentationMode) var presentationMode
    
    @EnvironmentObject var storage: ToDoStorage
    
    var body: some View {
        List {
            Section(header: Text("Task Name")) {
                TextField("Eat Snacks", text: $title)
            }
            
            Section {
                Toggle(isOn: $important) {
                    Text("Important ‼️")
                }
            }
            
            Section {
                Picker("Status", selection: $status) {
                    Text("📋 To Do").tag(ToDoItemStatus.needToDo)
                    Text("🚧 In Progress").tag(ToDoItemStatus.inProgress)
                    Text("✅ Complete").tag(ToDoItemStatus.complete)
                }.pickerStyle(InlinePickerStyle())
            }
            
            Section {
                HStack {
                    Spacer()
                    
                    Button("Save") {
                        self.storage.toDos.append(ToDoItem(title: self.title, important: self.important, status: self.status))
                        self.presentationMode.wrappedValue.dismiss()
                    }.disabled(self.title.isEmpty)
                    
                    Spacer()
                }
            }
        }.listStyle(GroupedListStyle())
    }
}

struct CreateToDoView_Previews: PreviewProvider {
    static var previews: some View {
        CreateToDoView().environmentObject(ToDoListView_Previews.storage)
    }
}
