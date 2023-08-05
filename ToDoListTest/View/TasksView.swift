//
//  ContentView.swift
//  ToDoListTest
//
//  Created by Anton on 05.08.23.
//

import SwiftUI

struct TasksView: View {
    
    @ObservedObject var viewModel = TasksViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                List(viewModel.tasks) { task in
                    HStack {
                        Button {
                            viewModel.toggleDone(for: task)
                        } label: {
                            Text(task.text)
                        }
                        Spacer()
                        Image(systemName: task.isDone ? "checkmark.circle.fill" : "circle")
                    }
                }
            }
            .navigationTitle("To Do List")
            .navigationBarTitleDisplayMode(.inline)
            
            .navigationBarItems(trailing: Button(action: {
                viewModel.showAlert = true
            }, label: {
                Image(systemName: "plus")
            }))
            .alert("task", isPresented: $viewModel.showAlert) {
                VStack {
                    Text("Write new task")
                    TextField("Task...", text: $viewModel.taskTitle)

                    Button {
                        viewModel.addItem()
                        
                    } label: {
                        Text("Ok")
                    }

                    Button("Cancel", role: .cancel){
                        
                    }
                    
                }
            }
        }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        TasksView()
    }
}
