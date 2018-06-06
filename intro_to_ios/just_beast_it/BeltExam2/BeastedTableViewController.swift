//
//  BeastedTableViewController.swift
//  BeltExam2
//
//  Created by Seyma Akin on 1/30/18.
//  Copyright © 2018 Seyma Akin. All rights reserved.
//

import UIKit
import CoreData

class BeastedTableViewController: UITableViewController {
    
    @IBOutlet var beastedTable: UITableView!
    
    var beasted = [Items]()
    
    let managedObjectContext = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext

    override func viewDidLoad() {
        super.viewDidLoad()

        fetchAllData()
    }
    
    func fetchAllData() {
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Items")
        
        do {
            // populate incomplete list
            
            request.predicate = NSPredicate(format: "beasted = %@", NSNumber(value: true))
            beasted = try managedObjectContext.fetch(request) as! [Items]
            
        } catch {
            print(error)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }



    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return beasted.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "beastedCell")
        
        let dateformatter = DateFormatter()
        dateformatter.dateFormat = "E MMM d"
        
        cell?.textLabel?.text = beasted[indexPath.row].title
        
        let time = beasted[indexPath.row].time
        let timeText = dateformatter.string(from: time!)
        
        cell?.detailTextLabel?.text = timeText
        
        return cell!
        
//        tableView.reloadData()
        
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        let item = beasted[indexPath.row]
        managedObjectContext.delete(item)
        beasted.remove(at: indexPath.row)
        
        do {
            try managedObjectContext.save()
        } catch {
            print ("\(error)")
        }
        
        tableView.reloadData()
    }


}
