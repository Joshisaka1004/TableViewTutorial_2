//
//  ViewController.swift
//  TableViewTutorial2-170616
//
//  Created by Joachim Vetter on 16.06.17.
//  Copyright © 2017 Joachim Vetter. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var myTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        myTableView.delegate = self
        myTableView.dataSource = self
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return myContent.puzzles.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let myCurrent = myTableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath)
        return myCurrent
    }
}

