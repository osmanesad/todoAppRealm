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
    
    func updateTask(id: ObjectId, complated: Bool){
        if let localRealm = localRealm {
            do {
               let taskToUpdate = localRealm.objects(Task.self).filter(NSPredicate(format: "id == %@", id))
                guard !taskToUpdate.isEmpty else {return}
                
                try localRealm.write {
                    taskToUpdate[0].completed = complated
                    getTasks()
                    print("Güncelleme başarılı. ID: \(id) Tamamlanan: \(complated)")
                }
            } catch {
                print("Hata! Veri güncelleme sorunu. ID: \(id) Hata: \(error)")
            }
        }
        
    }
    
    // MARK: - Delete
    
    func deleteTask(id: ObjectId){
        if let localRealm = localRealm {
            do {
                let taskToDelete = localRealm.objects(Task.self).filter(NSPredicate(format: "id == %@", id))
                guard !taskToDelete.isEmpty else {return}
                
                try localRealm.write{
                    localRealm.delete(taskToDelete)
                    getTasks()
                    print("Silme işlemi başarılı. ID: \(id)")
                }
            } catch {
                print("Hata! Silme işlemi sırasında sorun. ID: \(id) Hata: \(error)")
            }
        }
    }
    
}
