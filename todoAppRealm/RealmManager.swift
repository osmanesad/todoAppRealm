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
            
            Realm.Configuration.defaultConfiguration = config
            
            localRealm = try Realm()
            
        } catch {
            print("Error opening Real: \(error)") // Realm bağlantısıyla ilgi bir sorun var.
        }
    }
}
