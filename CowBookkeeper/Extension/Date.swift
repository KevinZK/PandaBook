//
//  Date.swift
//  CowBookkeeper
//
//  Created by Zuo.Kevin on 2022/3/13.
//

import Foundation

extension Date {
    func getAllDates() -> [Date] {
        let calendar = Calendar.current
        
        let startDate = calendar.date(from: Calendar.current.dateComponents([.year, .month], from: self))!
        
        let range = calendar.range(of: .day, in: .month, for: startDate)!
        
        return range.compactMap({ day -> Date in
            
            return calendar.date(byAdding: .day, value: day - 1 , to: startDate)!
        })
    }
    
    var isToday: Bool { Calendar.current.isDateInToday(self) }
    
    func formatDate(dateFormat: String = "YYYY年MM月dd日") -> String {
        dateFormatter.dateFormat = dateFormat
        return dateFormatter.string(from: self)
    }
}
