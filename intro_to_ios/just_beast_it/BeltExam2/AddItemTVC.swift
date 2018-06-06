//
//  AddItemTVC.swift
//  BeltExam2
//
//  Created by Seyma Akin on 1/30/18.
//  Copyright © 2018 Seyma Akin. All rights reserved.
//

import UIKit

protocol AddItemTVCDelegate:class {
    func saveItem(by: AddItemTVC, title:String, indexPath: IndexPath?)
}

class AddItemTVC: UITableViewController {

    @IBOutlet weak var titleTextField: UITextField!
    
    var delegate: AddItemTVCDelegate?
    
    var titleField: String?
    var indexPath: IndexPath?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        titleTextField.layer.borderWidth = 1.0
        
        titleTextField.text = titleField

    }
    
    @IBAction func cancelButtonPressed(_ sender: UIBarButtonItem) {
        
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func doneButtonPressed(_ sender: UIBarButtonItem) {
        delegate?.saveItem(by: self, title: titleTextField.text!, indexPath:indexPath )
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
     
    }

    
}

extension UIViewController {
    func hideKeyboard() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(
            target: self,
            action: #selector(UIViewController.dismissKeyboard))
        
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard()
    {
        view.endEditing(true)
    }

}
