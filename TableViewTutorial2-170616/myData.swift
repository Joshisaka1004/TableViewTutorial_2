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
    init() {
        puzzles = ["Sudoku", "Kakuro", "Hakyuu", "Nurikabe", "Battleships", "Skyscrapers"]
        bilder = ["book1", "book2", "book3", "book4", "book5"]
    }
}
var myContent = myData()
