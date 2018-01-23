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
        
        StarWarsModel.getAllFilms(completionHandler: {
            data, response, error in
            do {

                if let jsonResult = try JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.mutableContainers) as? NSDictionary {
                    
                    if let results = jsonResult["results"] as? NSArray {
                        
                        for film in results {
                            let filmDict = film as! NSDictionary
                            self.films.append(filmDict["title"]! as! String)
                        }
                    }
                }
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            } catch {
                print("Something went wrong")
            }
        })
    }
    
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "filmDetailSegue", sender: indexPath.row)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destination = segue.destination as! UINavigationController
        let detail = destination.topViewController as! FilmDetailViewController
        print("SENDER:\(sender!)")
        detail.id = String(describing: sender!)
        

    }


    override func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
 
        return films.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "filmCell", for: indexPath)
        
        cell.textLabel?.text = films[indexPath.row]
        return cell
    }

}
