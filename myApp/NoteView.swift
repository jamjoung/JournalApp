//
//  NoteView.swift
//  myApp
//
//  Created by Jamie Joung on 11/2/22.
//

import Foundation
import SwiftUI
import CoreData


struct CreateNoteView: View {
    @State var showView = false
    @State private var noteText: String = ""
    @State private var noteTitle: String = ""
    @Environment(\.managedObjectContext) private var viewContext
    
    @FetchRequest(sortDescriptors: [SortDescriptor(\.noteTitle)])
    var allNotes: FetchedResults<Note>
    
//    @FetchRequest(entity: Note.entity(), sortDescriptors: [NSSortDescriptor(key: "noteTimestamp", ascending: false)]) private var allNotes: FetchedResults<Note>
    @State private var date = Date() // <1>
    
    static var df: DateFormatter { // <2>
        let df = DateFormatter()
        df.dateStyle = .short
        return df
    }
    
    
    private func saveNote() {
        
        do {
            let note = Note(context: viewContext)
            //note.noteID =
            note.noteTitle = noteTitle
            note.noteText = noteText
            note.noteTimestamp = Date()
            try PersistenceController.shared.saveContext()
        }
        catch {
            print(error.localizedDescription)
        }
        
    }
    
    var body: some View {
        NavigationView{
            VStack{
                TextField(
                    "Date",
                    value: $date, // <3>
                    formatter: CreateNoteView.df, // <4>
                    onEditingChanged: { _ in
                    }, onCommit: {
                    })
                
                TextField("Note Title", text: $noteTitle)
                    .textFieldStyle(.roundedBorder)
                
                
                TextField("Write about your day!", text: $noteText)
                    .textFieldStyle(.roundedBorder)
                
                Button(action: {
                    saveNote()},
                       label: {NavigationLink(destination: HomePage()){Text("Save")
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                    .font(.title)}})
                    
                .padding(10)
                .frame(maxWidth: .infinity)
                .background(Color.blue)
                .foregroundColor(.white)
                .clipShape(RoundedRectangle(cornerRadius: 10.0, style: .continuous))
            }
        }
    }
}

struct CreateNoteView_Previews: PreviewProvider {
    static var previews: some View {
        CreateNoteView()
    }
}
