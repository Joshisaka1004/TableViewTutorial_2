//
//  myData.swift
//  TableViewTutorial2-170616
//
//  Created by Joachim Vetter on 16.06.17.
//  Copyright © 2017 Joachim Vetter. All rights reserved.
//

import UIKit

class myData {
    var puzzles = [String]()
    var bilder = [String]()
    var colorsOfRows = [Bool]()
    var filteredItems:[String] = []
    init() {
        puzzles = ["Sudoku", "Kakuro", "Hakyuu", "Nurikabe", "Battleships", "Skyscrapers"]
        bilder = ["book1", "book2", "book3", "book4", "book5", "book6"]
        filterData(search: "")
    }
    func fillBool() {
        for _ in 0..<puzzles.count {
            colorsOfRows.append(false)
        }
    }
    func filterData(search: String) {
        if search == "" {
            filteredItems = puzzles
        } else {
            filteredItems = puzzles.filter({
                (item) in
                let value1 = item.lowercased()
                let value2 = search.lowercased()
                let valid = value1.hasPrefix(value2)
                return valid
            })
        }
        filteredItems.sort(by: {(value1, value2) in value1 < value2})
    }
}
var myContent = myData()

