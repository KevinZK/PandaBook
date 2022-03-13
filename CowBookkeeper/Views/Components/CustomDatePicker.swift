//
//  CustomDatePicker.swift
//  CowBookkeeper
//
//  Created by Zuo.Kevin on 2022/3/11.
//

import SwiftUI

enum CalendarType {
    case `default`
    case extendable
}

struct CustomDatePicker: View {
    
    var calendarType: CalendarType = .default
    
    @State var startDate: Date = Date()
    
    @State
    private var currentMonth: Int = 0
    
    @State
    private var currentDay: Int = 0
    
    @State
    private var selectedDate: DateValue = DateValue() {
        didSet{
            outputDate = selectedDate.date
        }
    }
    
    @Binding var outputDate: Date
    
    @State var isExpand: Bool = false
    
    var action: ()->() = {}
    
    let days: [String] = ["日", "一", "二", "三", "四", "五", "六"]
    
    var body: some View {
        Group {
            switch calendarType {
            case .default: defaultCalendar
            case .extendable: cellCalendar
            }
        }
        
    }
    
    var cellCalendar: some View {
        
        VStack {
            HStack(alignment: .center){
                Button{
                    withAnimation {
                        currentDay -= 1
                        action()
                    }
                } label: {
                    Image(systemName: "chevron.left")
                        .font(.title2)
                        .foregroundColor(.pink)
                        .padding(.vertical,6)
                        .padding(.horizontal,10)
                        .background(.pink.opacity(0.1))
                        .cornerRadius(6)
                }
                .buttonStyle(StaticButtonStyle())
                Spacer()
                VStack {
                    Text(selectedDate.date.formatDate(dateFormat: "YYYY年MM月"))
                        .font(.footnote)
                        .foregroundColor(.black.opacity(0.6))
                        .fontWeight(.semibold)
                        .padding(6)
                        .background(.gray.opacity(0.1))
                        .cornerRadius(4)
                        
                    Text(selectedDate.date.formatDate(dateFormat: "dd"))
                        .font(.title.bold())
                        .foregroundColor(.pink)
                        .padding(.top, -8)
                }
                .onTapGesture {
                    isExpand.toggle()
                }
                
                Spacer()
                Button{
                    withAnimation {
                        currentDay += 1
                        action()
                    }
                } label: {
                    Image(systemName: "chevron.right")
                        .font(.title2)
                        .foregroundColor(.pink)
                        .padding(.vertical,6)
                        .padding(.horizontal,10)
                        .background(.pink.opacity(0.1))
                        .cornerRadius(6)
                }
                .buttonStyle(StaticButtonStyle())
            }
            .background(.white)
            .padding(.horizontal)
            .onChange(of: currentDay) { newValue in
                selectedDate = DateValue(date: getCurrentDay())
            }
            
            Group {
                if isExpand {
                    defaultCalendar
                        .animation(.easeInOut, value: isExpand)
                        
                }
            }
            
        }
        
        
        
    }
    
