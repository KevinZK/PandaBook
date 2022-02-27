//
//  VerifyInput.swift
//  CowBookkeeper
//
//  Created by Zuo.Kevin on 2022/2/21.
//

import Foundation
import SwiftUI

struct Keyboard {
    
    private(set) var keyboardItems: [[KeyboardItem]]
    
    private(set) var output: String = ""
    private(set) var value: String = ""
    
    init(_ type: KeyboardType) {
        keyboardItems = type.data
    }
        
    mutating func apply(item: KeyboardItem) {
        
        switch item {
        case .digit(let num):
            if let lastStr = value.last, lastStr == "." {
                value = value.apply(num: num)
                output = value
            }else{
                value = value.apply(num: num)
                output = value.formatterNum()
            }
            
        case .dot:
            
            if let lastStr = value.applyDot().last, lastStr == "." {
                value = value.applyDot()
                output = value
            }else{
                value = value.applyDot()
                output = value.formatterNum()
            }
        case .option: return
        case .clear:
            value = value.clearOutput()
            output = value
        }
    }
}

var formatter: NumberFormatter = {
    let f = NumberFormatter()
    f.minimumFractionDigits = 0
    f.maximumFractionDigits = 2
    f.numberStyle = .decimal
    return f
}()

extension String {
    var containsDot: Bool {
        return contains(".")
    }

    func apply(num: Int) -> String {
        if startWithZero {
            return self == "0" ? "0" : "\(self)\(num)"
        }else{
            return self == "0" || self == "" ? "\(num)" : "\(self)\(num)"
        }
    }
    
    var startWithZero: Bool {
        return starts(with: "0")
    }
    
    var startWithDot: Bool {
        return starts(with: ".")
    }
    
    func clearOutput() -> String {
        return ""
    }
    
    func applyDot() -> String {
        if self == "" {
            return ""
        }else{
            return containsDot ? self : "\(self)."
        }
        
        
    }

    func formatterNum() -> String {
        guard let inputNum = Double(self) else { return "" }
        
        if inputNum / 10000 >= 1.0 && inputNum / 10000 < 1000.0 {
            return formatter.string(from: inputNum / 10000 as NSNumber)! + "万"
        }
        
        if inputNum / 10000 < 1.0 {
            return String(format: "%.2f", inputNum)
        }
        
        if inputNum / 10000 >= 1000.0  && inputNum / 10000 < 100000000{
            return formatter.string(from: inputNum / 100000000 as NSNumber)! + "亿"
        }
        return "土豪求带"
    }
}

enum Option: String {
    case revenue  = "收入"
    case expenses = "支出"
    case sure     = "确定"
}
enum KeyboardItem {
    case digit(Int)
    case option(Option)
    case dot
    case clear
}

enum KeyboardType {
    case sure
    case record
}

extension KeyboardType {
    var data: [[KeyboardItem]] {
        switch self {
        case .sure:
            return [
                [.digit(7), .digit(8), .digit(9), .clear],
                [.digit(4), .digit(5), .digit(6), .digit(0)],
                [.digit(1), .digit(2), .digit(3), .dot],
                [.option(.sure)]
            ]
        case .record:
            return [
                [.digit(7), .digit(8), .digit(9), .clear],
                [.digit(4), .digit(5), .digit(6), .digit(0)],
                [.digit(1), .digit(2), .digit(3), .dot],
                [.option(.revenue), .option(.expenses)]
            ]
        }
    }
}

private let keyboardItemWidth  = 88
private let keyboardItemHeight = 54

extension KeyboardItem {
    var title: String {
        switch self {
        case .digit(let value): return String(value)
        case .option(let option): return option.rawValue
        case .dot: return "."
        case .clear: return "清"
            
        }
    }
    
    var size: CGSize {
        
        switch self {
        case .dot, .digit, .clear:
            return CGSize(width: keyboardItemWidth, height: keyboardItemHeight)
        case .option(let option):
            if option == .sure {
                return CGSize(width: keyboardItemWidth * 4 + 24, height: keyboardItemHeight)
            }else{
                return CGSize(width: keyboardItemWidth * 2 + 8, height: keyboardItemHeight)
            }
            
        }
        
    }
    
    var backgroundColorName: Color {
        switch self {
        case .digit, .dot, .clear:
            return Color(hex: 0x048ba8)
        case .option:
            return Color(hex: 0xf29e4c)
        }
    }
    
    var foregroundColor: Color { .white }

}

extension KeyboardItem: Hashable {}
