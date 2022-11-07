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
            Image(systemName: complated ? "checkmark.circle" : "circle")
            
            Text(task)
        }
    }
}

struct TaskRow_Previews: PreviewProvider {
    static var previews: some View {
        TaskRow(task: "Kod yaz!", complated: true)
    }
}
