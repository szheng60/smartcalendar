//
//  ViewController.swift
//  Zazu Screens
//
//  Created by Gokul Raghuraman on 3/26/15.
//  Copyright (c) 2015 Zazu Labs. All rights reserved.
//

import UIKit
import SwiftHTTP
import JSONJoy
import AddressBookUI

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {


    var newEvent: Event?

    @IBOutlet weak var eventsTableView: UITableView!
    
    override func viewDidAppear(animated: Bool) {
        if newEvent != nil {
            events.append(newEvent!)
            newEvent = nil
            self.eventsTableView.reloadData()
        }
    }
    override func viewDidLoad()
    {
        super.viewDidLoad()
        getAPIEvents()
    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    private func getAPIEvents()
    {
        request.GET("\(apiURL)/events/", parameters: nil, success: {(response: HTTPResponse) in
            if response.responseObject != nil {
                let decoder = JSONDecoder(response.responseObject!)
                if let decoders = decoder.array {
                    for subDecoder in decoders {
                        events.append(Event(subDecoder))
                    }
                }
                for e in events {
                    println(e.eventID)
                    println(e.name)
                }
                self.eventsTableView.reloadData()
            }
            }, failure: {(error: NSError, response: HTTPResponse?) in
                println("got an error: \(error)")
        })

    }
    func updateEventTimeSlots()
    {
        
        
        
        /*
        //update
        let params:Dictionary<String, AnyObject> = ["user_email": "\(signIn!.userEmail)", "device_id": "\(signIn!.userID)", "token": "\(auth.accessToken)"]
        request.PUT("\(apiURL)/participants/", parameters: params, success: {(response: HTTPResponse) in
            println("token updated")
            }, failure: {(error: NSError, response: HTTPResponse? ) in
                println("got an error: \(error)")
        })
*/
    }
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return events.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell: EventTableViewCell = eventsTableView.dequeueReusableCellWithIdentifier("EventCell") as EventTableViewCell
        let event = events[indexPath.row]
        cell.setCell(event.name!, status: event.status!, eventTimeText: event.start_date!, eventAttendeesText: event.attendees!, eventCreatorName: event.creator_name!)//, eventCreatorImage: "nul")
        return cell
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?)
    {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
        if segue.identifier == "EventDetail"
        {
            let index:NSIndexPath = self.eventsTableView.indexPathForSelectedRow()!
            var navigationController = segue.destinationViewController as UINavigationController
            var detailEventViewController = navigationController.viewControllers[0] as DetailEventViewController
            var event:Event = events[index.row]
            detailEventViewController.event = Event(
                eID: event.eventID!,
                name: event.name!,
                description: event.description!,
                duration: event.duration!,
                email: event.creator_email!,
                creator_name: event.creator_name!,
                attendees: event.attendees!,
                sd: event.start_date!,
                ed: event.end_date!,
                dd: event.decide_by_date!,
                status: event.status!,
                timeSlots: event.timeSlots!//, image: event.image!)
            )
        }
    }

    
    

}

