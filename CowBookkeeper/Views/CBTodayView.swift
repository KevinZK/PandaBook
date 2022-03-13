//
//  CBTodayView.swift
//  CowBookkeeper
//
//  Created by Zuo.Kevin on 2022/2/28.
//

import SwiftUI

struct CBTodayView: View {
    
    @State var selectedDate: Date = Date()
    
    var body: some View {
        VStack {
            CustomDatePicker(calendarType: .cell, outputDate: $selectedDate)
                .onChange(of: selectedDate) { newValue in
                    print(newValue.formatDate())
                }
//            CustomDatePicker(outputDate: $selectedDate)
//                .onChange(of: selectedDate) { newValue in
//                    print(newValue.formatDate())
//                }
        }
        
    }
}

struct CBTodayView_Previews: PreviewProvider {
    static var previews: some View {
        CBTodayView()
    }
}