    var defaultCalendar: some View {
        VStack(spacing: 15) {
            HStack(spacing: 20) {
                VStack(alignment: .leading, spacing: 10) {
                    Text(extraDate()[0])
                        .font(.caption)
                        .fontWeight(.semibold)
                    Text(extraDate()[1])
                        .font(.title.bold())
                }
                Spacer(minLength: 0)
                Button{
                    withAnimation {
                        currentMonth -= 1
                    }
                } label: {
                    Image(systemName: "chevron.left")
                        .font(.title2)
                        .foregroundColor(.pink)
                        .padding(.vertical,6)
                        .padding(.horizontal,10)
                        .background(.pink.opacity(0.1))
                        .cornerRadius(6)
                        
                }
                .buttonStyle(StaticButtonStyle())
                
                Button{
                    withAnimation {
                        currentMonth += 1
                    }
                } label: {
                    Image(systemName: "chevron.right")
                        .font(.title2)
                        .foregroundColor(.pink)
                        .padding(.vertical,6)
                        .padding(.horizontal,10)
                        .background(.pink.opacity(0.1))
                        .cornerRadius(6)
                }
                .buttonStyle(StaticButtonStyle())
                
            }
            .padding(.horizontal)
            HStack(spacing: 2) {
                ForEach(days, id: \.self) { day in
                    Text(day)
                        .font(.callout)
                        .fontWeight(.semibold)
                        .frame(maxWidth: .infinity)
                        .padding(8)
                        .background(.pink.opacity(0.2))
                        .cornerRadius(8)
                }
            }
            .padding(.horizontal)
            
            let colums = Array(repeating: GridItem(.flexible()), count: 7)
            
            LazyVGrid(columns: colums, spacing: 15) {
                ForEach(extractDate()){ value in
                    CardView(value: value)
                        .background(
                            Circle()
                                .fill(.pink)
                                .opacity(isSameDay(date1: selectedDate.date, date2: value.date) ? 1: 0)
                        )
                        .onTapGesture {
                            currentDay = 0
                            startDate = value.date
                            selectedDate.date = value.date
                        }
                        
                        
                }
            }
            .padding(.horizontal)
            .onChange(of: currentMonth) { newValue in
                startDate = getCurrentMonth()
            }
            HStack(alignment:.center) {
                Text(selectedDate.date.isToday ? "今天：" : "选中：")
                    .font(.headline)
                    .padding(.leading,10)
                Text(selectedDate.date.formatDate())
                    .font(.headline)
                Spacer()
            }
            .padding(.horizontal)
            Button{
                isExpand.toggle()
                action()
            }label: {
                Text("确定")
                    .foregroundColor(.white)
                    .fontWeight(.bold)
                    .frame(maxWidth: .infinity)
                    .frame(height: 48)
                    .background(.pink, in: Capsule())
            }
            .buttonStyle(StaticButtonStyle())
            .padding(.horizontal)

            Spacer()
        }
    }
    
    @ViewBuilder
    func CardView(value: DateValue) -> some View {
        
        VStack {
            if value.day != -1 {
                
                Text(String(format: "%02d", value.day))
                    .font(.title3.bold())
                    .foregroundColor( textForegroundColor(date: value.date) )
                    .padding(6)
            }
        }
    }
    
    
    
}
extension CustomDatePicker {
    
    func textForegroundColor(date: Date) -> Color {
        if isSameDay(date1: selectedDate.date, date2: date) {
            return .white
        }
        
        if date.isToday && !isSameDay(date1: selectedDate.date, date2: date) {
            return .pink
        }
        
        return .black
    }
    
    func isSameDay(date1: Date, date2: Date) -> Bool {
        let calendar = Calendar.current
        return calendar.isDate(date1, inSameDayAs: date2)
    }
    
    func extraDate() -> [String] {
        let formatter = DateFormatter()
        formatter.dateFormat = "YYYY MM"
        
        let date = formatter.string(from: startDate)
        
        return  date.components(separatedBy: " ")
    }
    
    func getCurrentMonth() -> Date {
        let calendar = Calendar.current
        
        guard let currentMonth = calendar.date(byAdding: .month, value: self.currentMonth, to: Date()) else {
            return Date()
        }
        
        return currentMonth
    }
    
    func getCurrentDay() -> Date {
        let calendar = Calendar.current
        guard let currentDay = calendar.date(byAdding: .day, value: self.currentDay, to: startDate) else { return Date() }
        return currentDay
    }
    
    func extractDate() -> [DateValue] {
        
        let calendar = Calendar.current
        
        let currentMonth = getCurrentMonth()
                
        var days = currentMonth.getAllDates().compactMap { date -> DateValue in
            let day = calendar.component(.day, from: date)
            return DateValue(day: day, date: date)
        }
        
        let firstWeekday = calendar.component(.weekday, from: days.first?.date ?? Date())
        
        for _ in 0..<firstWeekday - 1 {
            days.insert(DateValue(day: -1, date: Date()), at: 0)
        }
        return days
    }
}

struct CustomDatePicker_Previews: PreviewProvider {
    static var previews: some View {
        CBTodayView()
    }
}

// MARK: - DateValue

struct DateValue: Identifiable {
    var id = UUID().uuidString
    var day: Int
    var date: Date
    
    
    init(day: Int = 0, date: Date = Date()) {
        self.day = day
        self.date = date
    }
}
