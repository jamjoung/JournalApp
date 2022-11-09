//
//  HomeView.swift
//  DreamJournal
//
//  Created by CUBS Customer on 11/4/22.
//

import SwiftUI
import CoreData

struct HomePage: View {
    @Environment(\.managedObjectContext) private var viewContext
    
    @FetchRequest(entity: Note.entity(), sortDescriptors: [NSSortDescriptor(key: "noteTimestamp", ascending: false)]) private var allNotes: FetchedResults<Note>
    
    var body: some View {
        NavigationView {
            ZStack {
                VStack {
                    Divider()
                    Spacer()
                    List {
                        ForEach(allNotes) {
                            note in HStack {
                                Circle()
                                    .frame(width: 15, height: 15)
                                Spacer().frame(width: 20)
                                Text(note.noteTitle ?? "")
                                Spacer()
                                
                                   
                            }
                        }
                    }
                }
                
            }
        }
        
    }
}

struct HomePage_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            let persistentContainer = CoreDataHelper.shared.persistentContainer
            HomePage().environment(\.managedObjectContext, persistentContainer.viewContext)
        }
        
    }
}
