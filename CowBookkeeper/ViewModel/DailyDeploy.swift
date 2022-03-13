//
//  DailyDeploy.swift
//  CowBookkeeper
//
//  Created by Zuo.Kevin on 2022/3/13.
//

import Foundation

class DailyDeploy: ObservableObject {
    
    @Published private(set) var today: DailyModel = creatTestData()
    
    static func creatTestData() -> DailyModel {
        
        let debtPayRe1 = DailyModel.DailyOrder(symbol: "keyboard", bgColor: 0xf4a261, title: "还款", creatDate: Date(), amount: 500.0, type: .revenue)
        let debtPayRe2 = DailyModel.DailyOrder(symbol: "display.2", bgColor: 0xf72585, title: "还款", creatDate: Date(), amount: 100.0, type: .revenue)
        let debtPayRe3 = DailyModel.DailyOrder(symbol: "gift", bgColor: 0x3A86FF, title: "还款", creatDate: Date(), amount: 1000.0, type: .revenue)
        return DailyModel(dailyOrders: [debtPayRe1,debtPayRe2,debtPayRe3], expenses: 56.9, revenue: 23.0)
    }
    
    var dailyDatas: [DailyModel.DailyOrder] { today.dailyOrders }
    
    var dailyExpenses: Double { today.expenses }
    
    var dailyRevenue: Double { today.revenue }
    
    func delete(order: DailyModel.DailyOrder) {
        today.deleteDailyOrder(item: order)
    }
}
