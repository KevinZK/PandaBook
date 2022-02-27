//
//  View.swift
//  CowBookkeeper
//
//  Created by Zuo.Kevin on 2022/2/21.
//

import Foundation
import SwiftUI

extension View {
    @ViewBuilder
    func `if`<Transform: View>(_ condition: Bool, transform: (Self) -> Transform) -> some View {
        if condition { transform(self) }
        else { self }
    }
}
