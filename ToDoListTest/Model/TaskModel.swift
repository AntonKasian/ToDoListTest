//
//  TaskModel.swift
//  ToDoListTest
//
//  Created by Anton on 07.08.23.
//

import Foundation

struct Task: Identifiable {
    let id = UUID()
    var text: String
    var isDone = false
}
