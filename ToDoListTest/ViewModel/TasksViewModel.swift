//
//  TasksViewModel.swift
//  ToDoListTest
//
//  Created by Anton on 05.08.23.
//

import Foundation

struct Task: Identifiable {
    let id = UUID()
    var text: String
    var isDone = false
}


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

}
