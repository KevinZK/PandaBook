//
//  RecordDeploy.swift
//  CowBookkeeper
//
//  Created by Zuo.Kevin on 2022/2/26.
//

import SwiftUI

class RecordDeploy: ObservableObject {
    
    @Published private var colorModel: RecordPalette<Int> = createColorPalette()
    
    @Published private var symbolModel: RecordPalette<String> = createSymbolPalette()
    
    @Published private var keyboardModel: Keyboard = Keyboard(.record)
    
    var moduleType: AppModuleType = .record
    
    init() {}
    
    init(_ module: AppModuleType) {
        moduleType = module
        switch module {
        case .today: break
        case .debt, .plan: keyboardModel = Keyboard(.sure)
        case .record: keyboardModel = Keyboard(.record)
        }
    }
    
    // MARK: - ColorsPalette
    static func createColorPalette() -> RecordPalette<Int> {
        RecordPalette<Int>(colorsOfRecord)
    }
    
    var colors: [RecordPalette<Int>.Palette] {
        colorModel.palettes
    }
    
    var currentColor: RecordPalette<Int>.Palette {
        colorModel.currentPalette
    }
    
    func choose(_ item: RecordPalette<Int>.Palette) {
        colorModel.choose(item)
    }
    
    // MARK: - SymbolsPalette
    static func createSymbolPalette() -> RecordPalette<String> {
        RecordPalette<String>(symbolsOfRecord)
    }
    
    var symbols: [RecordPalette<String>.Palette] {
        symbolModel.palettes
    }
    
    var currentSymbol: RecordPalette<String>.Palette {
        symbolModel.currentPalette
    }
    
    func choose(_ item: RecordPalette<String>.Palette) {
        symbolModel.choose(item)
    }
    
    // MARK: - keyboard
    
    var keys: [[KeyboardItem]] {
        keyboardModel.keyboardItems
    }
    
    func apply(_ item: KeyboardItem) {
        keyboardModel.apply(item: item)
    }
    
    var keyboardOutput: String {
        keyboardModel.output
    }
    
    var keyboardMoney: Double {
        Double(keyboardModel.value) ?? 0.0
    }
}

/// : Colors
let colorsOfRecord = [
    0x3A86FF,
    0x264653,
    0x2a9d8f,
    0xe9c46a,
    0xf4a261,
    0xe76f51,
    0xe63946,
    0xf72585,
    0x7209b7,
    0x06d6a0,
    0x118ab2,
    0x007f5f,
    0x9b5de5,
    0x582f0e,
    0x390099,
    0x2d00f7,
    0x5c4d7d,
    0xff686b,
    0xfad2e1
]

let symbolsOfRecord = [
    "gift",
    "keyboard",
    "printer",
    "display.2",
    "iphone.homebutton",
    "apps.iphone",
    "computermouse",
    "applewatch",
    "appletv",
    "logo.playstation",
    "logo.xbox",
    "airplane",
    "car",
    "tram",
    "ferry",
    "train.side.front.car",
    "bicycle",
    "scooter",
    "brain.head.profile",
    "eyes",
    "mustache",
    "figure.roll",
    "hare",
    "tortoise",
    "bag",
    "cart",
    "creditcard",
    "giftcard",
    "dollarsign.circle",
    "yensign.circle",
    "bitcoinsign.circle",
    "alarm",
    "heart.text.square",
    "b.circle",
    "tengesign.circle",
    "pesetasign.circle",
    "number",
    "airpods.gen3",
    "square.and.arrow.up.trianglebadge.exclamationmark",
    "square.and.arrow.up.trianglebadge.exclamationmark",
    "cloud.drizzle.fill",
    "cloud.drizzle.fill",
    "cloud.drizzle.fill",
    "mic",
    "mic.circle",
    "books.vertical.fill",
    "umbrella",
    "bell",
    "facemask",
    "eyeglasses",
    "camera",
    "pianokeys.inverse",
    "cross.case",
    "airpodsmax",
    "fuelpump",
    "guitars",
    "ivfluid.bag",
    "cross.vial",
    "gamecontroller",
    "paintpalette",
    "cup.and.saucer",
    "takeoutbag.and.cup.and.straw"
]
