//
//  onBoardingViewController.swift
//  To_Do
//
//  Created by Decagon on 12/11/21.
//

import UIKit

class onBoardingViewController: UIViewController {
    var coordinator:Coordinator?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "onboarding"
        let data = TodoModel(id: 1, title: "James", description: "lets chat", date: "my date", time: "my time", isDone: true)
        let data2 = TodoModel(id: 2, title: "Abike", description: "nil", date: "my date", time: "my time", isDone: false)
        let data3 = TodoModel(id: 3, title: "Thomas", description: "nil", date: "my date", time: "my time", isDone: false)
        let data4 = TodoModel(id: 4, title: "Kelechi", description: "nil", date: "my date", time: "my time", isDone: false)
        let data5 = TodoModel(id: 5, title: "Mummy", description: "nil", date: "my date", time: "my time", isDone: false)
        let data6 = TodoModel(id: 2, title: "Mummy Updated", description: "nil", date: "my date", time: "my time", isDone: false)
        let todo = TodoConfig()
        
//        todo.createTask(task: data)
//        todo.createTask(task: data2)
//        todo.createTask(task: data3)
//        todo.createTask(task: data4)
//        todo.createTask(task: data5)

//        todo.fetchTask()
//        todo.createTask(task: data2)
        
//        todo.deleteTask(id: 4)
//        todo.deleteTask(id: 1)
//        todo.deleteTask(id: 2)
//        todo.deleteTask(id: 3)
//        todo.deleteTask(id: 5)
       
        todo.updateTask(id: 2, updatedTask: data6)
        print(todo.fetchTask())
    }
}
