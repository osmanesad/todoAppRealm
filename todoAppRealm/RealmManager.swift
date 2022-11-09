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
    
    init() {
        openRealm()
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
    // MARK: - Add Operaiton
    func addTask(taskTitle: String) {
        if let localRealm = localRealm {
            do {
                try localRealm.write {
                    let newTask = Task(value: ["title": taskTitle, "completed": false])
                    localRealm.add(newTask)
                    print("Kayıt Başarılı: \(newTask)")
                }
                
            } catch {
                print("Hata! Görev eklenirken sorun oluştu. \(error)")
            }
        }
        
    }
}
