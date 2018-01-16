//
//  ViewController.swift
//  tickTackToe
//
//  Created by Seyma Akin on 1/11/18.
//  Copyright © 2018 Seyma Akin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var winnerLabel: UILabel!
    
    var gamestate = [0,0,0,0,0,0,0,0,0,0]
    var buttonEnabled = true
    var counter = 0
    
    @IBAction func buttonClicked(_ sender: UIButton) {
        if buttonEnabled == true{
            if counter % 2 != 0 {
                sender.backgroundColor = .blue
                counter += 1
                sender.isEnabled = false
                gamestate[sender.tag] = 1
                print("blue here\(gamestate)")
                
            }else{
                sender.backgroundColor = .red
                counter += 1
                sender.isEnabled = false
                gamestate[sender.tag] = -1
                
                print("red here\(gamestate)")
            }
            
            let one = gamestate[0] + gamestate[1] + gamestate[2]
            let two = gamestate[3] + gamestate[4] + gamestate[5]
            let three = gamestate[6] + gamestate[7] + gamestate[8]
            let four = gamestate[0] + gamestate[3] + gamestate[6]
            let five = gamestate[1] + gamestate[4] + gamestate[7]
            let six = gamestate[2] + gamestate[5] + gamestate[8]
            let seven = gamestate[0] + gamestate[4] + gamestate[8]
            let eight = gamestate[2] + gamestate[4] + gamestate[6]
            
            if (one == 3 || two == 3 || three == 3 || four == 3 || five == 3 || six == 3 || seven == 3 || eight == 3){
                winnerLabel.text = "BLUE RULES !!!"
                buttonEnabled = false
                
            }else if(one == -3 || two == -3 || three == -3 || four == -3 || five == -3 || six == -3 || seven == -3 || eight == -3){
                sender.isEnabled = false
                winnerLabel.text = "RED RULES !!!"
                buttonEnabled = false
                
            }else if (counter == 9){
                winnerLabel.text = "YOU GUYS SUCK -_-"
            }
            
        }
        
    }
    
    @IBAction func reset(_ sender: UIButton) {
        buttonEnabled = true
        counter = 0
        gamestate = [0,0,0,0,0,0,0,0,0,0]
        winnerLabel.text = ""
        loadView()
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

