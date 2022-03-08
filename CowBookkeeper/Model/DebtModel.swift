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
        var amount: Double
        var progress: CGFloat
    }
    
    
}

struct DebtPayModel {
    var debtPayLists: [DebtPayRecord]
    var amount: Double
    var progress: CGFloat
    
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
