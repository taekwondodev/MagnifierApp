//
//  ButtonView.swift
//  MagnifierApp
//
//  Created by Davide Galdiero on 21/11/23.
//

import SwiftUI

struct ButtonView: View {
    let iconName: String
    
    var body: some View {
        ZStack{
            Rectangle()
                .frame(width: 45, height: 45)
                .foregroundColor(Color(red: 0.12, green: 0.12, blue: 0.12))
                .cornerRadius(30)
            Image(systemName: iconName)
                .resizable()
                .scaledToFit()
                .frame(width: 20, height: 20)
                .foregroundColor(.white)
        }
    }
}

#Preview {
    ButtonView(iconName: "arrow.triangle.2.circlepath.camera")
}
