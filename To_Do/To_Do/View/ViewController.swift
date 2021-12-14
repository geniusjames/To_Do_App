//
//  ViewController.swift
//  To_Do
//
//  Created by Geniusjames on 11/12/2021.
//

import UIKit

class ViewController: UIViewController{
    var coordinator:Coordinator?
    
    var todoTitle = "Todo List"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "\(todoTitle)"
        addSubviews()
        setUpView()
    }
    func addSubviews(){
        let barItem = UIBarButtonItem(title: "Edit", style: .done, target: self, action: #selector(editTask))
        self.navigationItem.rightBarButtonItem = barItem
        view.addSubviews(date)
        view.addSubviews(time)
        view.addSubviews(todoDescription)
        view.addSubviews(updateButton)
    }
    lazy var date: UILabel = {
        let label = UILabel()
        label.text = "Date"
        label.backgroundColor = . yellow
        return label
    }()
    lazy var time: UILabel = {
        let label = UILabel()
        label.text = "Time"
        return label
    }()
    lazy var todoDescription: UITextView = {
        let textView = UITextView()
        textView.layer.cornerRadius = 20
        textView.backgroundColor = .clear
//        textView.isEnabled = false
        
        return textView
    }()
    lazy var updateButton: UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = 13
        button.setTitle("Update", for: .normal)
        button.isHidden = true
        button.backgroundColor = .systemRed
        
        return button
    }()
    func setUpView(){
        let screen = UIScreen.main.bounds
        let height = screen.height
        
        
        date.translatesAutoresizingMaskIntoConstraints = false
        date.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20).isActive = true
        date.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        date.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 20).isActive = true
        
        time.translatesAutoresizingMaskIntoConstraints = false
        time.topAnchor.constraint(equalTo: date.bottomAnchor, constant: 20).isActive = true
        time.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        time.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 20).isActive = true
        
        todoDescription.translatesAutoresizingMaskIntoConstraints = false
        todoDescription.topAnchor.constraint(equalTo: time.bottomAnchor, constant: 20).isActive = true
        todoDescription.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        todoDescription.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        todoDescription.heightAnchor.constraint(equalToConstant: height * 0.3).isActive = true
        
        updateButton.translatesAutoresizingMaskIntoConstraints = false
        updateButton.topAnchor.constraint(equalTo: todoDescription.bottomAnchor, constant: 20).isActive = true
        updateButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        updateButton.widthAnchor.constraint(equalToConstant: screen.width * 0.4).isActive = true
        updateButton.heightAnchor.constraint(equalToConstant: height * 0.05).isActive = true
        
    }
    @objc func editTask(){
        todoDescription.backgroundColor = .lightGray
        updateButton.isHidden = true
        let barItem = UIBarButtonItem(title: "Update", style: .done, target: self, action: #selector(updateTask))
        barItem.tintColor = .systemRed
        self.navigationItem.rightBarButtonItem = barItem
        view.reloadInputViews()
    }
    @objc func updateTask(){
        todoDescription.backgroundColor = .clear
        updateButton.isHidden = true
        let barItem = UIBarButtonItem(title: "Edit", style: .done, target: self, action: #selector(editTask))
        self.navigationItem.rightBarButtonItem = barItem
        view.reloadInputViews()
    }
    
}

