//
//  DebtModel.swift
//  CowBookkeeper
//
//  Created by Zuo.Kevin on 2022/3/7.
//

import Foundation
import SwiftUI

struct DebtModel {
    var debtLists: [DebtOrder]
    var totalAmout: Double
    
    private func filterIndex(_ item: DebtOrder) -> Int? {
        return debtLists.firstIndex(where: { $0.id == item.id })
    }
    
    mutating func deleteDebtOrder(item: DebtOrder) {
        if let idx = filterIndex(item) {
            debtLists.remove(at: idx)
        }
    }
    
    
    struct DebtOrder: Identifiable {
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

struct DebtPayModel {
    var debtPayLists: [DebtPayRecord]
    var totalAmount: Double
    var currentAmount: Double
    var progress: CGFloat{
        return currentAmount >= totalAmount ? 1.0 : currentAmount / totalAmount
    }
    
    private func filterIndex(_ item: DebtPayRecord) -> Int? {
        return debtPayLists.firstIndex(where: { $0.id == item.id })
    }
    
    mutating func delete(item: DebtPayRecord) {
        if let idx = filterIndex(item) {
            debtPayLists.remove(at: idx)
        }
    }
    
    struct DebtPayRecord: Identifiable {
        var id: UUID = UUID()
        var symbol: String
        var bgColor: Int
        var title: String
        var creatDate: Date
        var amount: Double
        var type: RecordsType
    }
}
