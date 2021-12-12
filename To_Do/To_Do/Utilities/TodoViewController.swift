//
//  TodoViewController.swift
//  To_Do
//
//  Created by Decagon on 12/11/21.
//

import UIKit


class TodoViewController:UIViewController{
    var coordinator:Coordinator?
    
    var todos = [
        
        (title : "other", todo : [Todo(id: 4, title: "Eat", date: "Later", isDone: false)]),
        
        (title : "today",
        todo: [Todo(id: 4, title: "Code", date: "Today", isDone: true)]),
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Todo List"
    }
    
    override func viewDidLayoutSubviews() {
        setUpView()
        setUpTableView()
    }
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.frame = view.frame
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    
    
    func setUpTableView(){
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(TodoCell.self, forCellReuseIdentifier: TodoCell.reuseIdentifier)
        tableView.separatorStyle = .none
    }
    
    
    func setUpView(){
        view.addSubviews(tableView)
    
        let layout = view.safeAreaLayoutGuide
        NSLayoutConstraint.activate([
        
            tableView.topAnchor.constraint(equalTo: layout.topAnchor, constant: 5),
            tableView.leadingAnchor.constraint(equalTo: layout.leadingAnchor, constant: 10),
            tableView.trailingAnchor.constraint(equalTo: layout.trailingAnchor, constant: -10),
            tableView.bottomAnchor.constraint(equalTo:layout.bottomAnchor, constant: -30),
            
           
        ])
        
      
    }
}

extension TodoViewController:UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return todos.count
        
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return todos[section].todo.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let todoCell = tableView.dequeueReusableCell(withIdentifier: TodoCell.reuseIdentifier, for: indexPath) as? TodoCell else {
            return UITableViewCell()
        }
        
        let section = indexPath.section
        let row = indexPath.row
        let todo = todos[section].todo[row]

        todoCell.configure(with: todo)
        
        return todoCell
        
    }
    
    
}

extension TodoViewController:UITableViewDelegate{
    

    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("item at \(indexPath) selected")
    }
    
    func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        return UISwipeActionsConfiguration()
    
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        return UISwipeActionsConfiguration()
    }
    
}





