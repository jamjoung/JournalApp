////
////  CoreDataHelper.swift
////  myApp
////
////  Created by Jamie Joung on 10/7/22.
////
//
//
//import Foundation
//import CoreData
//
//
//
//class CoreDataHelper {
//    
//    let persistentContainer: NSPersistentContainer
//    static let shared: CoreDataHelper = CoreDataHelper()
//    
//    private init() {
//        
//        persistentContainer = NSPersistentContainer(name: "JournalApp")
//        persistentContainer.loadPersistentStores { description, error in
//            if let error = error {
//                fatalError("Unable to initialize Core Data \(error)")
//            }
//        }
//    
//    }
//    
//}
