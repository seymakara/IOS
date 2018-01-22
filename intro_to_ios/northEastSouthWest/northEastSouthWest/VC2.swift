//
//  VC2.swift
//  northEastSouthWest
//
//  Created by Seyma Akin on 1/21/18.
//  Copyright © 2018 Seyma Akin. All rights reserved.
//

import UIKit

class VC2: UIViewController {

    @IBOutlet weak var outputLabel: UILabel!
    var output: String?

    override func viewDidLoad() {
        super.viewDidLoad()
        outputLabel.text = output
        
        

        // Do any additional setup after loading the view.
    }

    @IBAction func goBackToOneButtonTapped(_ sender: Any) {
        performSegue(withIdentifier: "unwindSegueToVC1", sender: self)
    }


}
