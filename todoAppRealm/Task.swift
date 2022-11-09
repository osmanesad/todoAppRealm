//
//  Task.swift
//  todoAppRealm
//
//  Created by Osman Esad on 9.11.2022.
//

import SwiftUI
import RealmSwift

class Task: Object, ObjectKeyIdentifiable {
    @Persisted(primaryKey: true) var id: ObjectId
    @Persisted var title = ""
    @Persisted var completed = false
}
