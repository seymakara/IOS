//
//  ViewController.swift
//  beastList
//
//  Created by Seyma Akin on 1/12/18.
//  Copyright © 2018 Seyma Akin. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var tasks = ["do this", "do that", "don't do that"]
    
    @IBOutlet weak var textFieldLabel: UITextField!
    @IBOutlet weak var tableView: UITableView!
    
    @IBAction func beastButtonPressed(_ sender: UIButton) {
        
        let taskText = textFieldLabel.text!
        if taskText != "" {
            tasks.append(taskText)
            print(tasks)
            tableView.reloadData()
            textFieldLabel.text = ""
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // return an integer that indicates how many rows (cells) to draw
        return tasks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Get the UITableViewCell and create/populate it with data then return it
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyCell", for: indexPath)
        cell.textLabel?.text = tasks[indexPath.row]
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Section: \(indexPath.section) and Row: \(indexPath.row)")
        tasks.remove(at: indexPath.row)
        tableView.reloadData()
    }
}


