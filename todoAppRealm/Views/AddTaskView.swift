//
//  AddTaskView.swift
//  todoAppRealm
//
//  Created by Osman Esad on 8.11.2022.
//

import SwiftUI

struct AddTaskView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 20){
            Text("Yeni görev oluştur.")
                .font(.title3).bold()
        }
        .padding(.top, 40)
        .padding(.horizontal)
        .background(Color(hue: 0.20, saturation: 0.150, brightness: 0.980))
    
    }
        
}

struct AddTaskView_Previews: PreviewProvider {
    static var previews: some View {
        AddTaskView()
    }
}
