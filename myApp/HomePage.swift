//
//  HomePage.swift
//  myApp
//
//  Created by Jamie Joung on 9/21/22.
//

import SwiftUI
import CoreData

struct HomePage: View {
    @Environment(\.managedObjectContext) private var viewContext
    
    @FetchRequest(sortDescriptors: [SortDescriptor(\.noteTitle)])
    var allNotes: FetchedResults<Note>
    
    var body: some View {
        NavigationView{
            VStack{
                List {
                    ForEach(allNotes) { note in
                        HStack {
                            Circle()
                                .frame(width: 15, height: 15)
                            Spacer().frame(width: 20)
                            Text(note.noteTitle ?? "")
                            Text("Hello, World!")
                            Spacer()
                        }
                    }
                }
            }
        }
    }
}

struct HomePage_Previews: PreviewProvider {
    static var previews: some View {
        let persistentContainer = CoreDataHelper.shared.persistentContainer
        HomePage().environment(\.managedObjectContext, persistentContainer.viewContext)
    }
}
