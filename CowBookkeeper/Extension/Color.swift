//
//  Color.swift
//  CowBookkeeper
//
//  Created by Zuo.Kevin on 2022/2/8.
//

import Foundation
import SwiftUI

extension Color {
    init(hex: Int, alpha: Double = 1.0) {
        let red = Double((hex & 0xff0000) >> 16) / 255.0
        let green = Double((hex & 0xff00) >> 8) / 255.0
        let blue = Double((hex & 0xff) >> 0) / 255.0
        self.init(.sRGB, red: red, green: green, blue: blue, opacity: alpha)
    }
    
    public static var debtThemeColor: Color {
        Color(hex: 0xE5383B)
    }
    
    public static var planThemeColor: Color {
        Color(hex: 0xFB5607)
    }
    
    public static var recordThemeColor: Color {
        Color(hex: 0x8338EC)
    }
    
    public static var todayThemeColor: Color {
        Color(hex: 0xFF006E)
    }
}
