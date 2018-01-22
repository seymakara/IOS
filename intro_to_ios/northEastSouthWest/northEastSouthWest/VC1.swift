//
//  ViewController.swift
//  northEastSouthWest
//
//  Created by Seyma Akin on 1/21/18.
//  Copyright © 2018 Seyma Akin. All rights reserved.
//

import UIKit

class VC1: UIViewController {

    @IBOutlet weak var east: UIButton!
    @IBOutlet weak var south: UIButton!
    @IBOutlet weak var north: UIButton!
    @IBOutlet weak var west: UIButton!
    
    @IBAction func buttonClicked(_ sender: UIButton) {
        performSegue(withIdentifier: "ClickSegue", sender: sender)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

   @IBAction func unwindToVC1(segue:UIStoryboardSegue) { }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destination = segue.destination as! VC2
        let button = sender as? UIButton
        destination.output = button?.titleLabel?.text
    }


}

