//
//  DetailVIewController.swift
//  To_Do
//
//  Created by Decagon on 12/13/21.
//

import UIKit

class DetailViewController: UIViewController {
    var coordinator:Coordinator?
    
    var todoTitle = "Todo List"

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "\(todoTitle)"
    }


}
