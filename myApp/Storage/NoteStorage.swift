//
//  NoteStorage.swift
//  myApp
//
//  Created by Jamie Joung on 9/28/22.
//

import Foundation
import CoreData


class NoteStorage{
    static let storage : NoteStorage = NoteStorage()
    
    private var noteIndexToIdDict : [Int:UUID] = [:]
    private var currentIndex : Int = 0
    
    private(set) var managedObjectContext : NSManagedObjectContext
    private var managedContextHasBeenSet : Bool = false
    
    private init() {
        // we need to initialize our ManagedObjectContext
        // This will be overwritten when setManagedContext is called from the view controller.
        managedObjectContext = NSManagedObjectContext(
            concurrencyType: NSManagedObjectContextConcurrencyType.mainQueueConcurrencyType)
    }
    
    func setManagedContext(managedObjectContext: NSManagedObjectContext) {
           self.managedObjectContext = managedObjectContext
           self.managedContextHasBeenSet = true
           let notes = CoreDataHelper.readNotesFromCoreData(fromManagedObjectContext: self.managedObjectContext)
           currentIndex = CoreDataHelper.count
           for (index, note) in notes.enumerated() {
               noteIndexToIdDict[index] = note.noteID
           }
       }
    
    
}
