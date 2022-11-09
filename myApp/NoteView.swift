//
//  ContentView.swift
//  DreamJournal
//
//  Created by CUBS Customer on 10/7/22.
//

import SwiftUI
import CoreData

struct NoteView: View {
    
    @State private var goToHome: Bool = false
    
    @State private var title: String = ""
    @State private var text: String = ""
    @Environment(\.managedObjectContext) private var viewContext
    
    @FetchRequest(entity: Note.entity(), sortDescriptors: [NSSortDescriptor(key: "noteTimestamp", ascending: false)]) private var allEntries: FetchedResults<Note>

       private func saveNote() {

           do {
               let note = Note(context: viewContext)
               note.noteTitle = title
               note.noteText = text
               note.noteTimestamp = Date()
               note.noteID = UUID()
               try viewContext.save()
           } catch {
               print(error.localizedDescription)
           }

       }
    
    var body: some View {
        NavigationView{
            ZStack {
                VStack(alignment: .center) {
                    TextField("Note Title", text: $title)
                        .textFieldStyle(.roundedBorder)

                    TextField("Write about your day!", text: $text, axis: .vertical)
                        .lineLimit(15, reservesSpace:true)
                        .textFieldStyle(.roundedBorder)
                    
                    NavigationLink(destination: HomePage(), isActive: $goToHome)
                    {
                        Button(action: {
                            saveNote()
                            goToHome = true
                        }){
                            Text("Save Note")
                        }
                        //                    Button("Save"){
                        ////                        saveDream()
                        //                    }
                    }
                    .padding(10)
                    .frame(maxWidth: .infinity)
                    .background(Color.indigo)
                    .foregroundColor(Color.white)
                    .clipShape(RoundedRectangle(cornerRadius:10, style:.continuous))
                    Spacer()
                }
            }
            
        }
    }
}

struct NoteView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            NoteView()
        }
    }
}


