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
        next()
        animate()
    }
    
    lazy var addTaskImage: UIImageView = {
        let iv = UIImageView()
        let image = UIImage(named: "add")
        iv.image = image
        iv.isHidden = true
        return iv
    }()
    lazy var arrow: UIImageView = {
        let iv = UIImageView()
        let image = UIImage(named: "tap")
        iv.image = image
        iv.isHidden = true
        return iv
    }()
    lazy var markDoneImage: UIImageView = {
        let iv = UIImageView()
        let image = UIImage(named: "markdone")
        iv.image = image
        iv.isHidden = true
        return iv
    }()
    lazy var arrowMarkDone: UIImageView = {
        let iv = UIImageView()
        let image = UIImage(named: "dragright")
        iv.image = image
        iv.isHidden = true
        return iv
    }()
    lazy var deleteInstruction: UILabel = {
        let label = UILabel()
        label.text = "Swipe left to delete"
        label.font = UIFont.systemFont(ofSize: 20)
        label.isHidden = true
        return label
    }()
    lazy var markDoneInstruction: UILabel = {
        let label = UILabel()
        label.text = "Swipe right to mark complete"
        label.font = UIFont.systemFont(ofSize: 20)
        label.isHidden = true
        return label
    }()
    lazy var welcomeLabel: UILabel = {
        let label = UILabel()
        label.text = "Welcome to genius-tech Todo app"
        label.font = UIFont.systemFont(ofSize: 20)
        label.isHidden = false
        return label
    }()
    lazy var instructionsLabel: UILabel = {
        let label = UILabel()
        label.text = "Tap the button below to view instructions"
        label.font = UIFont.systemFont(ofSize: 20)
        label.isHidden = false
        return label
    }()
    lazy var addTodoInstruction: UILabel = {
        let label = UILabel()
        label.text = "Tap to add todo"
        label.font = UIFont.systemFont(ofSize: 20)
        label.isHidden = true
        return label
    }()
    lazy var deleteImage: UIImageView = {
        let iv = UIImageView()
        let image = UIImage(named: "delete")
        iv.image = image
        iv.isHidden = true
        return iv
    }()
    lazy var arrowDelete: UIImageView = {
        let iv = UIImageView()
        let image = UIImage(named: "dragleft")
        iv.image = image
        iv.isHidden = true
        return iv
    }()
    lazy var pointDown: UIImageView = {
        let iv = UIImageView()
        let image = UIImage(named: "tapdown")
        iv.image = image
        iv.isHidden = false
        return iv
    }()
    func setUpViews(){
        
        view.addSubviews(addTaskImage)
        view.addSubviews(arrow)
        view.addSubviews(markDoneImage)
        view.addSubviews(arrowMarkDone)
        view.addSubviews(arrowDelete)
        view.addSubviews(deleteImage)
        view.addSubviews(deleteInstruction)
        view.addSubviews(markDoneInstruction)
        view.addSubviews(addTodoInstruction)
        view.addSubviews(nextButton)
        view.addSubviews(pointDown)
        view.addSubviews(instructionsLabel)
        view.addSubviews(welcomeLabel)
        animate()
    }
    
    func addConstraints(){
        let height = UIScreen.main.bounds.height
        let width = UIScreen.main.bounds.width
        
        welcomeLabel.translatesAutoresizingMaskIntoConstraints = false
        welcomeLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        welcomeLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        
        arrow.translatesAutoresizingMaskIntoConstraints = false
        arrow.centerYAnchor.constraint(equalTo: addTaskImage.centerYAnchor).isActive = true
        arrow.trailingAnchor.constraint(equalTo: addTaskImage.leadingAnchor).isActive = true
        arrow.widthAnchor.constraint(equalToConstant: 40).isActive = true
        arrow.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        addTaskImage.translatesAutoresizingMaskIntoConstraints = false
        addTaskImage.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -50).isActive = true
        addTaskImage.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        addTaskImage.widthAnchor.constraint(equalToConstant: height * 0.1).isActive = true
        addTaskImage.heightAnchor.constraint(equalToConstant: height * 0.1).isActive = true
        
        addTodoInstruction.translatesAutoresizingMaskIntoConstraints = false
        addTodoInstruction.centerYAnchor.constraint(equalTo: arrow.centerYAnchor).isActive = true
        addTodoInstruction.trailingAnchor.constraint(equalTo: arrow.leadingAnchor).isActive = true
        
        
        deleteInstruction.translatesAutoresizingMaskIntoConstraints = false
        deleteInstruction.centerYAnchor.constraint(equalTo: arrowDelete.centerYAnchor).isActive = true
        
        deleteInstruction.trailingAnchor.constraint(equalTo: arrowDelete.leadingAnchor, constant: -10).isActive = true
        
        arrowMarkDone.translatesAutoresizingMaskIntoConstraints = false
        arrowMarkDone.topAnchor.constraint(equalTo: markDoneImage.bottomAnchor, constant: 10).isActive = true
        arrowMarkDone.widthAnchor.constraint(equalToConstant: 40).isActive = true
        arrowMarkDone.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        arrowMarkDone.heightAnchor.constraint(equalToConstant: 40).isActive = true
        arrowMarkDone.widthAnchor.constraint(equalToConstant: width * 0.15).isActive = true
        
        markDoneInstruction.translatesAutoresizingMaskIntoConstraints = false
        markDoneInstruction.leadingAnchor.constraint(equalTo: arrowMarkDone.trailingAnchor, constant: 10).isActive = true
        markDoneInstruction.centerYAnchor.constraint(equalTo: arrowMarkDone.centerYAnchor).isActive = true
        
        arrowDelete.translatesAutoresizingMaskIntoConstraints = false
        arrowDelete.topAnchor.constraint(equalTo: deleteImage.bottomAnchor, constant: 10).isActive = true
        arrowDelete.widthAnchor.constraint(equalToConstant: 40).isActive = true
        arrowDelete.heightAnchor.constraint(equalToConstant: 40).isActive = true
        arrowDelete.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        arrowDelete.widthAnchor.constraint(equalToConstant: width * 0.15).isActive = true
        
        markDoneImage.frame = CGRect(x: 0, y: height * 0.2, width: width, height: height * 0.07)
        deleteImage.frame = CGRect(x: 0, y: height * 0.5, width: width, height: height * 0.09)
        
        nextButton.translatesAutoresizingMaskIntoConstraints = false
        nextButton.widthAnchor.constraint(equalToConstant: width * 0.4).isActive = true
        nextButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        nextButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -40).isActive = true
        
        pointDown.translatesAutoresizingMaskIntoConstraints = false
        pointDown.bottomAnchor.constraint(equalTo: nextButton.topAnchor, constant: 3).isActive = true
        pointDown.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        pointDown.heightAnchor.constraint(equalToConstant: 80).isActive = true
        pointDown.widthAnchor.constraint(equalToConstant: 80).isActive = true
        
        instructionsLabel.translatesAutoresizingMaskIntoConstraints = false
        instructionsLabel.bottomAnchor.constraint(equalTo: pointDown.topAnchor, constant: 3).isActive = true
        instructionsLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true

        
    }
    var backgroundColor = UIColor(red: 212/255, green: 241/255, blue: 255/255, alpha: 1)
    lazy var nextButton: UIButton = {
        let button = UIButton()
        button.setTitle("View Instructions", for: .normal)
        button.layer.cornerRadius = 11
        button.backgroundColor = .blue
        
        return button
    }()
    func animate(){
        UIView.animate(withDuration: 0.7, animations: {
            self.pointDown.frame = CGRect(x: 60, y: 400, width: 200, height: 200)
        
        })
    }
    func next(){
        nextButton.addTarget(self, action: #selector(displayInstructions), for: .touchUpInside)
    }
    func gotoDetailsPage(todo:String){
        coordinator?.eventOccurred(with: .detail, todoTitle: todo)
    }
    var count = 0
    @objc func displayInstructions(){
        count += 1
        if count == 1{
            instructionsLabel.isHidden = true
            pointDown.isHidden = true
            welcomeLabel.isHidden = true
            nextButton.setTitle("Next", for: .normal)
            arrow.isHidden = false
            addTodoInstruction.isHidden = false
            addTaskImage.isHidden = false
            view.backgroundColor = backgroundColor
            
            UIView.animate(withDuration: 0.7, animations: {
                self.arrow.frame = CGRect(x: 60, y: 0, width: 200, height: 200)
            
            })
        }
        if count == 2{
            arrow.isHidden = true
            addTodoInstruction.isHidden = true
            addTaskImage.isHidden = true
            
            markDoneImage.isHidden = false
            arrowMarkDone.isHidden = false
            markDoneInstruction.isHidden = false
            view.backgroundColor = backgroundColor
            
            UIView.animate(withDuration: 0.7, animations: {
                self.arrowMarkDone.frame = CGRect(x: 0, y: 0, width: 200, height: 200)
            
            })
            
        }
        if count == 3{
            markDoneImage.isHidden = true
            arrowMarkDone.isHidden = true
            markDoneInstruction.isHidden = true

            deleteImage.isHidden = false
            deleteInstruction.isHidden = false
            arrowDelete.isHidden = false
            nextButton.setTitle("Welcome", for: .normal)
            view.backgroundColor = backgroundColor
            
            UIView.animate(withDuration: 0.7, animations: {
                self.arrowDelete.frame = CGRect(x: 0, y: 0, width: 200, height: 200)
            
            })
        }
        if count == 4 {
            gotoDetailsPage(todo: "")
            view.backgroundColor = .white
        }
    }
}
