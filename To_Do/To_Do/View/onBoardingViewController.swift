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
//        let data2 = TodoModel(id: 1, title: "James Anyanwu", description: "nil", date: "my date", time: "my time", isDone: false)
        let todo = TodoConfig()
//        todo.createTask(task: data)
//        todo.fetchTask()
//        todo.createTask(task: data2)
        todo.fetchTask()
    }
}
