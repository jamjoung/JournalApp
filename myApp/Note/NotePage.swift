//
//  Note.swift
//  myApp
//
//  Created by Jamie Joung on 9/26/22.
//

import Foundation

class NotePage{
    private(set) var noteID        : UUID
    private(set) var noteTitle     : String
    private(set) var noteText      : String
    private(set) var noteTimestamp : Int64
    
    init(noteTitle:String, noteText:String, noteTimestamp:Int64) {
            self.noteID        = UUID()
            self.noteTitle     = noteTitle
            self.noteText      = noteText
            self.noteTimestamp = noteTimestamp
        }

        init(noteID: UUID, noteTitle:String, noteText:String, noteTimestamp:Int64) {
            self.noteID        = noteID
            self.noteTitle     = noteTitle
            self.noteText      = noteText
            self.noteTimestamp = noteTimestamp
        }
}
