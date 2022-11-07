//
//  TaskRow.swift
//  todoAppRealm
//
//  Created by Osman Esad on 7.11.2022.
//

import SwiftUI

struct TaskRow: View {
    var task: String
    var complated: Bool
    var body: some View {
        
        HStack(spacing: 20){
            Image(systemName: "circle")
        }
    }
}

struct TaskRow_Previews: PreviewProvider {
    static var previews: some View {
        TaskRow(task: "Okunacaklar", complated: true)
    }
}
