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
        
        let debt1 = DebtModel.DebtOrder(symbol: "iphone.homebutton", bgColor: 0x06d6a0, title: "贷款买iPhone", creatDate: Date(), totalAmount: 4500, currentAmount: 2500)
        let debt2 = DebtModel.DebtOrder(symbol: "figure.roll", bgColor: 0xf4a261, title: "贷款买iPhone", creatDate: Date(), totalAmount: 4500, currentAmount: 4500)
        let debt3 = DebtModel.DebtOrder(symbol: "bitcoinsign.circle", bgColor: 0xe76f51, title: "贷款买iPhone", creatDate: Date(), totalAmount: 1600, currentAmount: 0)
        return DebtModel(debtLists: [debt1,debt2,debt3], totalAmout: 30000.0)
    }
    
    static func creatTestSubData() -> DebtPayModel {
        let debtPayRe1 = DebtPayModel.DebtPayRecord(symbol: "keyboard", bgColor: 0xf4a261, title: "还款", creatDate: Date(), amount: 500.0, type: .revenue)
        let debtPayRe2 = DebtPayModel.DebtPayRecord(symbol: "display.2", bgColor: 0xf72585, title: "还款", creatDate: Date(), amount: 100.0, type: .revenue)
        let debtPayRe3 = DebtPayModel.DebtPayRecord(symbol: "gift", bgColor: 0x3A86FF, title: "还款", creatDate: Date(), amount: 1000.0, type: .revenue)
        return DebtPayModel(debtPayLists: [debtPayRe1,debtPayRe2,debtPayRe3], totalAmount: 3500.0, currentAmount: 1600)
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
    
    var amount: Double { debtPay.totalAmount }
    
    /// 获取子还款账单
    var debtPayDatas: [DebtPayModel.DebtPayRecord] { debtPay.debtPayLists }
}
