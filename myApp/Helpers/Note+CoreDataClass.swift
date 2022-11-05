//
//  Note+CoreDataClass.swift
//  myApp
//
//  Created by Jamie Joung on 11/4/22.
//

import Foundation
import CoreData

@objc(Note)
public class Note: NSManagedObject, Identifiable {
    @nonobjc public class func fetchRequest() -> NSFetchRequest<Note> {
        return NSFetchRequest<Note>(entityName: "Note")
    }
    
    @nonobjc class func fetchRequest(forID noteID: UUID) -> NSFetchRequest<Note> {
        let request = Note.fetchRequest()
        request.predicate = NSPredicate(format: "noteID = %@", noteID as CVarArg)
        return request
    }
    
    @NSManaged public var noteID: UUID
    @NSManaged public var noteTitle: String
    @NSManaged public var noteText: String
    @NSManaged public var noteTimestamp: Date
    
    
}
