//
//  ContentView.swift
//  todoAppRealm
//
//  Created by Osman Esad on 7.11.2022.
//

import SwiftUI

struct ContentView: View {
    @StateObject var realManager = RealmManager()
    @State private var showAddTaskView = false
    
    
    var body: some View {
        ZStack(alignment: .bottomTrailing){
            TasksView()
                .environmentObject(realManager)
            SmallAddButton()
                .padding()
                .onTapGesture {
                    showAddTaskView.toggle()
                }
        }
        .sheet(isPresented: $showAddTaskView){
            AddTaskView()
                .environmentObject(realManager)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottom)
        //.background(Color(hue: 0.16, saturation: 0.087, brightness: 1.0))
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
