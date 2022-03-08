//
//  CBDebtDetailView.swift
//  CowBookkeeper
//
//  Created by Zuo.Kevin on 2022/3/7.
//

import SwiftUI

struct CBDebtDetailView: View {
    var viewModel: DebtDeploy = DebtDeploy()
    
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
                .font(.system(size: 26, weight: .medium))
                .listRowSeparator(.hidden)
            
            ForEach(viewModel.debtPayDatas) { item in
                PayOrderCell(model: item)
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

struct PayOrderCell: View {
    
    var model: DebtPayModel.DebtPayRecord
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
                HStack {
                    Image(systemName: model.type.rawValue)
                        .foregroundColor(model.type.color)
                    Text("\(String(format: "%.1f", model.amount))￥")
                        .foregroundColor(model.type.color)
                }
                
                
                
                
            }
            .padding(.top)
            .padding(.bottom)
            Divider().padding(.leading).padding(.trailing)
        }
    }
}
