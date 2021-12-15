//
//  TodoViewController.swift
//  To_Do
//
//  Created by Decagon on 12/11/21.
//

import UIKit

class TodoViewController:UIViewController{
    var coordinator:Coordinator?
    var todoConfig = TodoConfig()
    var datePicker = UIDatePicker()
    
    var todos:[(title: String, todo: [TodoModel])]?
    
    func separate(_ todoList: [TodoModel]) -> [(title: String, todo: [TodoModel])]{
        var pending = [TodoModel]()
        var completed = [TodoModel]()
        
        if todoList.count > 0{
            
            for i in 0...todoList.count - 1 {
                
                if todoList[i].isDone == false {
                    pending.append(todoList[i])
                    
                }
                else {
                    completed.append(todoList[i])
                }
            }
        }
        return [(title: "pending", todo: pending), (title: "completed", todo: completed) ]
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.setBack(navigationController: self.navigationController!)
        title = "Todo List"
        navigationItem.hidesBackButton = true
        let todoList = todoConfig.fetchTask()
        
        todos = separate(todoList)
        createDatePicker()
        setUpTableView()
        
        
    }
    
    override func viewDidLayoutSubviews() {
        setUpView()
        
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
        view.layer.borderColor = UIColor.black.cgColor
        view.layer.borderWidth = 1
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 40
        return view
    }()
    
    let add = UIImage(systemName: "plus", withConfiguration: UIImage.SymbolConfiguration(pointSize: 28, weight: .medium))
    
    let cancel = UIImage(systemName: "clear", withConfiguration: UIImage.SymbolConfiguration(pointSize: 28, weight: .medium))
    
    private let fab:UIButton = {
        let fab = UIButton()
        fab.translatesAutoresizingMaskIntoConstraints = false
        fab.setTitleColor(.white, for: .normal)
        fab.layer.cornerRadius = 30
        fab.layer.masksToBounds = true
        fab.tintColor = .white
        fab.backgroundColor = .systemRed
        
        return fab
    }()
    
    
    var todoTitle:TextFieldLeftPadding = {
        var textField = TextFieldLeftPadding()
        textField.layer.borderColor = UIColor.lightGray.cgColor
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "Title"
        textField.autocorrectionType = .no
        textField.heightAnchor.constraint(equalToConstant: 50).isActive = true
        textField.layer.borderWidth = 1
        textField.layer.cornerRadius = 10
        textField.layer.borderWidth = 1
        return textField
    }()
    
    var todoDescription:TextFieldLeftPadding = {
        var textField = TextFieldLeftPadding()
        textField.layer.borderColor = UIColor.lightGray.cgColor
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.heightAnchor.constraint(equalToConstant: 80).isActive = true
        textField.layer.cornerRadius = 10
        textField.placeholder =  "Description"
        textField.autocorrectionType = .no
        textField.layer.borderWidth = 1
        return textField
    }()
    
    
    
    var todoDateTime:TextFieldLeftPadding = {
        var textField = TextFieldLeftPadding()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "15/11/2021 2:00pm"
        textField.autocorrectionType = .no
        textField.layer.borderColor = UIColor.lightGray.cgColor
        textField.heightAnchor.constraint(equalToConstant: 50).isActive = true
        textField.layer.borderWidth = 1
        textField.layer.cornerRadius = 10
        return textField
    }()
    
