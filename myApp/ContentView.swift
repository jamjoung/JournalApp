//
//  ContentView.swift
//  myApp
//
//  Created by Jamie Joung on 9/12/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
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
                // What to perform
            }) {
                Text("Happy")
                    .padding()
                    .background(Color.brown)
                    .foregroundColor(.white)
                    .font(.title)
            }
            Button(action: {
                // What to perform
            }) {
                Text("Satisfied")
                    .padding()
                    .background(Color.brown)
                    .foregroundColor(.white)
                    .font(.title)
            }
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

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
