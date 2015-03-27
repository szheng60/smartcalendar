//
//  ViewController.swift
//  Zazu Screens
//
//  Created by Gokul Raghuraman on 3/26/15.
//  Copyright (c) 2015 Zazu Labs. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var events = Array<Event>()
    var newEvent: Event?

    @IBOutlet weak var eventsTableView: UITableView!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        
        println("HERE!!!")
        
        // Do any additional setup after loading the view, typically from a nib.
        loadEvents()
        
        self.eventsTableView.delegate = self
        self.eventsTableView.dataSource = self
        
        if (newEvent != nil)
        {
            println(newEvent?.name)
        }
        else
        {
            println("GOT NIL EVENT")
        }
        
    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func loadEvents()
    {
        
        //Refresh events array!
        events = Array<Event>()
        
        var event1 = Event(name: "Design Discussion", desc: "Hey guys! Let's go over our design!", duration: "45 mins", email: "snbinjie@gmail.com", creator_name: "Binjie Sun", attendees: "You (Gokul), Saajan Shridhar, Song Zheng, Apoorva Verlekar", sd: "Mar 20, 2015, 2:00 PM", ed: "Mar 22, 2015, 5:00 PM", dd: "Mar 19, 2015, 5:00 PM", status: "new", image: "binjie.jpg")
        
        var event2 = Event(name: "Dinner at Six Feet Under", desc: "Let's catch up over dinner.", duration: "2 hours", email: "gokul2005@gmail.com", creator_name: "Gokul Raghuraman",attendees: "Binjie Sun, Saajan Shridhar", sd: "Mar 24, 2015, 6:00 PM", ed: "Mar 25, 2015, 8:00 PM", dd: "Mar 23, 2015, 6:00 PM", status: "accepted", image: "gokul.jpg")
        
        var event3 = Event(name: "Touch base with Binjie / Song", desc: "Updates on our MAS project", duration: "30 mins", email: "gokul2005@gmail.com", creator_name: "Gokul raghuraman",attendees: "Binjie Sun, Song Zheng", sd: "Mar 18, 2015, 6:00 PM", ed: "Mar 20, 2015, 6:00 PM", dd: "Mar 17, 2015, 6:00 PM", status: "declined", image: "saajan.jpg")
        
        var event4 = Event(name: "MAS Architecture Discussion", desc: "Let's meet up to go over our app's architecture", duration: "2 hours", email: "szheng60@gmail.com", creator_name: "Song Zheng",attendees: "Gokul Raghuraman, Binjie Sun, Saajan Shridhar, Apoorva Verlekar", sd: "Mar 12, 2015, 4:00 PM", ed: "Mar 14, 2015, 6:00 PM", dd: "Mar 11, 2015, 6:00 PM", status: "passed", image: "song.jpg")
        
        var event5 = Event(name: "AI Final Project", desc: "Discussion of final project submission", duration: "2 hours", email: "gokul2005@gmail.com", creator_name: "Gokul Raghuraman",attendees: "Sachin Gupta, Saajan Shridhar", sd: "Dec 4, 2014, 3:00PM", ed: "Dec 5, 2014, 2:00PM", dd: "Dec 2, 2014, 3:00PM", status: "passed", image: "gokul.jpg")
        
        var event6 = Event(name: "Business Proposal Discussion", desc: "", duration: "", email: "", creator_name: "Gokul Raghuraman",attendees: "Adam Smith, Rohan Gupta", sd: "Nov 15 , 2014, 5:00PM", ed: "Nov 18 , 2014, 5:00PM", dd: "Nov 14 , 2014, 5:00PM", status: "passed", image: "gokul.jpg")
        
        
        if self.newEvent != nil
        {
            if self.newEvent?.name != ""
            {
                events.append(newEvent!)
            }
        }
        
        events.append(event1)
        events.append(event2)
        events.append(event3)
        events.append(event4)
        events.append(event5)
        events.append(event6)
        
        self.eventsTableView.reloadData()
        
        
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return events.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell: EventTableViewCell = eventsTableView.dequeueReusableCellWithIdentifier("EventCell") as EventTableViewCell
        
        /*
        if indexPath.row % 2 == 0
        {
            cell.backgroundColor = UIColor.grayColor()
        }
        else
        {
            cell.backgroundColor = UIColor.whiteColor()
        }
        */
        
        let event = events[indexPath.row]
        cell.setCell(event.name!, status: event.status!, eventTimeText: event.start_date!, eventAttendeesText: event.attendees!, eventCreatorName: event.creator_name!, eventCreatorImage: event.image!)
        
        return cell
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?)
    {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
        if segue.identifier == "EventDetail"
        {
            //println("PUSHING EVENT DATA")
            let index:NSIndexPath = self.eventsTableView.indexPathForSelectedRow()!
            //println("HERE1")
            var navigationController = segue.destinationViewController as UINavigationController
            var detailEventViewController = navigationController.viewControllers[0] as DetailEventViewController
            //println("HERE2")
            var event:Event = events[index.row]
            //println("HERE3")
            
            detailEventViewController.event = Event(name: event.name!, desc: event.description!, duration: event.duration!, email: event.creator_email!, creator_name: event.creator_name!, attendees: event.attendees!, sd: event.start_date!, ed: event.end_date!, dd: event.decide_by_date!, status: event.status!, image: event.image!)
            //println("HERE4")
        }
    }

    
    

}

