//
//  ViewController.swift
//  To_Do
//
//  Created by Geniusjames on 11/12/2021.
//

import UIKit

class ViewController: UIViewController{
    var coordinator:Coordinator?
    let userDefault = UserDefaults.standard
    var todoId = 0;
    var todoConfig = TodoConfig()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "\(todoId)"
        addSubviews()
        setUpView()
        updateFields()
    }
    func addSubviews(){
        let barItem = UIBarButtonItem(title: "Edit", style: .done, target: self, action: #selector(editTask))
        self.navigationItem.rightBarButtonItem = barItem
        view.addSubviews(date)
        view.addSubviews(todoDescription)
        view.addSubviews(updateButton)
        view.addSubviews(editTitle)
    }
    lazy var date: UILabel = {
        let label = UILabel()
        label.text = "Date"
        return label
    }()

    lazy var todoDescription: UITextView = {
        let textView = UITextView()
        textView.layer.cornerRadius = 5
        textView.backgroundColor = .clear
        textView.layer.borderColor = CGColor(red: 222/255, green: 222/255, blue: 222/255, alpha: 1)
        textView.isEditable = false
        //        textView.isEnabled = false
        
        return textView
    }()
    lazy var editTitle: UITextField = {
        let textField = UITextField()
        textField.layer.cornerRadius = 3
        textField.placeholder = "Title"
        textField.backgroundColor = .clear
        textField.borderStyle = .roundedRect
        textField.isEnabled = false
        //        textView.isEnabled = false
            
        return textField
    }()
    lazy var updateButton: UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = 13
        button.setTitle("Update", for: .normal)
        button.isHidden = true
        button.backgroundColor = .systemGreen
        
        return button
    }()
    func setUpView(){
        let screen = UIScreen.main.bounds
        let height = screen.height
        
        
        date.translatesAutoresizingMaskIntoConstraints = false
        date.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20).isActive = true
        date.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        date.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 20).isActive = true
        
        editTitle.translatesAutoresizingMaskIntoConstraints = false
        editTitle.topAnchor.constraint(equalTo: date.bottomAnchor, constant: 20).isActive = true
        editTitle.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        editTitle.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        
        todoDescription.translatesAutoresizingMaskIntoConstraints = false
        todoDescription.topAnchor.constraint(equalTo: editTitle.bottomAnchor, constant: 20).isActive = true
        todoDescription.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        todoDescription.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        todoDescription.heightAnchor.constraint(equalToConstant: height * 0.3).isActive = true
        
        updateButton.translatesAutoresizingMaskIntoConstraints = false
        updateButton.topAnchor.constraint(equalTo: todoDescription.bottomAnchor, constant: 20).isActive = true
        updateButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        updateButton.widthAnchor.constraint(equalToConstant: screen.width * 0.4).isActive = true
        updateButton.heightAnchor.constraint(equalToConstant: height * 0.05).isActive = true

    }
    let backgroundColor = UIColor(red: 212/255, green: 241/255, blue: 255/255, alpha: 1)

    @objc func editTask(){
        todoDescription.backgroundColor = backgroundColor
        editTitle.backgroundColor = backgroundColor
        todoDescription.isEditable = true
        editTitle.isEnabled = true
        
        updateButton.isHidden = true
        let barItem = UIBarButtonItem(title: "Update", style: .done, target: self, action: #selector(updateTask))
        barItem.tintColor = .systemRed
        self.navigationItem.rightBarButtonItem = barItem
        view.reloadInputViews()
    }
    @objc func updateTask(){
        let currentTask = todoConfig.fetchCurrentTask(id: todoId)

        
        todoDescription.backgroundColor = .clear
        editTitle.backgroundColor = .clear
        updateButton.isHidden = true
        let barItem = UIBarButtonItem(title: "Edit", style: .done, target: self, action: #selector(editTask))
        self.navigationItem.rightBarButtonItem = barItem
        todoConfig.updateTask(id: todoId, updatedTask: TodoModel(id: todoId, title: editTitle.text ?? "", description: todoDescription.text, date: currentTask.date, isDone: currentTask.isDone))

        view.reloadInputViews()
    }
    func updateFields(){
        let currentTask = todoConfig.fetchCurrentTask(id: todoId)
        navigationItem.title = currentTask.title
        editTitle.text = currentTask.title
        todoDescription.text = currentTask.description
        date.text = currentTask.date
    }
}

