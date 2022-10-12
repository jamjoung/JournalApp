//
//  CoreDataHelper.swift
//  myApp
//
//  Created by Jamie Joung on 10/7/22.
//

import Foundation
import CoreData

class CoreDataHelper {
    
    private(set) static var count: Int = 0
    
    //create note in core data
    static func createNoteInCoreData(
        createNote: NotePage,
        intoManagedObjectContext: NSManagedObjectContext) { //NSManagedObjectContext = object space to manipulate and track changes to managed objects (notes)
            //create entity and new note record
            //entity = made up from objects, defined in managed object model. NSEntityDescription map entries in core data
            let noteEntity = NSEntityDescription.entity(
                forEntityName: "Note",
                in: intoManagedObjectContext)!
            
            let newNoteCreated = NSManagedObject(
                entity: noteEntity,
                insertInto: intoManagedObjectContext)
            
            //set values of note with id, title, text, and timestamp
            newNoteCreated.setValue(
                createNote.noteID, //set new note with id
                forKey: "noteID"
            )
            newNoteCreated.setValue(
                createNote.noteTitle,
                forKey: "noteTitle"
            )
            newNoteCreated.setValue(
                createNote.noteText,
                forKey: "noteText"
            )
            newNoteCreated.setValue(
                createNote.noteTimestamp,
                forKey: "noteTimestamp"
            )
            
            do {
                try intoManagedObjectContext.save()
                count+=1
            }
            catch let error as NSError {
                print("Note could not be saved. \(error), \(error.userInfo)")
            }
        }
    
    static func changeNote(
        changeNote: NotePage,
        inManagedObjectContext: NSManagedObjectContext) {
            let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Note")
            
            //NSPredicate: definition of logical conditions for constraining a fetch, filter collection of objects, find note to change
            let noteIDPredicate = NSPredicate(format: "noteID = %@", changeNote.noteID as any CVarArg)
            //CVarArg- type of instance that can be encoded, appropriately passed
            fetchRequest.predicate = noteIDPredicate //find note based on noteID
            
            do {
                let fetchedNotes = try inManagedObjectContext.fetch(fetchRequest)
                let changeNoteFromManagedObject = fetchedNotes[0] as! NSManagedObject
                
                changeNoteFromManagedObject.setValue(
                    changeNote.noteTitle,
                    forKey: "noteTitle"
                )
                changeNoteFromManagedObject.setValue(
                    changeNote.noteText,
                    forKey: "noteText"
                )
                changeNoteFromManagedObject.setValue(
                    changeNote.noteTimestamp,
                    forKey: "noteTimestamp"
                )
                
                try inManagedObjectContext.save()
            }
            catch let error as NSError {
                print("Could not edit note. \(error), \(error.userInfo)")
            }
        }
    
    static func readNotesFromCoreData(fromManagedObjectContext: NSManagedObjectContext) -> [NotePage] {
        
        var returnedNotes = [NotePage]()
        
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Note")
        fetchRequest.predicate = nil
        
        do {
            let fetchedNotes = try fromManagedObjectContext.fetch(fetchRequest)
            fetchedNotes.forEach { (fetchRequestResult) in
                let readNoteManagedObject = fetchRequestResult as! NSManagedObjectContext
                returnedNotes.append(NotePage.init(
                    noteID: readNoteManagedObject.value(forKey: "noteID") as! UUID,
                    noteTitle: readNoteManagedObject.value(forKey: "noteTitle") as! String,
                    noteText: readNoteManagedObject.value(forKey:"noteText") as! String,
                    noteTimestamp: readNoteManagedObject.value(forKey: "noteTimestamep") as! Int64))
            }
        }
        catch let error as NSError {
            print("Could not read note. \(error), \(error.userInfo)")
        }
        
        //set note count
        self.count = returnedNotes.count
        return returnedNotes
    }
    
    static func readNote(noteIDToBeRead: UUID, fromManagedObjectContext:NSManagedObjectContext) -> NotePage? {
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName:"Note")
        let noteIDPredicate = NSPredicate(format: "noteID = %@", noteIDToBeRead as CVarArg)
        
        fetchRequest.predicate = noteIDPredicate
        
        do {
            let fetchedNotes = try fromManagedObjectContext.fetch(fetchRequest)
            let noteManagedObjectToRead = fetchedNotes[0] as! NSManagedObject
            return NotePage.init(
                noteID: noteManagedObjectToRead.value(forKey: "noteID") as! UUID,
                noteTitle: noteManagedObjectToRead.value(forKey: "noteTitle") as! String,
                noteText: noteManagedObjectToRead.value(forKey: "noteText") as! String,
                noteTimestamp: noteManagedObjectToRead.value(forKey:"noteTimestamp") as! Int64)
        }
        catch let error as NSError {
            print("Could not read. \(error), \(error.userInfo)")
            return nil
        }
        
    }
    
    static func deleteNote(
        deletedNoteID: UUID,
        fromManagedObjectContext: NSManagedObjectContext
    ) {
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Note")
        
        let noteIDAsCVarArg: CVarArg = deletedNoteID as CVarArg
        let noteIDPredicate = NSPredicate(format: "noteID == %@", noteIDAsCVarArg)
        
        fetchRequest.predicate = noteIDPredicate
        
        do {
            let fetchedNotes = try fromManagedObjectContext.fetch(fetchRequest)
            let noteManagedObjectToDelete = fetchedNotes[0] as! NSManagedObject
            fromManagedObjectContext.delete(noteManagedObjectToDelete)
            
            do {
                try fromManagedObjectContext.save()
                self.count = self.count - 1
            }
            catch let error as NSError {
                print("Could not save note. \(error), \(error.userInfo)")
            }
            
        }
        catch let error as NSError {
            print("Could not delete note. \(error), \(error.userInfo)")
        }
    }
    
    
}
