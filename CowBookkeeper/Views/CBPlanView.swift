//
//  CBPlanView.swift
//  CowBookkeeper
//
//  Created by Zuo.Kevin on 2022/2/28.
//

import SwiftUI
import SwiftUICharts

struct CBPlanView: View {
    @ObservedObject var viewModel: PlanDeploy = PlanDeploy()
    
    var body: some View {
        
        List{
            ForEach(viewModel.planDatas) { item in
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
                    .background(NavigationLink("", destination: CBPlanDetailView()).opacity(0))
            }
        }
        .listStyle(.plain)
        .navigationTitle("计划清单")
        
    }
}

struct CBPlanView_Previews: PreviewProvider {
    static var previews: some View {
        CBPlanView()
    }
}

