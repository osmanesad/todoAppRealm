//
//  SmallAddButton.swift
//  todoAppRealm
//
//  Created by Osman Esad on 9.11.2022.
//

import SwiftUI

struct SmallAddButton: View {
    var body: some View {
        ZStack{
            Circle()
                .frame(width: 60)
                .foregroundColor(Color(red: 0.10196078431372549, green: 0.5372549019607843, blue: 0.09019607843137255))
                .cornerRadius(26)
            Image(systemName: "plus")
                .foregroundColor(.white)
                .bold()
        }
        .frame(height: 60)
    }
}

struct SmallAddButton_Previews: PreviewProvider {
    static var previews: some View {
        SmallAddButton()
    }
}
