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
        let data = TodoModel(title: "James", description: "lets chat", date: "my date", time: "my time", isDone: true)
        let data2 = TodoModel(title: "Abike", description: "nil", date: "my date", time: "my time", isDone: false)
        let data3 = TodoModel(title: "Thomas", description: "nil", date: "my date", time: "my time", isDone: false)
        let data4 = TodoModel(title: "Kelechi", description: "nil", date: "my date", time: "my time", isDone: false)
        let data5 = TodoModel(title: "Mummy", description: "nil", date: "my date", time: "my time", isDone: false)
        let data6 = TodoModel(title: "Mummy Updated", description: "nil", date: "my date", time: "my time", isDone: false)
        let todo = TodoConfig()
        
        todo.createTask(task: data3)
//        todo.createTask(task: data2)
//        todo.createTask(task: data3)
//        todo.createTask(task: data4)
        todo.createTask(task: data6)

//        todo.fetchTask()
//        todo.createTask(task: data2)
        
        todo.deleteTask(id: 6)
        todo.deleteTask(id: 5)
//        todo.deleteTask(id: 4)
//        todo.deleteTask(id: 3)
//        todo.deleteTask(id: 5)
       
//        todo.updateTask(id: 2, updatedTask: data6)
        print(todo.fetchTask())
    }
    
}
