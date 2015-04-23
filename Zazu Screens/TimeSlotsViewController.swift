//
//  TimeSlotsViewController.swift
//  Zazu Screens
//
//  Created by Gokul Raghuraman on 4/21/15.
//  Copyright (c) 2015 Zazu Labs. All rights reserved.
//

import UIKit
import SwiftHTTP
import JSONJoy

class TimeSlotsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource
{
    var timeSlots = Array<String>()
    
    var eventID = Int()
    
    var selectedTimeSlots = Array<String>()
    
    var timeSlotSelections = Array<Bool>()
    
    @IBOutlet weak var timeSlotsTableView: UITableView!
    
    override func viewDidLoad()
    {
        self.timeSlotsTableView.delegate = self
        self.timeSlotsTableView.dataSource = self
        
        for var i = 0; i < timeSlots.count; i++
        {
            timeSlotSelections.append(true)
        }

        
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int
    {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return self.timeSlots.count
        //return 3
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath)
    {
        tableView.deselectRowAtIndexPath(indexPath, animated: false)
        
        let cell = tableView.cellForRowAtIndexPath(indexPath)
        if cell?.accessoryType == UITableViewCellAccessoryType.Checkmark
        {
            cell?.accessoryType = UITableViewCellAccessoryType.None
            timeSlotSelections[indexPath.row] = false
            
        }
        else
        {
            cell?.accessoryType = UITableViewCellAccessoryType.Checkmark
            timeSlotSelections[indexPath.row] = true
        }
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        
        
        
        let cell = tableView.dequeueReusableCellWithIdentifier("TimeSlotCell") as UITableViewCell
        cell.accessoryType = .Checkmark
        cell.textLabel?.text = timeSlots[indexPath.row]
        //cell.textLabel?.text = "test"
        
        return cell

    }
    
    
    
    @IBAction func updateButtonAction(sender: AnyObject)
    {
        for var i = 0; i < timeSlots.count; i++
        {
            if timeSlotSelections[i] == true
            {
                selectedTimeSlots.append(timeSlots[i])
            }
        }
        
        print(selectedTimeSlots)
        
        
        var time_slots = ",".join(selectedTimeSlots)
        let params:Dictionary<String, AnyObject> = [
            "id": "\(eventID)",
            "timeSlots": "\(time_slots)",
        ]
        println(" ")
        println(" ")
        println(" ")
        println(time_slots)
        
        request.requestSerializer = HTTPRequestSerializer()
        request.PUT("\(apiURL)/events", parameters: params, success: {(response: HTTPResponse) in
            self.dismissViewControllerAnimated(true, completion: nil)
            }, failure: {(error: NSError, response: HTTPResponse? ) in
                println("error: \(error)")
        })

        
    }
    

}
