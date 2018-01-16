//
//  ViewController.swift
//  rainbowRoad
//
//  Created by Seyma Akin on 1/16/18.
//  Copyright © 2018 Seyma Akin. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    var colors = [UIColor.red, UIColor.orange, UIColor.yellow,
                  UIColor.green, UIColor.blue, UIColor.purple]
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return colors.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyCell", for: indexPath)
        cell.backgroundColor = colors[indexPath.row]
        print(indexPath)
        print(indexPath.row)
        return cell
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.rowHeight = 120.0
        // Do any additional setup after loading the view, typically from a nib.
    }


}

