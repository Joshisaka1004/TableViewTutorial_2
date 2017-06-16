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
        myContent.fillBool()
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return myContent.puzzles.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let myCurrent = myTableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath) as! myPrototypeCell
        myCurrent.myLabel.text = myContent.puzzles[indexPath.row]
        myCurrent.myImages.image = UIImage(named: myContent.bilder[indexPath.row])
        return myCurrent
    }
    
    @IBAction func editButton(_ sender: UIBarButtonItem) {
        if !myTableView.isEditing {
            myTableView.setEditing(true, animated: true)
        } else {
            myTableView.setEditing(false, animated: true)
        }
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == UITableViewCellEditingStyle.delete {
            myContent.puzzles.remove(at: indexPath.row)
            myContent.bilder.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: UITableViewRowAnimation.automatic)
        }
        myTableView.reloadData()
        print(myContent.puzzles, myContent.bilder)
    }
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        let moving = myContent.puzzles[sourceIndexPath.row]
        let moving2 = myContent.bilder[sourceIndexPath.row]
        myContent.puzzles.remove(at: sourceIndexPath.row)
        myContent.puzzles.insert(moving, at: destinationIndexPath.row)
        myContent.bilder.remove(at: sourceIndexPath.row)
        myContent.bilder.insert(moving2, at: destinationIndexPath.row)
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let myCurrent = myTableView.cellForRow(at: indexPath) {
            giveColor(color: myCurrent, path: indexPath)
        }
        myTableView.deselectRow(at: indexPath, animated: true)
    }
    func giveColor(color: UITableViewCell, path: IndexPath) {
        if myContent.colorsOfRows[path.row] {
            color.backgroundColor = UIColor.white
            myContent.colorsOfRows[path.row] = !myContent.colorsOfRows[path.row]
        } else {
            color.backgroundColor = UIColor.yellow
            myContent.colorsOfRows[path.row] = !myContent.colorsOfRows[path.row]
        }
        myTableView.reloadData()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        myTableView.reloadData()
    }
}

