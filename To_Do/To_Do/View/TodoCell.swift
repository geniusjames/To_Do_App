//
//  TodoCell.swift
//  To_Do
//
//  Created by Decagon on 12/11/21.
//

import UIKit



class TodoCell: UITableViewCell {
    
    static let reuseIdentifier = "TodoCell"
    let tableViewModel = TableViewModel()
    
    
    let todoLabel:UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 1
        label.font = UIFont.systemFont(ofSize: 18, weight: .regular)
        return label
    }()
    
    
    let  checkbox:UIImageView = {
        let image = UIImageView()
        image.tintColor = .black
        return image
    }()
    
    
    
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func layoutSubviews() {
        setUpView()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        todoLabel.text = nil
        checkbox.image = nil
        
        
    }
    
    func configure(with todo:Todo){
        updateUI(title: todo.title, image: todo.isDone ? "checkmark.square" : "app", color:  todo.isDone ? .systemGreen : .systemGray)
        
    }
    

    private func updateUI(title:String?, image:String, color:UIColor){
        checkbox.image = UIImage(systemName: image)
        checkbox.tintColor = color
        todoLabel.text = title
    }
    
    
    
    
    func setUpView(){
        
        //        checkbox.image = UIImage(systemName: "checkmark.square")
        
        contentView.addSubviews(checkbox, todoLabel)
        let size = contentView.frame.size.height - 6
        let fit = checkbox.sizeThatFits(contentView.frame.size)
        
        checkbox.frame = CGRect(x: 20, y: (contentView.frame.height - fit.height)/2, width: fit.width, height: fit.height)
        
        
        todoLabel.frame = CGRect(x: 30 + checkbox.frame.size.width, y: 0, width: contentView.frame.size.width - 10 - size, height: contentView.frame.size.height)
        
        
        
        
    }
    
    
}



