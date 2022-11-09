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
            Text("Görev oluştur.")
                .font(.title3).bold()
                .frame(maxWidth: .infinity, alignment: .leading)
            
            TextField("Kitap okumalıyım.", text: $title)
                .textFieldStyle(.roundedBorder)
                //.cornerRadius(26)
            
            Button{
                print("Yeni görev eklendi.")
            } label: {
                Text("Ekle")
                    .foregroundColor(.white)
                    .padding()
                    .padding(.horizontal)
                    .background(Color(red: 0.10196078431372549, green: 0.5372549019607843, blue: 0.09019607843137255))
                    .cornerRadius(26)
            }
            Spacer()
        }
        .padding(.top, 40)
        .padding(.horizontal)
        .background(Color(hue: 0.16, saturation: 0.087, brightness: 1.0))
        
        
    
    }
        
}

struct AddTaskView_Previews: PreviewProvider {
    static var previews: some View {
        AddTaskView()
    }
}
