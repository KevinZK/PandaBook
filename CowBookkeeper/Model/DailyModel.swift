//
//  DailyModel.swift
//  CowBookkeeper
//
//  Created by Zuo.Kevin on 2022/3/13.
//

import Foundation

struct DailyModel {
    
    var dailyOrders: [DailyOrder]
    var expenses: Double
    var revenue: Double
    private func filterIndex(_ item: DailyOrder) -> Int? {
        return dailyOrders.firstIndex(where: { $0.id == item.id })
    }
    
    mutating func deleteDailyOrder(item: DailyOrder) {
        if let idx = filterIndex(item) {
            dailyOrders.remove(at: idx)
        }
    }
    
    struct DailyOrder: Identifiable {
        var id: UUID = UUID()
        var symbol: String
        var bgColor: Int
        var title: String
        var creatDate: Date
        var amount: Double
        var type: RecordsType
    }
}
