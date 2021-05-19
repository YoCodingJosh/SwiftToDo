//
//  QuickActionView.swift
//  SwiftToDo
//
//  Created by Josh Kennedy on 5/10/21.
//

import SwiftUI

struct QuickActionView: View {
    var body: some View {
        HStack {
            Button(action: {}) {
                Text("✅ Complete")
            }.onTapGesture {
                print("Completed!")
            }
            Spacer()
            Button(action: {}) {
                Text("🚧 In Progress")
            }.onTapGesture {
                print("Moved to In Progress!")
            }
            Spacer()
            Button(action: {}) {
                Text("📋 To Do")
            }.onTapGesture {
                print("Moved to To Do")
            }
        }
    }
}

struct QuickActionView_Previews: PreviewProvider {
    static var previews: some View {
        QuickActionView()
    }
}
