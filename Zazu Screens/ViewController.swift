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

    @IBOutlet weak var eventsTableView: UITableView!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        loadEvents()
        
        self.eventsTableView.delegate = self
        self.eventsTableView.dataSource = self
        
    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func loadEvents()
    {
        var event1 = Event(name: "Design Discussion", desc: "Hey guys! Let's go over our design!", duration: "45 mins", email: "snbinjie@gmail.com", attendees: "You (Gokul), Saajan Shridhar, Song Zheng, Apoorva Verlekar", sd: "Mar 20, 2015, 2:00 PM", ed: "Mar 22, 2015, 5:00 PM", dd: "", status: "new", image: "binjie.jpg")
        var event2 = Event(name: "Dinner at Six Feet Under", desc: "Let's catch up over dinner.", duration: "2 hours", email: "gokul2005@gmail.com", attendees: "Binjie Sun, Saajan Shridhar", sd: "Mar 24, 2015, 6:00 PM", ed: "Mar 25, 2015, 8:00 PM", dd: "", status: "accepted", image: "gokul.jpg")
        var event3 = Event(name: "Touch base with Binjie / Song", desc: "Updates on our MAS project", duration: "30 mins", email: "gokul2005@gmail.com", attendees: "Binjie Sun, Song Zheng", sd: "Mar 18, 2015, 6:00 PM", ed: "Mar 20, 2015, 6:00 PM", dd: "", status: "declined", image: "saajan.jpg")
        var event4 = Event(name: "MAS Architecture Discussion", desc: "Let's meet up to go over our app's architecture", duration: "2 hours", email: "szheng60@gmail.com", attendees: "Gokul Raghuraman, Binjie Sun, Saajan Shridhar, Apoorva Verlekar", sd: "Mar 12, 2015, 4:00 PM", ed: "Mar 14, 2015, 6:00 PM", dd: "", status: "passed", image: "song.jpg")
        var event5 = Event(name: "AI Final Project", desc: "Discussion of final project submission", duration: "2 hours", email: "gokul2005@gmail.com", attendees: "Sachin Gupta, Saajan Shridhar", sd: "Dec 4, 2014, 3:00PM", ed: "Dec 5, 2014, 2:00PM", dd: "", status: "passed", image: "gokul.jpg")
        var event6 = Event(name: "Business Proposal Discussion", desc: "", duration: "", email: "", attendees: "Adam Smith, Rohan Gupta", sd: "Nov 15 , 2014, 5:00PM", ed: "", dd: "", status: "passed", image: "gokul.jpg")
        
        
        events.append(event1)
        events.append(event2)
        events.append(event3)
        events.append(event4)
        events.append(event5)
        events.append(event6)
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
        cell.setCell(event.name!, status: event.status!, eventTimeText: event.start_date!, eventAttendeesText: event.attendees!, eventCreatorImage: event.image!)
        
        return cell
    }
    
    

}

