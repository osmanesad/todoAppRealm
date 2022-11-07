//
//  TasksView.swift
//  todoAppRealm
//
//  Created by Osman Esad on 7.11.2022.
//

import SwiftUI

struct TasksView: View {
    var body: some View {
        
        VStack{
            Text("Görevlerim")
                .font(.title3).bold()
                .padding()
                .frame(maxWidth: .infinity, alignment: .leading)
            
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color(hue: 0.20, saturation: 0.150, brightness: 0.980))
    
        
        
    }
}

struct TasksView_Previews: PreviewProvider {
    static var previews: some View {
        TasksView()
    }
}
