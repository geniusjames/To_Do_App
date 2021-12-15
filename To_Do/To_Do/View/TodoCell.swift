//
//  TodoCell.swift
//  To_Do
//
//  Created by Decagon on 12/11/21.
//

import UIKit



class TodoCell: UITableViewCell {
    
    static let reuseIdentifier = "TodoCell"
    
    
    let todoLabel:UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 1
        label.font = UIFont.systemFont(ofSize: 18, weight: .regular)
        return label
    }()
    
    
    let  checkbox:UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.tintColor = .black
        return image
    }()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setUpView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        todoLabel.text = nil
        checkbox.image = nil
        
        
    }
    
    func configure(with todo:TodoModel){
        updateUI(title: todo.title, image: todo.isDone ? "checkmark.square" : "app", color:  todo.isDone ? .systemGreen : .systemGray)
        
    }
    
    
    private func updateUI(title:String?, image:String, color:UIColor){
        checkbox.image = UIImage(systemName: image)
        checkbox.tintColor = color
        todoLabel.text = title
    }
    
    
    
    
    func setUpView(){
        self.addSubviews(checkbox, todoLabel)
        
        
        NSLayoutConstraint.activate([
            checkbox.topAnchor.constraint(equalTo: self.topAnchor, constant: 10),
            checkbox.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            checkbox.widthAnchor.constraint(equalToConstant: 30),
            checkbox.heightAnchor.constraint(equalToConstant: 30),
            
            todoLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 10),
            todoLabel.leadingAnchor.constraint(equalTo: checkbox.leadingAnchor, constant: 40),
            todoLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            todoLabel.heightAnchor.constraint(equalToConstant: 30),
            
        ])
    }
    
    
}



