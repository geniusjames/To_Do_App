//
//  Coordinator.swift
//  To_Do
//
//  Created by Decagon on 12/11/21.
//

import Foundation
import UIKit

protocol Coordinator{
    var navigationController: UINavigationController? {get set}
    var children: [Coordinator]? {get set}
    
    func eventOccurred(with type: Event, todoTitle:String)
    func start()
}
