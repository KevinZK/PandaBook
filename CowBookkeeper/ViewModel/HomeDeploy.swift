//
//  HomeDeploy.swift
//  CowBookkeeper
//
//  Created by Zuo.Kevin on 2022/3/13.
//

import Foundation

class HomeDeploy: ObservableObject {
    @Published private(set) var home: HomeModel = creatTestData()
    
    static func creatTestData() -> HomeModel {
        let debtPayRe1 = DailyModel.DailyOrder(symbol: "keyboard", bgColor: 0xf4a261, title: "还款", creatDate: Date(), amount: 500.0, type: .revenue)
        let debtPayRe2 = DailyModel.DailyOrder(symbol: "display.2", bgColor: 0xf72585, title: "还款", creatDate: Date(), amount: 100.0, type: .revenue)
        let debtPayRe3 = DailyModel.DailyOrder(symbol: "gift", bgColor: 0x3A86FF, title: "还款", creatDate: Date(), amount: 1000.0, type: .revenue)
        let dailyData = DailyModel(dailyOrders: [], expenses: 58.9, revenue: 34.3)
        let debtData  = DebtModel(debtLists: [], totalAmout: 17000)
        let plan2 = PlanModel.PlanOrder(symbol: "iphone.homebutton", bgColor: 0x06d6a0, title: "带父母旅游", creatDate: Date(), totalAmount: 450700, currentAmount: 2450)
        let planData  = PlanModel(planLists: [plan2])
        
        return HomeModel(latestOrders: [debtPayRe1,debtPayRe2,debtPayRe3], debtModel: debtData, dailyModel: dailyData, planModel: planData)
    }
    
    var latestDatas: [DailyModel.DailyOrder] { home.latestOrders }
    
    var dailyData: DailyModel { home.dailyModel }
    
    var debtData: DebtModel { home.debtModel }
    
    var planTopData: PlanModel.PlanOrder { home.planModel.planLists.first! }
    
    
    
    func delete(order: DailyModel.DailyOrder) {
        home.deleteDailyOrder(item: order)
    }
}
