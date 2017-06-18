//
//  ViewController.swift
//  TableViewTutorial2-170616
//
//  Created by Joachim Vetter on 16.06.17.
//  Copyright © 2017 Joachim Vetter. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate {

    @IBOutlet weak var mySearchbar: UISearchBar!
    @IBOutlet weak var myTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        myTableView.delegate = self
        myTableView.dataSource = self
        mySearchbar.delegate = self
        myContent.fillBool()
        print(myContent.filteredItems)
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return myContent.filteredItems.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let myCurrent = myTableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath) as! myPrototypeCell
        myCurrent.myLabel.text = myContent.filteredItems[indexPath.row]
        myCurrent.myImages.image = UIImage(named: myContent.filteredItems[indexPath.row])
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
        //myTableView.reloadData()
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
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if let text = searchBar.text {
            let eingabe = text.trimmingCharacters(in: .whitespaces)
            myContent.filterData(search: eingabe)
            print(myContent.filteredItems)
            myTableView.reloadData()
        }
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        myTableView.reloadData()
    }
}

