//
//  AppDeploy.swift
//  CowBookkeeper
//
//  Created by Zuo.Kevin on 2022/2/24.
//

import Foundation
import SwiftUI

protocol AppTheme {
    var title: String { get }
    var bgColor: Color { get }
    var symbols: String { get }
    var subheadline: String { get }
    
}

enum FontFamily: String {
    case HN  = "Helvetica Neue"
    case MS  = "Montserrat"
    case SFT = "San Francisco Text"
}

enum AppModuleType {
    case today
    case debt
    case plan
    case record
}

extension AppModuleType: AppTheme {
    
    var title: String {
        switch self {
        case .debt: return "负债"
        case .plan: return "计划"
        case .record: return "记录"
        case .today: return "今天"
        
        }
    }
    
    var bgColor: Color {
        switch self {
        case .today:
            return .todayThemeColor
        case .debt:
            return .debtThemeColor
        case .plan:
            return .planThemeColor
        case .record:
            return .todayThemeColor
        
        }
    }
    
    var symbols: String {
        switch self {
        case .today:
            return "alarm"
        case .debt:
            return "creditcard.trianglebadge.exclamationmark"
        case .plan:
            return "list.bullet"
        case .record:
            return "infinity"
        }
    }
    
    var subheadline: String {
        switch self {
        case .today:
            return dateFormatter.string(from: Date())
        case .debt:
            return "Debt"
        case .plan:
            return "Plan"
        case .record:
            return ""
        }
    }
    
}

var dateFormatter: DateFormatter {
    let formatter = DateFormatter()
    formatter.dateFormat = "YYYY/MM/dd"
    return formatter
}

protocol RecordValue {
    var navTitle: String { get }
}

extension AppModuleType: RecordValue {
    var navTitle: String {
        switch self {
        case .today:
            return ""
        case .debt:
            return "记负债"
        case .plan:
            return "定计划"
        case .record:
            return "记一笔"
        }
    }
}
