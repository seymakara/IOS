//
//  ViewController.swift
//  agingPeople
//
//  Created by Seyma Akin on 1/15/18.
//  Copyright © 2018 Seyma Akin. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    var people = ["Hilal", "Seyma", "Halil",
                  "Hatice", "Yagmur", "Asli",
                  "Cansu", "Ozlem", "Melih",
                  "Adem", "Nuri", "Umut"]
    var ages: [Int] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        // Do any additional setup after loading the view, typically from a nib.
        for _ in 0..<people.count {
            ages.append(Int(arc4random_uniform(91))+5)
        }
        print(ages)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return people.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyCell", for: indexPath)
        cell.textLabel?.text = people[indexPath.row]
        cell.detailTextLabel?.text = "\(ages[indexPath.row]) years old"
        return cell
    }
    
}

