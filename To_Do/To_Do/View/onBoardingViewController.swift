//
//  onBoardingViewController.swift
//  To_Do
//
//  Created by Decagon on 12/11/21.
//

import UIKit

class onBoardingViewController: UIViewController {
    let todo = TodoConfig()
    var coordinator:Coordinator?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "onboarding"
        let data = TodoModel(title: "James", description: "lets chat", date: "my date", time: "my time", isDone: true)
        let data2 = TodoModel(title: "Abike", description: "nil", date: "my date", time: "my time", isDone: false)
        let data3 = TodoModel(title: "Thomas", description: "nil", date: "my date", time: "my time", isDone: false)
        let data4 = TodoModel(title: "Kelechi", description: "nil", date: "my date", time: "my time", isDone: false)
        let data5 = TodoModel(title: "Mummy", description: "nil", date: "my date", time: "my time", isDone: false)
//        let data6 = TodoModel(title: "Mummy Updated", description: "nil", date: "my date", time: "my time", isDone: false)
        let todo = TodoConfig()
        todo.createTask(task: data3)
        todo.createTask(task: data2)
//        todo.createTask(task: data3)
//        todo.createTask(task: data5)
//        todo.createTask(task: data2)

//        todo.fetchTask()
//        todo.createTask(task: data2)
        for i in 31...34{
            todo.deleteTask(id: 30)

        }
        

        //        todo.deleteTask(id: 21)
//        todo.deleteTask(id: 20)
//        todo.deleteTask(id: 19)
//
        todo.updateTask(id: 31, updatedTask: data)
        print(todo.fetchTask())
        setUpViews()
        addConstraints()
    }
    
    lazy var addTaskImage: UIImageView = {
        let iv = UIImageView()
        let image = UIImage(named: "add")
        iv.image = image
        iv.isHidden = false
        return iv
    }()
    lazy var arrow: UIImageView = {
        let iv = UIImageView()
        let image = UIImage(systemName: "arrow.right")
        iv.image = image
        iv.isHidden = false
        return iv
    }()
    
    
    func setUpViews(){
        view.addSubviews(addTaskImage)
        view.addSubviews(arrow)
    }
    func addConstraints(){
        let height = UIScreen.main.bounds.height
        let width = UIScreen.main.bounds.width
        
     
        arrow.translatesAutoresizingMaskIntoConstraints = false
        arrow.centerYAnchor.constraint(equalTo: addTaskImage.centerYAnchor).isActive = true
        arrow.trailingAnchor.constraint(equalTo: addTaskImage.leadingAnchor).isActive = true
        arrow.widthAnchor.constraint(equalToConstant: width * 0.15).isActive = true
//         arrow.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -50).isActive = true
        
        addTaskImage.translatesAutoresizingMaskIntoConstraints = false
        addTaskImage.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -50).isActive = true
        addTaskImage.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        addTaskImage.widthAnchor.constraint(equalToConstant: height * 0.1).isActive = true
        addTaskImage.heightAnchor.constraint(equalToConstant: height * 0.1).isActive = true
        
        addTaskImage.backgroundColor = .blue
    }
}
