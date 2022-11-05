//
//  ContentView.swift
//  myApp
//
//  Created by Jamie Joung on 9/12/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            
        }
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            ContentView()//.environment(\.managedObjectContext, persistentContainer.viewContext)
        }
    }
}
