//
//  ContentView.swift
//  myApp
//
//  Created by Jamie Joung on 9/12/22.
//

import SwiftUI

struct ContentView: View {
    @State var showView = false
    var body: some View {
        NavigationView {
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
                    print("*** Login in progress... ***")
                    DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                        self.showView = true
                    }
                }) {
                    Text("Happy")
                        .padding()
                        .background(Color.brown)
                        .foregroundColor(.white)
                        .font(.title)
                    NavigationLink(destination: PushedView(), isActive: $showView) {EmptyView()}
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
}

struct PushedView: View {
    @State private var noteText: String = ""
    @State private var noteTitle: String = ""

    
    @State private var date = Date() // <1>
        
        static var df: DateFormatter { // <2>
            let df = DateFormatter()
            df.dateStyle = .short
            return df
        }
    
    var body: some View {
        TextField(
                        "Date",
                        value: $date, // <3>
                        formatter: PushedView.df, // <4>
                        onEditingChanged: { _ in
                            
                        }, onCommit: {
                            
                        })
        
        TextField("Note Title", text: $noteTitle)
            .textFieldStyle(.roundedBorder)
        
        
        TextField("Write about your day!", text: $noteText)
            .textFieldStyle(.roundedBorder)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
