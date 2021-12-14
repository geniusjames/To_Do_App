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
    var todoConfig = TodoConfig()
    
   
    var todos = [
        
        (title : "Pending", todo : [Todo(id: 4, title: "Go to the end of the  Eat", date: "Later", isDone: false), Todo(id: 6, title: "cook everything cookable", date: "today")
                                   ]),
        
        (title : "Completed",
         todo: [Todo(id: 8, title: "Code my mind out from reality", date: "Today", isDone: true)]),
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        var todoList = todoConfig.fetchTask()
        print(todoList)
        view.setBack(navigationController: self.navigationController!)
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
        tableView.backgroundColor = .systemGray.withAlphaComponent(0.05)
        return tableView
    }()
    
     var bottomView:UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 40
        return view
    }()
    
    private let fab:UIButton = {
        let fab = UIButton()
        fab.translatesAutoresizingMaskIntoConstraints = false
        let image = UIImage(systemName: "plus", withConfiguration: UIImage.SymbolConfiguration(pointSize: 28, weight: .medium))
        fab.setImage(image, for: .normal)
        fab.setTitleColor(.white, for: .normal)
        fab.layer.cornerRadius = 30
        fab.layer.masksToBounds = true
        fab.tintColor = .white
        fab.backgroundColor = .systemRed
        
        return fab
    }()
    
    
    
    private let closeButton:UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        let image = UIImage(systemName: "clear.fill", withConfiguration: UIImage.SymbolConfiguration(pointSize: 28, weight: .medium))
        button.setImage(image, for: .normal)
        button.tintColor = .white
        return button
    }()
    
    private var isBootomViewActive = false
    
    @objc func popUp() {
        if isBootomViewActive {
            UIView.animate(withDuration: 0.3, animations: {
                self.bottomView.heightAnchor.constraint(equalToConstant: 0).isActive = true
                self.view.layoutIfNeeded()
        }) {(status) in
            
            self.isBootomViewActive = false
        }
        }
        else {
            UIView.animate(withDuration: 0.3, animations: {
                self.bottomView.heightAnchor.constraint(equalToConstant: 430).isActive = true
//                self.fab.setImage(UIImage(systemName: "clear"), for: .normal)
                self.view.layoutIfNeeded()
            }) {(status)  in
                
                self.isBootomViewActive = true
                print(self.isBootomViewActive)
            }
            
        }
      
    }


    
    func setUpTableView(){
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(TodoCell.self, forCellReuseIdentifier: TodoCell.reuseIdentifier)
        tableView.separatorStyle = .none
    }
    
    
    func setUpView(){
        
        fab.addTarget(self, action: #selector(popUp), for: .touchUpInside)
        
//        bottomView.addSubview(closeButton)
        bottomView.backgroundColor = .red
        view.addSubviews(tableView, fab, bottomView)
        
//        fab.addTarget(self, action: #selector(popUp), for: .touchUpInside)
//        closeButton.addTarget(self, action: #selector(popUp), for: .touchUpInside)
        
//        fab.frame = CGRect(x: view.frame.size.width - 70, y: view.frame.size.height - 1000, width: 60, height: 60)
        
        let layout = view.safeAreaLayoutGuide
        NSLayoutConstraint.activate([
            
            tableView.topAnchor.constraint(equalTo: layout.topAnchor, constant: 5),
            tableView.leadingAnchor.constraint(equalTo: layout.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: layout.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo:layout.bottomAnchor),
            
            bottomView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            bottomView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            bottomView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            bottomView.widthAnchor.constraint(equalTo: view.widthAnchor),

            
            fab.bottomAnchor.constraint(equalTo: bottomView.topAnchor, constant: -30),
            fab.trailingAnchor.constraint(equalTo: layout.trailingAnchor, constant: -20),
            fab.widthAnchor.constraint(equalToConstant: 60),
            fab.heightAnchor.constraint(equalToConstant: 60)
            
            
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





