//
//  PlanDeploy.swift
//  CowBookkeeper
//
//  Created by Zuo.Kevin on 2022/3/8.
//

import Foundation
import SwiftUI

class PlanDeploy: ObservableObject {
    @Published private var plan: PlanModel = creatTestData()
    @Published private var planPay: PlanPayModel = creatTestSubData()
    
    static func creatTestData() -> PlanModel {
        
        let debt1 = PlanModel.PlanOrder(symbol: "iphone.homebutton", bgColor: 0x06d6a0, title: "带父母旅游", creatDate: Date(), totalAmount: 4500, currentAmount: 2450)
        let debt2 = PlanModel.PlanOrder(symbol: "figure.roll", bgColor: 0xf4a261, title: "买iPhone14", creatDate: Date(), totalAmount: 4500, currentAmount: 4500)
        let debt3 = PlanModel.PlanOrder(symbol: "bitcoinsign.circle", bgColor: 0xe76f51, title: "买房", creatDate: Date(), totalAmount: 1600, currentAmount: 200)
        return PlanModel(planLists: [debt1,debt2,debt3])
    }
    
    static func creatTestSubData() -> PlanPayModel {
        let debtPayRe1 = PlanPayModel.PlanPayRecord(symbol: "keyboard", bgColor: 0xf4a261, title: "还款", creatDate: Date(), amount: 500.0, type: .revenue)
        let debtPayRe2 = PlanPayModel.PlanPayRecord(symbol: "display.2", bgColor: 0xf72585, title: "还款", creatDate: Date(), amount: 100.0, type: .revenue)
        let debtPayRe3 = PlanPayModel.PlanPayRecord(symbol: "gift", bgColor: 0x3A86FF, title: "还款", creatDate: Date(), amount: 1000.0, type: .revenue)
        return PlanPayModel(planPayLists: [debtPayRe1,debtPayRe2,debtPayRe3], totalAmount: 3500.0, currentAmount: 250)
    }
    
    var planDatas: [PlanModel.PlanOrder] { plan.planLists }
    
    var planPayDatas: [PlanPayModel.PlanPayRecord] { planPay.planPayLists }
    
    /// 计划进度
    var progress: CGFloat { planPay.progress }
    
    var amount: Double { planPay.totalAmount }
    /// 删除plan
    func delete(order: PlanModel.PlanOrder) {
        plan.deleteDebtOrder(item: order)
    }
    
    /// 删除plan子账单
    func delete(order: PlanPayModel.PlanPayRecord) {
        planPay.delete(item: order)
    }
}
