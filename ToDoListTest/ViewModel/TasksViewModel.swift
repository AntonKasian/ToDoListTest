//
//  TasksViewModel.swift
//  ToDoListTest
//
//  Created by Anton on 05.08.23.
//

import Foundation
import SwiftUI

class TasksViewModel: ObservableObject {
    @Published var showAlert = false
    @Published var taskTitle = ""
    @Published var errorMessage = ""
    @Published var tasks: [Task] = []
    
    func addItem() {
        
        let trimmedTitle = taskTitle.trimmingCharacters(in: .whitespacesAndNewlines)
        
        if trimmedTitle.isEmpty {
            print("Empty task")
            errorMessage = "You should write a task"
            DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                self.errorMessage = ""
            }
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
