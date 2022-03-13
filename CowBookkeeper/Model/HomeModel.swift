//
//  HomeModel.swift
//  CowBookkeeper
//
//  Created by Zuo.Kevin on 2022/3/13.
//

import Foundation

struct HomeModel {
    var latestOrders: [DailyModel.DailyOrder]
    var debtModel: DebtModel
    var dailyModel: DailyModel
    var planModel: PlanModel
    
    private func filterIndex(_ item: DailyModel.DailyOrder) -> Int? {
        return latestOrders.firstIndex(where: { $0.id == item.id })
    }
    
    mutating func deleteDailyOrder(item: DailyModel.DailyOrder) {
        if let idx = filterIndex(item) {
            latestOrders.remove(at: idx)
        }
    }
}
