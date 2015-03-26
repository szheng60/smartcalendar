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
        var event1 = Event(name: "Design Discussion", desc: "Hey guys! Let's go over our design!", duration: "45 mins", email: "snbinjie@gmail.com", sd: "Mar 20, 2015, 2:00 PM", ed: "Mar 22, 2015, 5:00 PM", dd: "", image: "binjie.jpg")
        var event2 = Event(name: "Dinner at Six Feet Under", desc: "Let's catch up over dinner.", duration: "2 hours", email: "gokul2005@gmail.com", sd: "Mar 24, 2015, 6:00 PM", ed: "Mar 25, 2015, 8:00 PM", dd: "", image: "gokul.jpg")
        var event3 = Event(name: "Touch base with Binjie / Song", desc: "Updates on our MAS project", duration: "30 mins", email: "gokul2005@gmail.com", sd: "Mar 24, 2015, 6:00 PM", ed: "Mar 24, 2015, 6:00 PM", dd: "", image: "saajan.jpg")
        
        events.append(event1)
        events.append(event2)
        events.append(event3)
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
        
        return cell
    }
    
    

}

