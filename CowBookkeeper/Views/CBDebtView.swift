//
//  CBDebtView.swift
//  CowBookkeeper
//
//  Created by Zuo.Kevin on 2022/2/28.
//

import SwiftUI
import SwiftUICharts


struct CBDebtView: View {
    
    @ObservedObject var viewModel: DebtDeploy = DebtDeploy()
    
    var body: some View {
        
        List {
            VStack {
                Text("￥\(String(format: "%.1f", viewModel.totalAmout))")
                    .font(.system(size: 50))
                    .bold()
                    .padding(.trailing, 40)
                    .foregroundColor(.white)
                Text("总" + AppModuleType.debt.title)
                    .foregroundColor(.white)
            }
            .frame(width: ScreenW*0.9, height: 120)
            .background(Color(hex: 0x073B4C))
            .cornerRadius(20)
            .listRowSeparator(.hidden)
            
            Text("负债清单")
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.top,10)
                .font(.system(size: 26, weight: .medium))
                .listRowSeparator(.hidden)
            
            ForEach(viewModel.debtDatas) { item in
                ProgressCell(symbol: item.symbol,
                             bgColor: item.bgColor,
                             title: item.title,
                             date: "02/16/2022",
                             totalAmount: item.totalAmount,
                             currentAmount: item.currentAmount,
                             progress: item.progress)
                    .swipeActions(edge: .trailing, allowsFullSwipe: false) {
                        Button(role: .destructive) {
                            print("delete")
                            viewModel.delete(order: item)
                        } label: {
                            Label("删除", systemImage: "trash")
                        }
                    }
                    .listRowSeparator(.hidden)
                    .background(NavigationLink("", destination: CBDebtDetailView()).opacity(0))
            }
        }
        .listStyle(.plain)
        .navigationTitle(AppModuleType.debt.title)
        
    }
    
}

struct CBDebtView_Previews: PreviewProvider {
    static var previews: some View {
        CBDebtView()
    }
}


