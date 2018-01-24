//
//  AddViewController.swift
//  todoList
//
//  Created by Seyma Akin on 1/23/18.
//  Copyright © 2018 Seyma Akin. All rights reserved.
//

import UIKit

class AddViewController: UIViewController {
    
    @IBOutlet weak var TodoTitle: UITextField!
    @IBOutlet weak var TodoDetail: UITextView!
    @IBOutlet weak var TodoDate: UIDatePicker!
    
    weak var delegate : AddItemButtonDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func AddItemButtonPressed(_ sender: UIButton) {
        delegate?.AddButtonPressed(by: self, with: TodoTitle.text!, with: TodoDetail.text!, with: TodoDate.date)
    }
    
}
