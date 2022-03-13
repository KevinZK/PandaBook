//
//  CBTodayView.swift
//  CowBookkeeper
//
//  Created by Zuo.Kevin on 2022/2/28.
//

import SwiftUI
import SwiftUICharts

struct CBTodayView: View {
    
    @State var selectedDate: Date = Date()
    
    @ObservedObject var viewModel: DailyDeploy = DailyDeploy()
    
    var body: some View {
        List {
            CustomDatePicker(calendarType: .extendable, outputDate: $selectedDate)
                .padding(.horizontal, -15)
                .onChange(of: selectedDate) { newValue in
                    print(newValue.formatDate())
                }
                .listRowSeparator(.hidden)
            ChartCellView(data: [viewModel.dailyRevenue,
                                 viewModel.dailyExpenses],
                          expenses: viewModel.dailyExpenses,
                          revenue: viewModel.dailyRevenue)
                .listRowSeparator(.hidden)
            
            Text("账单详情")
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.top,10)
                .font(.title.bold())
                .listRowSeparator(.hidden)
            
            ForEach(viewModel.dailyDatas) { item in
                OrderCell(symbol: item.symbol, bgColor: item.bgColor, title: item.title, date: "02/16/2022", type: item.type, amount: item.amount)
                    .swipeActions(edge: .trailing, allowsFullSwipe: false) {
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
        .listStyle(.plain)
        .navigationTitle("每日账单")
        
    }
}

struct CBTodayView_Previews: PreviewProvider {
    static var previews: some View {
        CBTodayView()
    }
}

struct ChartCellView: View {
    var data: [Double]
    var expenses: Double
    var revenue: Double
    var body: some View {
        VStack {
            RingsChart()
                .data(data)
                .chartStyle(ChartStyle(backgroundColor: Color(hex: 0xf8f9fa),foregroundColor: [ColorGradient( Color(hex: 0x92FFDE),.green),ColorGradient(.orange,.red)]))
                .frame(width: 120, height: 120)
            HStack(spacing: 40){
                VStack{
                    HStack{
                        Circle()
                            .fill(LinearGradient(gradient: Gradient(colors: [Color(hex: 0x92FFDE), .green]),startPoint: .top,endPoint: .bottom))
                            .frame(width: 20, height: 20)
                        
                        Text("支出")
                            .font(.subheadline)
                            .foregroundColor(.black)
                    }
                    Text("￥\(expenses.formatterNumber)")
                        .font(.headline)
                }
                
                VStack{
                    HStack{
                        Circle()
                            .fill(LinearGradient(gradient: Gradient(colors: [.orange, .red]),startPoint: .top,endPoint: .bottom))
                            .frame(width: 20, height: 20)
                        
                        Text("收入")
                            .font(.subheadline)
                            .foregroundColor(.black)
                    }
                    Text("￥\(revenue.formatterNumber)")
                        .font(.headline)
                    
                }
            }
        }
        .frame(width: ScreenW*0.9, height: 200)
        .background(.white)
        .cornerRadius(10)
        .shadow(radius: 3)
    }
}
