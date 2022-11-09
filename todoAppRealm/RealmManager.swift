//
//  RealmManager.swift
//  todoAppRealm
//
//  Created by Osman Esad on 9.11.2022.
//

import SwiftUI
import RealmSwift

class RealmManager: ObservableObject {
    private(set) var localRealm: Realm?
    @Published private(set) var tasks: [Task] = []
    
    init() {
        openRealm()
        getTasks()
    }
    
    func openRealm() {
        do {
            let config = Realm.Configuration(schemaVersion: 1)
            
            //            ,  migrationBlock: { migration, oldSchemaVersions in
            //            if oldSchemaVersions > 1 {
            //                //
            //            }
            //
            //        }
            
            Realm.Configuration.defaultConfiguration = config
            
            localRealm = try Realm()
            
        } catch {
            print("Error opening Real: \(error)") // Realm bağlantısıyla ilgi bir sorun var.
        }
    }
    
    
    // MARK: - Create
    func addTask(taskTitle: String) {
        if let localRealm = localRealm {
            do {
                try localRealm.write {
                    let newTask = Task(value: ["title": taskTitle, "completed": false])
                    localRealm.add(newTask)
                    getTasks()
                    print("Kayıt Başarılı: \(newTask)")
                }
                
            } catch {
                print("Hata! Görev eklenirken sorun oluştu. \(error)")
            }
        }
        
    }
    
    // MARK: - Read
    
    func getTasks() {
        if let localRealm = localRealm {
            let allTask = localRealm.objects(Task.self).sorted(byKeyPath: "completed")
            tasks = []
            allTask.forEach{task in
                tasks.append(task)}
        }
    }
    
    // MARK: - Update
    
}
