//
//  TasksView.swift
//  todoAppRealm
//
//  Created by Osman Esad on 7.11.2022.
//

import SwiftUI

struct TasksView: View {
    @EnvironmentObject var realmManager: RealmManager
    var body: some View {
        
        VStack{
            Text("Görevlerim")
                .font(.title3).bold()
                .padding()
                .frame(maxWidth: .infinity, alignment: .leading)
            
            List {
                ForEach(realmManager.tasks, id: \.id) {
                    task in
                    TaskRow(task: task.title, complated: task.completed)
                        .onTapGesture {
                            realmManager.updateTask(id: task.id, complated: !task.completed)
                        }
                }
                .listRowSeparator(.hidden)
            }
            .onAppear() {
                UITableView.appearance().backgroundColor = UIColor.clear
                UITableViewCell.appearance().backgroundColor = UIColor.clear
            }
            
            
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        //.background(Color(hue: 0.16, saturation: 0.087, brightness: 1.0))
    
        
        
    }
}

struct TasksView_Previews: PreviewProvider {
    static var previews: some View {
        TasksView()
            .environmentObject(RealmManager())
    }
}
