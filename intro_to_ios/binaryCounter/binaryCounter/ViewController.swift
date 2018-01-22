//
//  ViewController.swift
//  binaryCounter
//
//  Created by Seyma Akin on 1/21/18.
//  Copyright © 2018 Seyma Akin. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate,UITableViewDataSource, binaryCounterCellDelegate{
    
    @IBOutlet weak var binaryCounterTableView: UITableView!
    @IBOutlet weak var totalLabel: UILabel!
    var total = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        binaryCounterTableView.delegate = self
        binaryCounterTableView.dataSource = self
    }
    
    func addButtonPressed(increment: Int) {
        total += increment
        totalLabel.text = String(total)
        print(total)
    }
    
    func minusButtonPressed(decrement: Int) {
        total -= decrement
        totalLabel.text = String(total)
        print(total)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 16
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "binaryCounterCell", for: indexPath) as! binaryCounterCustomCell
        cell.numberLabel.text = String(describing: pow(10.0, indexPath.row))
        cell.delegate = self
        return cell
    }
    

}

