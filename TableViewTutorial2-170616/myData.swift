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
    init() {
        puzzles = ["Sudoku", "Kakuro", "Hakyuu", "Nurikabe", "Battleships", "Skyscrapers"]
        bilder = ["book1", "book2", "book3", "book4", "book5", "book6"]
    }
    func fillBool() {
        for _ in 0..<puzzles.count {
            colorsOfRows.append(false)
        }
    }
}
var myContent = myData()

