//
//  DebtDeploy.swift
//  CowBookkeeper
//
//  Created by Zuo.Kevin on 2022/3/7.
//

import Foundation
import SwiftUI

class DebtDeploy: ObservableObject {
    
    @Published private var debt: DebtModel = creatTestData()
    @Published private var debtPay: DebtPayModel = creatTestSubData()
    
    static func creatTestData() -> DebtModel {
        
        let debt1 = DebtModel.DebtOrder(symbol: "iphone.homebutton", bgColor: 0x06d6a0, title: "贷款买iPhone", creatDate: Date(), amount: 4500, progress: 0.5)
        let debt2 = DebtModel.DebtOrder(symbol: "figure.roll", bgColor: 0xf4a261, title: "贷款买iPhone", creatDate: Date(), amount: 4500, progress: 0.0)
        let debt3 = DebtModel.DebtOrder(symbol: "bitcoinsign.circle", bgColor: 0xe76f51, title: "贷款买iPhone", creatDate: Date(), amount: 1600, progress: 1)
        return DebtModel(debtLists: [debt1,debt2,debt3], totalAmout: 30000.0)
    }
    
    static func creatTestSubData() -> DebtPayModel {
        let debtPayRe1 = DebtPayModel.DebtPayRecord(symbol: "keyboard", bgColor: 0xf4a261, title: "还款", creatDate: Date(), amount: 500.0, type: .revenue)
        let debtPayRe2 = DebtPayModel.DebtPayRecord(symbol: "display.2", bgColor: 0xf72585, title: "还款", creatDate: Date(), amount: 100.0, type: .revenue)
        let debtPayRe3 = DebtPayModel.DebtPayRecord(symbol: "gift", bgColor: 0x3A86FF, title: "还款", creatDate: Date(), amount: 1000.0, type: .revenue)
        return DebtPayModel(debtPayLists: [debtPayRe1,debtPayRe2,debtPayRe3], amount: 3500.0, progress: 0.7)
    }
    
    var debtDatas: [DebtModel.DebtOrder] { debt.debtLists }
    
    var totalAmout: Double { debt.totalAmout }
    
    /// 删除负债账单
    func delete(order: DebtModel.DebtOrder) {
        debt.deleteDebtOrder(item: order)
    }
    
    /// 删除子账单
    func delete(order: DebtPayModel.DebtPayRecord) {
        debtPay.delete(item: order)
    }
    /// 负债：还款进度
    var progress: CGFloat { debtPay.progress }
    
    var amount: Double { debtPay.amount }
    
    /// 获取子还款账单
    var debtPayDatas: [DebtPayModel.DebtPayRecord] { debtPay.debtPayLists }
}
