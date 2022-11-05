//
//  MainPage.swift
//  myApp
//
//  Created by Jamie Joung on 9/21/22.
//

import SwiftUI

struct MainPage: View {
    @State var showView = false
    var body: some View {
        NavigationView{
            VStack{
                Text("Welcome back, user!")
                    .font(.title)
                    .padding(EdgeInsets(top: 0, leading: 0, bottom: 40, trailing: 0))
                Text(Date().addingTimeInterval(600), style: .date)
                Circle()
                    .fill(.brown)
                    .frame(width: 200, height: 200)
                Text("How are you today?")
                
               
                
                
                Button(action: {
                    print("Button")},
                       label: {NavigationLink(destination: CreateNoteView()){Text("Happy")
                        .padding()
                        .background(Color.brown)
                        .foregroundColor(.white)
                    .font(.title)}})
                   
                
                    Text("Satisfied")
                        .padding()
                        .background(Color.brown)
                        .foregroundColor(.white)
                        .font(.title)
                
                Button(action: {
                    // What to perform
                }) {
                    Text("Neutral")
                        .padding()
                        .background(Color.brown)
                        .foregroundColor(.white)
                        .font(.title)
                }
                Button(action: {
                    // What to perform
                }) {
                    Text("Tired")
                        .padding()
                        .background(Color.brown)
                        .foregroundColor(.white)
                        .font(.title)
                }
                Button(action: {
                    // What to perform
                }) {
                    Text("Upset")
                        .padding()
                        .background(Color.brown)
                        .foregroundColor(.white)
                        .font(.title)
                }
            }
        }
    }
}

struct MainPage_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            MainPage()
        }
        
    }
}
