//
//  TodoViewController.swift
//  To_Do
//
//  Created by Decagon on 12/11/21.
//

import UIKit


class TodoViewController:UIViewController{
    var coordinator:Coordinator?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Todo List"
    }
}

extension TodoViewController:UITableViewDataSource{
    
}

extension TodoViewController:UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        <#code#>
    }
    
}


