//
//  CBDebtDetailView.swift
//  CowBookkeeper
//
//  Created by Zuo.Kevin on 2022/3/7.
//

import SwiftUI

struct CBDebtDetailView: View {
    @ObservedObject var viewModel: DebtDeploy = DebtDeploy()
    
    var body: some View {
        
        List {
            VStack(alignment: .center) {
                WaveView(color: .blue, isReverse: true, radius: 60, progress: viewModel.progress)
                Text("￥\(String(format: "%.1f", viewModel.amount))")
                    .font(.system(size: 40))
                    .bold()
            }
            .frame(width: ScreenW*0.9, height: 180)
            .listRowSeparator(.hidden)
            
            Text("偿还详情")
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.top,10)
                .font(.title.bold())
                .listRowSeparator(.hidden)
            
            ForEach(viewModel.debtPayDatas) { item in
                OrderCell(symbol: item.symbol,
                          bgColor: item.bgColor,
                          title: item.title,
                          date: "02/16/2022",
                          type: item.type,
                          amount: item.amount)
                    .swipeActions(edge: .trailing) {
                        Button(role: .destructive) {
                            print("删除")
                            viewModel.delete(order: item)
                        }label: {
                            Label("删除", systemImage: "trash")
                        }
                    }
                    .listRowSeparator(.hidden)
                    
            }
        }
        .navigationTitle("详情")
        .listStyle(.plain)
    }
}

struct CBDebtDetailView_Previews: PreviewProvider {
    static var previews: some View {
        CBDebtDetailView(viewModel: DebtDeploy())
    }
}
