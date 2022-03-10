//
//  PlanModel.swift
//  CowBookkeeper
//
//  Created by Zuo.Kevin on 2022/3/8.
//

import Foundation
import SwiftUI

struct PlanModel {
    var planLists: [PlanOrder]
    
    private func filterIndex(_ item: PlanOrder) -> Int? {
        return planLists.firstIndex(where: { $0.id == item.id })
    }
    
    mutating func deleteDebtOrder(item: PlanOrder) {
        if let idx = filterIndex(item) {
            planLists.remove(at: idx)
        }
    }
    
    
    struct PlanOrder: Identifiable {
        var id: UUID = UUID()
        var symbol: String
        var bgColor: Int
        var title: String
        var creatDate: Date
        var totalAmount: Double
        var currentAmount: Double
        
        var progress: CGFloat {
            return currentAmount >= totalAmount ? 1.0 : currentAmount / totalAmount
        }
    }
    
    
}

struct PlanPayModel {
    var planPayLists: [PlanPayRecord]
    var totalAmount: Double
    var currentAmount: Double
    var progress: CGFloat {
        return currentAmount >= totalAmount ? 1.0 : currentAmount / totalAmount
    }
    
    
    private func filterIndex(_ item: PlanPayRecord) -> Int? {
        return planPayLists.firstIndex(where: { $0.id == item.id })
    }
    
    mutating func delete(item: PlanPayRecord) {
        if let idx = filterIndex(item) {
            planPayLists.remove(at: idx)
        }
    }
    
    struct PlanPayRecord: Identifiable {
        var id: UUID = UUID()
        var symbol: String
        var bgColor: Int
        var title: String
        var creatDate: Date
        var amount: Double
        var type: RecordsType
    }
}
