//
//  DateHelper.swift
//  myApp
//
//  Created by Jamie Joung on 10/12/22.
//

import Foundation

class DateHelper {
    static func convertDate(date: Date) -> String {
        let formatter = DateFormatter()
        
        formatter.dateFormat = "yyyy-mm-dd hh:mm:ss"
        
        let dateString = formatter.string(from: date)
        let selectedDate = formatter.date(from: dateString)
        
        formatter.dateFormat = "EEEE, MMM d, yyyy, hh:mm:ss"
        
        let convertString = formatter.string(from: selectedDate!)
        return convertString
    }
}

extension Date {
    func toSeconds() -> Int64! {
        return Int64((self.timeIntervalSince1970).rounded())
    }
    
    init(seconds:Int64!) {
        self = Date(timeIntervalSince1970: TimeInterval(Double.init(seconds)))
    }
}
