//
//  AssetsRecordsModel.swift
//  CowBookkeeper
//
//  Created by Zuo.Kevin on 2022/2/16.
//

import Foundation
import SwiftUI

enum CurrencySymbolsType: String {
    case RMB = "￥"
    case USD = "$"
}

enum RecordsType: String {
    case revenue = "plus.circle"
    case expenses = "minus.circle"
    
    var color: Color {
        switch self {
        case.revenue:
            return Color(hex: 0xee6055)
        case.expenses:
            return Color(hex: 0xaaf683)
        }
    }
}



struct AssetsRecords {
    
    var id: Int64
    
    var title: String
    
    var icon: String
    
    var currency: CurrencySymbolsType = .RMB
    
    var date: Date
    
    var recordsType: RecordsType = .revenue
    
}

