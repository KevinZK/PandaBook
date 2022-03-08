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
                DebtCell(model: item)
                    .swipeActions(edge: .trailing, allowsFullSwipe: false) {
                        Button(role: .destructive) {
                            print("delete")
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


struct DebtCell: View {
    
    var model: DebtModel.DebtOrder
    var body: some View {
        
        VStack {
            HStack {
                Image(systemName: model.symbol)
                    .frame(width: 24)
                    .font(.system(size: 18))
                    .padding(10)
                    .foregroundColor(.white)
                    .background(Color(hex: model.bgColor))
                    .clipShape(Circle())
                    .overlay {
                        Circle().stroke(.white, lineWidth: 1)
                    }
                    .shadow(radius: 3)
                
                VStack(alignment: .leading) {
                    Text(model.title)
                        .font(.title2)
                    Text("02/16/2022")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                }
                Spacer()
                Text("\(String(format: "%.1f", model.amount))￥")
                Image(systemName: "chevron.right")
                    .foregroundColor(.gray)
                
            }
            .padding(.top)
            .padding(.bottom)
            Divider().padding(.leading).padding(.trailing)
        }
    }
}


