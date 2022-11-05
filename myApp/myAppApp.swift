//
//  myAppApp.swift
//  myApp
//
//  Created by Jamie Joung on 9/12/22.
//
import SwiftUI

@main
struct JournalApp: App {
    
    let persistenceController = PersistenceController.shared
    var body: some Scene {
        WindowGroup {
            NavigationView{
                MainPage().environment(\.managedObjectContext, persistenceController.container.viewContext)
            }
            
        }
    }
}
