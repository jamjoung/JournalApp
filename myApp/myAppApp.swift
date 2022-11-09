//
//  myAppApp.swift
//  myApp
//
//  Created by Jamie Joung on 9/12/22.
//
import SwiftUI
import CoreData

@main
struct JournalApp: App {
    
    let persistentContainer = CoreDataHelper.shared.persistentContainer
    var body: some Scene {
        WindowGroup {
            NavigationView{
                NoteView().environment(\.managedObjectContext, persistentContainer.viewContext)
            }
            
        }
    }
}
