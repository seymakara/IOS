//
//  FilmViewController.swift
//  starWarsEncyclopedia
//
//  Created by Seyma Akin on 1/22/18.
//  Copyright © 2018 Seyma Akin. All rights reserved.
//

import UIKit

class FilmViewController: UITableViewController {
    
    var films = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let url = URL(string: "https://swapi.co/api/films/")
        
        let session = URLSession.shared
        
        let task = session.dataTask(with: url!, completionHandler: {
            
            data, response, error in
            
            do {
               
                if let jsonResult = try JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.mutableContainers) as? NSDictionary {
                    
                    if let results = jsonResult["results"] as? NSArray {
                        for film in results {
                            let filmDict = film as! NSDictionary
                            self.films.append(filmDict["title"]! as! String)
                        }
                        print(self.films)
                    }
                }
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            } catch {
                print(error)
            }
        })
        // execute the task and wait for the response before
        // running the completion handler. This is async!
        task.resume()

    }



    override func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
 
        return films.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        
        cell.textLabel?.text = films[indexPath.row]
        return cell
    }

}
