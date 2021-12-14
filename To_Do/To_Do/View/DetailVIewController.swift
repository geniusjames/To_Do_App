//
//  DetailVIewController.swift
//  To_Do
//
//  Created by Decagon on 12/13/21.
//

import UIKit

class DetailViewController: UIViewController {
    var coordinator:Coordinator?
    
    var todoTitle = "Todo List"

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "\(todoTitle)"
        
        
        let data3 = TodoModel(title: "Thomas", description: "nil", date: "my date", time: "my time")
        let data4 = TodoModel(title: "Kelechi", description: "nil", date: "my date", time: "my time")
        let data5 = TodoModel(title: "Mummy", description: "nil", date: "my date", time: "my time")

        let todo = TodoConfig()
//        todo.createTask(task: data3)
        todo.createTask(task: data4)
    }


}
