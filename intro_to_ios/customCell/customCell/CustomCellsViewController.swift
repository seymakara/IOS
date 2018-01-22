//
//  ViewController.swift
//  customCell
//
//  Created by Seyma Akin on 1/21/18.
//  Copyright © 2018 Seyma Akin. All rights reserved.
//

import UIKit

class CustomCellsViewController: UITableViewController {
    
    var nums = [1, 90, 32, 23, 9, 12]
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CustomCell") as! CustomCell
        cell.rightLabel.text = "\(nums[indexPath.row])"
        if nums[indexPath.row] > 24 {
            cell.leftButton.backgroundColor = UIColor.green
        } else {
            cell.leftButton.backgroundColor = UIColor.red
        }
        // return cell so that Table View knows what to draw in each row
        return cell
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return nums.count
    }


}

