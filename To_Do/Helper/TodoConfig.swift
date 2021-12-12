//
//  TodoConfig.swift
//  To_Do
//
//  Created by Geniusjames on 11/12/2021.
//

import Foundation

class TodoConfig{
    
    let userDefault = UserDefaults.standard
    var data: [Data]?
    
    init(){
        guard let endcodedList = userDefault.object(forKey: "key") as? [Data] else {
            data = []
            return
            }
        data = endcodedList
        }
            
    
    func  createTask(task: TodoModel){
        
        let encoder = JSONEncoder()
        if let encodedData = try? encoder.encode(task){
            data?.append(encodedData)
            userDefault.set(data, forKey: "key")
            
        }
        
    }
    func deleteTask(){
        
    }
    func updateTask(){
        
    }
    func fetchTask(){
        if let savedTasksEncoded = userDefault.object(forKey: "key") as? [Data] {
            let decoder = JSONDecoder()
            for i in savedTasksEncoded{
                if let decodedTask = try? decoder.decode(TodoModel.self, from: i) {
                    print("reached")
                    print(decodedTask)
                    print(decodedTask.title)
                }
            }
            
        }
    }
}
