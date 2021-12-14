//
//  TodoModel.swift
//  To_Do
//
//  Created by Geniusjames on 11/12/2021.
//

import Foundation

struct TodoModel: Codable{
    var id: Int?
    var title: String
    var description: String
    var date: String
    var time: String
    var isDone: Bool = false
}
