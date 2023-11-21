//
//  ContentView.swift
//  MagnifierApp
//
//  Created by Davide Galdiero on 21/11/23.
//

import SwiftUI

struct ContentView: View {
    //Zoom
    @State private var currentZoomFactor: CGFloat=0.5
    @State private var isEditing = false
    
    var body: some View {
        NavigationStack{
            //display live video
            HostedViewController()
                .overlay(alignment: .bottom) {
                    buttonsView()
                }
                .navigationTitle("Camera")
                .navigationBarTitleDisplayMode(.inline)
                .navigationBarHidden(true)
                .ignoresSafeArea()
                .statusBar(hidden: true)
        }
    }
    
    private func buttonsView() -> some View {
            ZStack{
                Rectangle()
                    .frame(width: 400, height: 300)
                    .cornerRadius(30)
                    .foregroundColor(.black.opacity(0.75))
                VStack{
                    //Zoom slider
                    ZStack {
                        Rectangle()
                            .frame(width: 355, height: 55)
                            .foregroundColor(Color(red: 0.12, green: 0.12, blue: 0.12))
                            .cornerRadius(30)
                        HStack{
                            Image(systemName: "plus.magnifyingglass")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 20, height: 20)
                                .foregroundColor(isEditing ? .yellow: .white)
                            
                            Image(systemName: "minus")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 20, height: 20)
                                .foregroundColor(.white)
                            
                            Slider(value: $currentZoomFactor, in: 0.5...10) { editing in
                                isEditing=editing
                            }
                            .frame(width: 250)
                            .accentColor(.gray)
                            
                            Image(systemName: "plus")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 20, height: 20)
                                .foregroundColor(.white)
                        }
                        
                    }
                    .padding(.top)
                    
                    HStack{
                        ButtonView(iconName: "arrow.triangle.2.circlepath.camera")
                            .padding(.leading)
                        ButtonView(iconName: "sun.min")
                            .padding()
                        ButtonView(iconName: "camera.filters")
                            .padding()
                        ButtonView(iconName: "flashlight.off.fill")
                            .padding()
                        ButtonView(iconName: "viewfinder")
                            .padding(.trailing)
                    }
                    .padding(.bottom)
                    
                    
                    HStack(spacing: 89) {
                        
                        ButtonView(iconName: "gear")
                            .padding(.leading)
                        
                        Button(action: {}, label: {
                            ZStack {
                                Circle()
                                    .strokeBorder(.white, lineWidth: 4)
                                    .frame(width: 70, height: 70)
                                Circle()
                                    .strokeBorder(.white, lineWidth: 4)
                                    .frame(width: 25, height: 25)
                            }
                        })
                        .padding(.leading)
                        .offset(x: -10)
                        
                        ButtonView(iconName: "rectangle.on.rectangle")
                            .padding(.trailing)
                        
                    }
                    .buttonStyle(.plain)
                    .labelStyle(.iconOnly)
                    .padding(.top)
                    .offset(y:-40)
            }
        }
    }
}
