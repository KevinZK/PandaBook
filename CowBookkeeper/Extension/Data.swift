//
//  Data.swift
//  CowBookkeeper
//
//  Created by Zuo.Kevin on 2022/3/13.
//

import Foundation

extension Double {
    
    var formatterNumber: String {
            if self.isNaN {
                return "NaN"
            }
            if self.isInfinite {
                return "\(self < 0.0 ? "-" : "+")Infinity"
            }
            let units = ["", "万", "千万"]
            var interval = self
            var i = 0
            while i < units.count - 1 {
                if abs(interval) < 10000.0 {
                    break
                }
                i += 1
                interval /= 10000.0
            }
            // + 2 to have one digit after the comma, + 1 to not have any.
            // Remove the * and the number of digits argument to display all the digits after the comma.
            return "\(String(format: "%0.*g", Int(log10(abs(interval))) + 2, interval))\(units[i])"
        }
    
}
