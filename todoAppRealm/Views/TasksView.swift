//
//  TasksView.swift
//  todoAppRealm
//
//  Created by Osman Esad on 7.11.2022.
//

import SwiftUI
import RealmSwift

struct TasksView: View {
    @EnvironmentObject var realmManager: RealmManager
    
    var body: some View {
        
        VStack{
            Text("Görevlerim")
                .font(.title3).bold()
                .padding()
                .frame(maxWidth: .infinity, alignment: .leading)
            
            List {
                ForEach(realmManager.tasks, id: \.id) { task in
                    if !task.isInvalidated {
                        TaskRow(task: task.title, complated: task.completed)
                            .onTapGesture {
                                realmManager.updateTask(id: task.id, complated: !task.completed)
                            }
                            .swipeActions(edge: .trailing) {
                                Button(role: .destructive) {
                                    realmManager.deleteTask(id: task.id)
                                } label: {
                                    Label("Sil", systemImage: "trash")
                                }
                            }
                        
                    }
                    
                    
                }
                .listRowSeparator(.hidden)
            }
            .onAppear() {
                UITableView.appearance().backgroundColor = UIColor.clear
                UITableViewCell.appearance().backgroundColor = UIColor.clear
            }
            Spacer()
            
        }
        
        //.background(Color(hue: 0.16, saturation: 0.087, brightness: 1.0))
        
        
        
    }
}

struct TasksView_Previews: PreviewProvider {
    static var previews: some View {
        TasksView()
            .environmentObject(RealmManager())
    }
}
