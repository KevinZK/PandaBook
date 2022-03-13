//
//  ProgressCell.swift
//  CowBookkeeper
//
//  Created by Zuo.Kevin on 2022/3/10.
//

import SwiftUI

struct ProgressCell: View {
    
    var symbol: String
    var bgColor: Int
    var title: String
    var date: String
    var totalAmount: Double
    var currentAmount: Double
    var progress: CGFloat
    
    var body: some View {
        
        VStack {
            HStack {
                Image(systemName: symbol)
                    .frame(width: 24)
                    .font(.system(size: 18))
                    .padding(10)
                    .foregroundColor(.white)
                    .background(Color(hex: bgColor))
                    .clipShape(Circle())
                    .overlay {
                        Circle().stroke(.white, lineWidth: 1)
                    }
                    .shadow(radius: 3)
                
                VStack(alignment: .leading) {
                    Text(title)
                        .font(.title2)
                    Text(date)
                        .font(.subheadline)
                        .foregroundColor(.gray)
                }
                Spacer()
                Text("\(totalAmount.formatterNumber)￥")
                Image(systemName: "chevron.right")
                    .foregroundColor(.gray)
                
            }
            .padding(.top)
            .padding(.bottom)
            
            HStack {
                Text("进度：")
                    .font(.custom(FontFamily.SFT.rawValue, size: 16))
                    .foregroundColor(Color(hex: 0x6C757D))
                ProgressView(value: currentAmount, total: totalAmount)
                    .progressViewStyle(LinearProgressViewStyle(tint: Color(hex: bgColor)))
                Text("\(String(format: "%.1f", progress*100))%")
                    .font(.custom(FontFamily.MS.rawValue, size: 18))
                
            }
            .padding(8)
            .background(Color(hex: 0xF5F3F4, alpha: 0.6))
            .cornerRadius(8)
            .padding(.top, -15)
            
            Divider()
        }
    }
}


struct OrderCell: View {
    
    var symbol: String
    var bgColor: Int
    var title: String
    var date: String
    var type: RecordsType
    var amount: Double
    
    var body: some View {
        
        VStack {
            HStack {
                Image(systemName: symbol)
                    .frame(width: 24)
                    .font(.system(size: 18))
                    .padding(10)
                    .foregroundColor(.white)
                    .background(Color(hex: bgColor))
                    .clipShape(Circle())
                    .overlay {
                        Circle().stroke(.white, lineWidth: 1)
                    }
                    .shadow(radius: 3)
                    
                VStack(alignment: .leading) {
                    Text(title)
                        .font(.title2)
                    Text(date)
                        .font(.subheadline)
                        .foregroundColor(.gray)
                }
                Spacer()
                HStack {
                    Image(systemName: type.rawValue)
                        .foregroundColor(type.color)
                    Text("￥\(amount.formatterNumber)")
                        .foregroundColor(type.color)
                }
                
            }
            .padding(.top)
            .padding(.bottom)
            Divider().padding(.leading).padding(.trailing)
        }
    }
}
