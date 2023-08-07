//
//  TasksViewModel.swift
//  ToDoListTest
//
//  Created by Anton on 05.08.23.
//

import Foundation

class TasksViewModel: ObservableObject {
    @Published var showAlert = false
    @Published var taskTitle = ""
    @Published var tasks: [Task] = []
    
    func addItem() {
          if taskTitle == "" {
              print("Empy task")
          } else {
              tasks.append(Task(text: taskTitle))
              print(taskTitle)
          }
          taskTitle = ""
      }
    
    func toggleDone(for task: Task) {
           if let index = tasks.firstIndex(where: { $0.id == task.id }) {
               tasks[index].isDone.toggle()
           }
       }
    
    func delete(at offsets: IndexSet) {
        tasks.remove(atOffsets: offsets)
    }

}
