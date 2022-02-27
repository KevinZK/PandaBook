//
//  RecordPalette.swift
//  CowBookkeeper
//
//  Created by Zuo.Kevin on 2022/2/20.
//

import Foundation

struct RecordPalette<T> {
    private(set) var palettes: [Palette]
    
    private(set) var currentPalette: Palette
    
    mutating func choose(_ item: Palette) {
        if let index = filterIndex(item) {
            palettes[index].isSelected.toggle()
            resetState()
            currentPalette = item
        }
    }
    
    private func filterIndex(_ item: Palette) -> Int? {
        return palettes.firstIndex(where: { $0.id == item.id })
    }
    
    private mutating func resetState() {
        if let index = filterIndex(currentPalette)
        {
            palettes[index].isSelected.toggle()
        }
    }
    
    init(_ items: Array<T>) {
        palettes = items.map{ Palette(content: $0) }
        palettes[0].isSelected.toggle()
        currentPalette = palettes[0]
    }
    
    struct Palette: Identifiable {
        var id: UUID = UUID()
        var isSelected: Bool = false
        var content: T
        
    }
}




