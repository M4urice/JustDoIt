//
//  GoalsTableViewController.swift
//  JustDoIt
//
//  Created by Some one on 19/01/16.
//  Copyright © 2016 Some one. All rights reserved.
//

import Foundation
import UIKit
import CoreData
import AVFoundation


class GoalsTableViewController : UITableViewController {
    
    private let reuseIdentifier = "GoalTableCell"
    var goals = [NSManagedObject]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        //        Fetch existing goals from CoreData
        let appDelegate =
        UIApplication.sharedApplication().delegate as! AppDelegate
        let managedContext = appDelegate.managedObjectContext
        let fetchRequest = NSFetchRequest(entityName: "Goal")
        do {
            let results =
            try managedContext.executeFetchRequest(fetchRequest)
            goals = results as! [NSManagedObject]
        } catch let error as NSError {
            print("Could not fetch \(error), \(error.userInfo)")
        }
    }
    
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return goals.count
        
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> GoalTableCell {
        let cell:GoalTableCell = tableView.dequeueReusableCellWithIdentifier(reuseIdentifier, forIndexPath: indexPath)  as! GoalTableCell
        
        cell.textLabel?.text = String(goals[indexPath.row].valueForKey("name")!)
        return cell
    }
    
    
}