    let saveButton:UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setTitle("Save", for: .normal)
        btn.setTitleColor(.white, for: .normal)
        btn.layer.cornerRadius = 5
        btn.backgroundColor = .systemBlue
        return btn
    }()
    
    
    
    func createToolBar() -> UIToolbar {
            let toolBar = UIToolbar()
            toolBar.sizeToFit()
            let doneBtn = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: #selector(onClick))
            toolBar.setItems([doneBtn], animated: true)
            return toolBar
        }
    @objc func onClick(){
            let dateFormatter = DateFormatter() // formats the style of the datePicker
            dateFormatter.dateStyle = .medium
            dateFormatter.timeStyle = .none
            self.todoDateTime.text = dateFormatter.string(from: datePicker.date)
            self.view.endEditing(true) // makes the doneButton in the datePicker functional
        }
    func createDatePicker(){
            datePicker.preferredDatePickerStyle = .wheels
            todoDateTime.textAlignment = .justified
            datePicker.datePickerMode = .date
            todoDateTime.inputView = datePicker
            todoDateTime.inputAccessoryView = createToolBar()
        }
    
    
    
    
    
    private var isBootomViewActive = false
    
    @objc func popUp() {
        
        if isBootomViewActive {
            self.fab.setImage(self.cancel, for: .normal)
            for i in self.bottomView.constraints{
                self.bottomView.removeConstraint(i)
            }
            UIView.animate(withDuration: 0.3, animations: {
                
                self.bottomView.heightAnchor.constraint(equalToConstant: 0).isActive = true
                self.view.layoutIfNeeded()
                
                
            }) {(status) in
                self.isBootomViewActive = false
                
            }
        }
        else {
            self.fab.setImage(self.add, for: .normal)
            for i in self.bottomView.constraints{
                self.bottomView.removeConstraint(i)
            }
            UIView.animate(withDuration: 0.3, animations: {
                self.bottomView.heightAnchor.constraint(equalToConstant: 430).isActive = true
                self.view.layoutIfNeeded()
            }) {(status)  in
                self.isBootomViewActive = true
            }
        }
    }
    
    
    
    var param = [String:String]()
    
    @objc func save() {
        
        param["title"] =  todoTitle.text
        param["desc"]  = todoDescription.text
        param["date"]  = todoDateTime.text
        
        let todo = TodoModel(title: param["title"] ?? "",  description: param["desc"] ?? "", date: param["date"] ?? "")
        
        todoConfig.createTask(task: todo)
        tableView.reloadData()
        resetAllTextField()
        popUp()
        gotoTodoPage()
    }
    
    func resetAllTextField() {
        todoTitle.text = ""
        todoDescription.text = ""
        todoDateTime.text = ""
        
        
    }
    
    
    func setUpTableView(){
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(TodoCell.self, forCellReuseIdentifier: TodoCell.reuseIdentifier)
        tableView.separatorStyle = .none
    }
    
    
    func setUpView(){
        
        fab.setImage(add, for: .normal)
        fab.addTarget(self, action: #selector(popUp), for: .touchUpInside)
        saveButton.addTarget(self, action: #selector(save), for: .touchUpInside)
        
        bottomView.addSubview(todoTitle)
        bottomView.addSubview(todoDescription)
        bottomView.addSubview(todoDateTime)
        bottomView.addSubview(saveButton)
        
        
        NSLayoutConstraint.activate([
            
            todoTitle.topAnchor.constraint(equalTo: bottomView.topAnchor, constant: 30),
            
            todoTitle.leadingAnchor.constraint(equalTo: bottomView.leadingAnchor, constant: 15),
            todoTitle.trailingAnchor.constraint(equalTo: bottomView.trailingAnchor, constant: -15),
            
            todoDescription.topAnchor.constraint(equalTo:todoTitle.bottomAnchor, constant: 20),
            
            todoDescription.leadingAnchor.constraint(equalTo: bottomView.leadingAnchor, constant: 15),
            todoDescription.trailingAnchor.constraint(equalTo: bottomView.trailingAnchor, constant: -15),
            
            todoDateTime.topAnchor.constraint(equalTo:todoDescription.bottomAnchor, constant: 20),
            
            todoDateTime.leadingAnchor.constraint(equalTo: bottomView.leadingAnchor, constant: 15),
            todoDateTime.trailingAnchor.constraint(equalTo: bottomView.trailingAnchor, constant: -15),
            
            saveButton.topAnchor.constraint(equalTo: todoDateTime.bottomAnchor, constant: 30),
            saveButton.leadingAnchor.constraint(equalTo: bottomView.leadingAnchor, constant: 15),
            saveButton.trailingAnchor.constraint(equalTo: bottomView.trailingAnchor, constant: -15),
            saveButton.heightAnchor.constraint(equalToConstant: 60),
            
            
        ])
        
        
        
        view.addSubviews(tableView, fab, bottomView)
        
        
        
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
    
    
    func gotoDetailsPage(todo:Int){
        coordinator?.eventOccurred(with: .detail, todoId:todo)
        
    }
    
    func gotoTodoPage(){
        coordinator?.eventOccurred(with: .todolist, todoId: 0)
        
    }
}

extension TodoViewController:UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return todos?.count ?? 0
        
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return todos?[section].todo.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let todoCell = tableView.dequeueReusableCell(withIdentifier: TodoCell.reuseIdentifier, for: indexPath) as? TodoCell else {
            return UITableViewCell()
        }
        
        let section = indexPath.section
        let row = indexPath.row
        if let todo = todos?[section].todo[row]  {
            todoCell.configure(with: todo)
        }
        
        
        
        return todoCell
        
    }
    
    
    
}

extension TodoViewController:UITableViewDelegate {
    
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        if todos?[section].todo.count ?? 0 <= 0  {
            return nil
        }
        
        return todos?[section].title
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let section = indexPath.section
        let row = indexPath.row
        let todo = todos?[section].todo[row].id
        gotoDetailsPage(todo: todo ?? 0)
        
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let section = indexPath.section
        let row = indexPath.row
        let delete = UIContextualAction(style: .normal, title: "Delete") { [self]  (action, view, completionHandler) in
            tableView.beginUpdates()
            let todo = todos?[section].todo[row].id ?? 0
            todos?[section].todo.remove(at:row)
            tableView.deleteRows(at: [indexPath], with: .automatic)
            todoConfig.deleteTask(id: todo)
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
            tableView.beginUpdates()
            gotoTodoPage()
            let todo = todos?[section].todo[row]
            todos?[section].todo[row].isDone = true
            
            let user = TodoModel(title: todo?.title ?? "", description: todo?.description ?? "", date: todo?.date ?? "", isDone: true)
            todoConfig.updateTask(id: todo?.id ?? 0, updatedTask: user)
            gotoTodoPage()
            self.viewDidLoad()
            self.view.setNeedsLayout()
            tableView.reloadData()
            tableView.endUpdates()
            completionHandler(true)
        }
        
        completed.image = UIImage(systemName: "checkmark")
        completed.backgroundColor = .green
        
        let swipe = UISwipeActionsConfiguration(actions: [completed])
        
        return swipe
    }
    
    
}





