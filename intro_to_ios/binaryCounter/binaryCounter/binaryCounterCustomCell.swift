//
//  binaryCounterCustomCell.swift
//  binaryCounter
//
//  Created by Seyma Akin on 1/21/18.
//  Copyright © 2018 Seyma Akin. All rights reserved.
//

import UIKit

class binaryCounterCustomCell: UITableViewCell {
    
    @IBOutlet weak var numberLabel: UILabel!
    
    weak var delegate : binaryCounterCellDelegate?
    
    @IBAction func plusButtonPressed(_ sender: UIButton) {
        delegate?.addButtonPressed(increment: Int(numberLabel.text!)!)
    }
    
    @IBAction func minusButtonPressed(_ sender: UIButton) {
        delegate?.minusButtonPressed(decrement: Int(numberLabel.text!)!)
    }
    

    
}
