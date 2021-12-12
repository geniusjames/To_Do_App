//
//  TodoConfig.swift
//  To_Do
//
//  Created by Geniusjames on 11/12/2021.
//

import Foundation

class TodoConfig{
    
    let userDefault = UserDefaults.standard
    var data: [String:Data]?
    
    
    init(){
        guard let endcodedList = userDefault.object(forKey: "key2") as? [String:Data] else {
            data = [:]
            return
            }
        data = endcodedList
        }
            
    
    func  createTask(task: TodoModel){
    
        let encoder = JSONEncoder()
        if let encodedData = try? encoder.encode(task){
            print(type(of: encodedData))
            
            data?[String(task.id)] = encodedData

            print("also reached")
            userDefault.set(data, forKey: "key2")
            print("reached?")
        }
        
    }
    func deleteTask(id: Int){
        data?.removeValue(forKey: String(id))
        userDefault.set(data, forKey: "key2")
    }
    func updateTask(){
        
    }
    func fetchTask(){
        let decodeer = JSONDecoder()
        if let savedTasksEncoded = (userDefault.dictionary(forKey: "key2")) as? [String:Data] {
           let tasks = savedTasksEncoded.map{ keys, data in
                let decodedTask = try! decodeer.decode(TodoModel.self, from: data)
                print(type(of: decodedTask))
                print(decodedTask)
            }

        }
    }
}
