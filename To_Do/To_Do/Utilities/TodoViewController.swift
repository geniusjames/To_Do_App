//
//  TodoViewController.swift
//  To_Do
//
//  Created by Decagon on 12/11/21.
//

import UIKit

class Todo{
    let id:Int
    var title:String
    var date:String
    var isDone:Bool
    
    init(id:Int, title:String, date:String, isDone:Bool = false){
        self.id = id
        self.title = title
        self.date = date
        self.isDone = isDone
    }
}




class TodoViewController:UIViewController{
    var coordinator:Coordinator?
    
    let pending:[Todo] = ["Eat", "Drink", "Code", "Sleep", "Repeat"].compactMap({Todo(id:3, title: $0, date: "")})
    
    let done:[Todo] = ["Joke", "Relax", "Fuck", "Sleep", "Repeat"].compactMap({Todo(id:5, title: $0, date: "", isDone: true)})
    
    var todos = [
        
        (title : "Pending", todo : [Todo(id: 4, title: "Eat", date: "Later", isDone: false), Todo(id: 6, title: "cook", date: "today")
                                   ]),
        
        (title : "Completed",
         todo: [Todo(id: 8, title: "Code", date: "Today", isDone: true)]),
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
    
    
    func gotoDetailsPage(todo:String){
        coordinator?.eventOccurred(with: .detail, todoTitle: todo)
        
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

extension TodoViewController:UITableViewDelegate {
    
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        if todos[section].todo.isEmpty {
            return nil
        }
        
        return todos[section].title
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let section = indexPath.section
        let row = indexPath.row
        let todo = todos[section].todo[row].title
        gotoDetailsPage(todo: todo)
        
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let section = indexPath.section
        let row = indexPath.row
        let delete = UIContextualAction(style: .normal, title: "Delete") { [self]  (action, view, completionHandler) in
            tableView.beginUpdates()
            self.todos[section].todo.remove(at:row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            tableView.endUpdates()
            
            completionHandler(true)
        }
        delete.image = UIImage(systemName: "trash")
        delete.backgroundColor = .red
        
        let swipe = UISwipeActionsConfiguration(actions: [delete])
        
        return swipe
        
    }
    
    
    func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let section = indexPath.section
        let row = indexPath.row
        
        let completed = UIContextualAction(style: .normal, title: "Completed") {[self] (action, view, completionHandler) in
            self.todos[section].todo[row].isDone = true
            tableView.reloadData()
            completionHandler(true)
        }
        
        completed.image = UIImage(systemName: "checkmark")
        completed.backgroundColor = .green
        
        let swipe = UISwipeActionsConfiguration(actions: [completed])
        
        return swipe
    }
    
    
}





