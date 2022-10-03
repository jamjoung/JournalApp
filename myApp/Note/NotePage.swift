//
//  Note.swift
//  myApp
//
//  Created by Jamie Joung on 9/26/22.
//

import Foundation

class NotePage{
    private(set) var noteId        : UUID
    private(set) var noteTitle     : String
    private(set) var noteText      : String
    private(set) var noteTimestamp : Int64
    
    init(noteTitle:String, noteText:String, noteTimestamp:Int64) {
            self.noteId        = UUID()
            self.noteTitle     = noteTitle
            self.noteText      = noteText
            self.noteTimestamp = noteTimestamp
        }

        init(noteId: UUID, noteTitle:String, noteText:String, noteTimestamp:Int64) {
            self.noteId        = noteId
            self.noteTitle     = noteTitle
            self.noteText      = noteText
            self.noteTimestamp = noteTimestamp
        }
}
