//
//  ContentView.swift
//  ToDoListTest
//
//  Created by Anton on 05.08.23.
//

import SwiftUI

struct ContentView: View {
    
    @State var showAlert = false
    @State var taskTitle = ""
    
    var body: some View {
        NavigationView {
            VStack {
                List() {
                    Text("Test")
                    Text("Test")
                    Text("Test")
                    Text("Test")
                }
            }
            .navigationTitle("To Do List")
            .navigationBarTitleDisplayMode(.inline)
            
            .navigationBarItems(trailing: Button(action: {
                showAlert.toggle()
            }, label: {
                Image(systemName: "plus")
            }))
            .alert("Key", isPresented: $showAlert) {
                VStack {
                    Text("Write new task")
                    TextField("Task...", text: $taskTitle)
                    
                    Button {
                        addItem()
                    } label: {
                        Text("Ok")
                    }
                    
                    Button(role: .cancel) {

                    } label: {
                        Text("Cancel")
                    }
                    
                }
            }
        }
    }
    
    func addItem() {
        if taskTitle == "" {
            print("Empy task")
        } else {
            print(taskTitle)
        }
        taskTitle = ""
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
