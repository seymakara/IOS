//
//  ViewController.swift
//  tipster
//
//  Created by Seyma Akin on 1/11/18.
//  Copyright © 2018 Seyma Akin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var total: UILabel!
    @IBOutlet weak var groupSize: UILabel!
    @IBOutlet weak var decimalButton: UIButton!
    
    @IBOutlet var percentageLabel: [UILabel]!
    @IBOutlet var tipPerPerson: [UILabel]!
    @IBOutlet var totalsWithTip: [UILabel]!
    
   
    @IBOutlet weak var tipSlider: UISlider!
    @IBOutlet weak var groupSizeSlider: UISlider!
    
    let tipIncrement: [Float] = [0, 0.05, 0.10]
    var runningTotal: (Float, String) = (0.00, "")
    
    @IBAction func buttonsPressed(_ sender: UIButton) {
        
        if sender == decimalButton {
            sender.isEnabled = false
        }
        
        runningTotal.1 += sender.currentTitle!
        runningTotal.0 = Float(runningTotal.1)!
        
        total.text = runningTotal.1
        updateTotal()
    }
    
    
    func updateTotal() {
        tipPerPerson.enumerated().forEach{
            index, tipLabel in
            let updatedTip = ((tipSlider.value + tipIncrement[index]) * runningTotal.0)
            tipLabel.text = String(format:"$%.2f", updatedTip / round(groupSizeSlider.value) )
            totalsWithTip[index].text = String (format:"$%.2f",runningTotal.0 + updatedTip)
            
        }
    }
    
    
    @IBAction func tipSliderWasMoved(_ sender: UISlider) {
        self.updateTotal()
        percentageLabel.enumerated().forEach {
            index, percentlabel in
            percentlabel.text = String(format: "%.2f%%",(sender.value + tipIncrement[index])*100)
        }
    }
    
    
    @IBAction func groupSizeSliderMoved(_ sender: UISlider) {
        groupSize.text = "Group Size:\(Int(round(sender.value)))"
        self.updateTotal()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        total.text = "0.00"
     
    }
    
    @IBAction func clearButtonPressed(_ sender: UIButton) {
        total.text = "0.00"
        tipSlider.value = 0.05
        groupSizeSlider.value = 1
        decimalButton.isEnabled = true
        runningTotal = (0.00, "")
        
        percentageLabel.enumerated().forEach{
            index, percentlabel in
            percentlabel.text = String(format: "$%.2f",(tipSlider.value + tipIncrement[index]) * 100)
            tipPerPerson[index].text = "0.00"
            totalsWithTip[index].text = "0.00"
        }
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

