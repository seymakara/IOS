//
//  FilmDetailViewController.swift
//  starWarsEncyclopedia
//
//  Created by Seyma Akin on 1/22/18.
//  Copyright © 2018 Seyma Akin. All rights reserved.
//

import UIKit

class FilmDetailViewController: UIViewController {
    
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var releaseDateLabel: UILabel!
    @IBOutlet weak var directorLabel: UILabel!
    @IBOutlet weak var openingCrawlLabel: UILabel!
    
    var id: String?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let url = URL(string: "https://swapi.co/api/films/" + String(Int(id!)!+1) + "/")
        print(id)
        
        let session = URLSession.shared
        
        let task = session.dataTask(with: url!, completionHandler: {
  
            data, response, error in
           
            do {
                
                if let jsonResult = try JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.mutableContainers) as? NSDictionary {
                    print(jsonResult)
                    
                    DispatchQueue.main.async {
                        self.titleLabel.text = "Title: \(jsonResult["title"]! as! String)"
                        self.releaseDateLabel.text = "Release Date: \(jsonResult["release_date"]! as! String)"
                        self.directorLabel.text = "Director: \(jsonResult["director"]! as! String)"
                        self.openingCrawlLabel.text = "Opening Crawl: \(jsonResult["opening_crawl"]! as! String)"
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
