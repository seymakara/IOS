//
//  ViewController.swift
//  ColdCall
//
//  Created by Seyma Akin on 1/10/18.
//  Copyright © 2018 Seyma Akin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var nameLabel: UILabel!
    let nameList = [("Rick"), ("Morty"), ("Summer"), ("Beth"), ("Jerry"), ("Doofus Rick"), ("Mr. Meeseks"),("Bird Person"), ("Squanchy"), ("Mr. Poopybutthole")
    ]
    
    @IBAction func callButtonPressed(_ sender: UIButton) {
        let coldCall = Int(arc4random_uniform(UInt32(nameList.count)))
        nameLabel.text = nameList[coldCall]
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

