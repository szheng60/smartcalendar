//
//  DetailEventViewController.swift
//  Zazu Screens
//
//  Created by Gokul Raghuraman on 3/26/15.
//  Copyright (c) 2015 Zazu Labs. All rights reserved.
//

import UIKit
import EventKit

class DetailEventViewController: UIViewController
{
    var event: Event!
    
    var appDelegate: AppDelegate?
    //var incrementTime = 30 //minutes
    //var du = DateUtils()
    var startOnDateTime:NSDate!
    var endOnDateTime:NSDate!
    var timeSlotHelper = TimeSlotHelper()

    @IBOutlet weak var meetingNameTextField: UILabel!
    @IBOutlet weak var creatorLabel: UILabel!
    @IBOutlet weak var creatorEmailLabel: UILabel!
    @IBOutlet weak var creatorImageView: UIImageView!

    @IBOutlet weak var fromDate: UILabel!
    @IBOutlet weak var toDate: UILabel!
    @IBOutlet weak var decideByDateLabel: UILabel!
    @IBOutlet weak var participantsTextView: UITextView!
    @IBOutlet weak var meetingDescriptionTextView: UITextView!
    @IBOutlet weak var acceptButton: UIButton!
    
    
    override func viewDidLoad()
    {
        if event.eventID == 0 {
            acceptButton.enabled = false
        }
        appDelegate = UIApplication.sharedApplication().delegate as? AppDelegate
        
        meetingNameTextField.text = event.name
        meetingDescriptionTextView.text = event.description
        creatorLabel.text = "Created by " + event.creator_name!
        creatorEmailLabel.text = "(" + event.creator_email! + ")"
        //creatorImageView.image = UIImage(named: event.image!)
        fromDate.text = "From\t" + NSDate(fromString: event.start_date!, format: .ISO8601).toString(format: .Custom("dd MMM yyyy HH:mm"))
        toDate.text = "To\t\t" + NSDate(fromString: event.end_date!, format: .ISO8601).toString(format: .Custom("dd MMM yyyy HH:mm"))
        decideByDateLabel.text = NSDate(fromString: event.decide_by_date!, format: .ISO8601).toString(format: .Custom("dd MMM yyyy HH:mm"))
        participantsTextView.text = event.attendees
        
    }
    
    @IBAction func backButton(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }

    @IBAction func acceptButton(sender: AnyObject) {
        if event.eventID != 0
        {
        var eventDuration = event.duration!.toInt()
        //var eventDuration = 120
        var timeSlots = Array<NSDate>()
        
        startOnDateTime = NSDate(fromString: event.start_date!, format: .ISO8601)
        endOnDateTime = NSDate(fromString: event.end_date!, format: .ISO8601)
        
        startOnDateTime = startOnDateTime.dateBySubtractingSeconds(startOnDateTime.seconds())
        endOnDateTime = endOnDateTime.dateBySubtractingSeconds(endOnDateTime.seconds())
        
        appDelegate!.readEvents(startOnDateTime.toString(format: .ISO8601), endTime: endOnDateTime.toString(format: .ISO8601))
        
        startOnDateTime = startOnDateTime.dateBySubtractingHours(timeDifference)
        endOnDateTime = endOnDateTime.dateBySubtractingHours(timeDifference)
        
        var adjustedCalendarEvents = timeSlotHelper.adjustment()//adjustment()

        while startOnDateTime.compare(endOnDateTime) == NSComparisonResult.OrderedAscending {
            timeSlots.append(startOnDateTime)
            let temp = startOnDateTime.dateByAddingMinutes(timeSlotInterval)
            startOnDateTime = temp
        }
        let availableTimeSlots = timeSlotHelper.generateAvalableTimeSlots(timeSlots, events: adjustedCalendarEvents, eventDuration: eventDuration!)
        println(availableTimeSlots)
        }
    }
}

