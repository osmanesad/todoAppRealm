//
//  AddTaskView.swift
//  todoAppRealm
//
//  Created by Osman Esad on 8.11.2022.
//

import SwiftUI

struct AddTaskView: View {
    
    @State private var title: String = ""
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20){
            Text("Yeni görev oluştur.")
                .font(.title3).bold()
                .frame(maxWidth: .infinity, alignment: .leading)
            
            TextField("Yeni görevi ekle", text: $title)
                .textFieldStyle(.roundedBorder)
            
            Button{
                print("Yeni görev eklendi.")
            } label: {
                Text("Ekle")
                    .foregroundColor(.white)
                    .padding()
                    .padding(.horizontal)
                    .background(.green)
            }
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
