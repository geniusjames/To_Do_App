//
//  TodoConfig.swift
//  To_Do
//
//  Created by Geniusjames on 11/12/2021.
//

import Foundation

class TodoConfig{
    
    let userDefault = UserDefaults.standard
    var count: Int
    var data: [String:Data]?
    
    
    init(){
        guard let endcodedList = userDefault.object(forKey: "key2") as? [String:Data] else {
            data = [:]
            count = 0
            return
            }
        count = userDefault.integer(forKey: "count")
        data = endcodedList
        }
            
    
    func  createTask(task: TodoModel){
        var task = task
        let id = count + 1
        task.id = id
        userDefault.set(id, forKey: "count")
        let encoder = JSONEncoder()
        if let encodedData = try? encoder.encode(task){
            data?[String(id)] = encodedData
            userDefault.set(data, forKey: "key2")
        }
    }
    func deleteTask(id: Int){
        data?.removeValue(forKey: String(id))
        userDefault.set(data, forKey: "key2")
    }
    func updateTask(id: Int, updatedTask: TodoModel){
        var updatedTask = updatedTask
        updatedTask.id = id
            let encoder = JSONEncoder()
            if let updatedEncodedTask = try? encoder.encode(updatedTask){
                data?[String(id)] = updatedEncodedTask
                userDefault.set(data, forKey: "key2")
            }
    }
    func fetchTask() -> [TodoModel]{
        let decodeer = JSONDecoder()
        if let savedTasksEncoded = (userDefault.dictionary(forKey: "key2")) as? [String:Data] {
           let tasks = savedTasksEncoded.map{ keys, data -> TodoModel in
               let decodedTask: TodoModel = try! decodeer.decode(TodoModel.self, from: data)
              
               return decodedTask
            }
            return tasks

        }
        return []
    }
}
