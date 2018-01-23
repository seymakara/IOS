//
//  PersonDetailViewController.swift
//  starWarsEncyclopedia
//
//  Created by Seyma Akin on 1/22/18.
//  Copyright © 2018 Seyma Akin. All rights reserved.
//

import UIKit

class PersonDetailViewController: UIViewController {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var genderLabel: UILabel!
    @IBOutlet weak var birthYearLabel: UILabel!
    @IBOutlet weak var massLabel: UILabel!
    
    var id: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let url = URL(string: "https://swapi.co/api/people/" + String(Int(id!)!+1) + "/")
        print(id)
        
        let session = URLSession.shared

        let task = session.dataTask(with: url!, completionHandler: {
  
            data, response, error in
          
            do {
                
                if let jsonResult = try JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.mutableContainers) as? NSDictionary {
                    print(jsonResult)
                    DispatchQueue.main.async {
                        self.nameLabel.text = "Name: \(jsonResult["name"]! as! String)"
                        self.genderLabel.text = "Name: \(jsonResult["gender"]! as! String)"
                        self.birthYearLabel.text = "Birth Year: \(jsonResult["birth_year"]! as! String)"
                        self.massLabel.text = "Mass: \(jsonResult["mass"]! as! String)"
                    }
                }
            } catch {
                print("Something went wrong")
            }
        })
        
        task.resume()
    }
    
    @IBAction func backButtonPressed(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }
    
}

