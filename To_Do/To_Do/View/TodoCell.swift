//
//  TodoCell.swift
//  To_Do
//
//  Created by Decagon on 12/11/21.
//

import UIKit



class TodoCell {
    
    static let reuseIdentifier = "SlideCell"
    let tableViewModel = TableViewModel()
    
//    convenience init() {
//        self.init()
//        setUpView()
//    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init not implemented yet")
    }

    func setUpView(){
        
    }

    
}


struct Todo{
    let id:Int
    var Title:String
    var date:String
    var isDone:Bool = false
}
