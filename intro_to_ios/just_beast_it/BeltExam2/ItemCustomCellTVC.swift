//
//  ItemCustomCellTVC.swift
//  BeltExam2
//
//  Created by Seyma Akin on 1/30/18.
//  Copyright © 2018 Seyma Akin. All rights reserved.
//

import UIKit

protocol ItemCustomCellDelegate: class {
    func editCell(sender: ItemCustomCellTVC)
}

class ItemCustomCellTVC: UITableViewCell {
    
    weak var delegate: ItemCustomCellDelegate?
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBAction func beastButtonPressed(_ sender: UIButton) {
        delegate?.editCell(sender: self)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
