//
//  DetailEventViewController.swift
//  Zazu Screens
//
//  Created by Gokul Raghuraman on 3/26/15.
//  Copyright (c) 2015 Zazu Labs. All rights reserved.
//

import UIKit

class DetailEventViewController: UIViewController
{
    
    var event: Event!
    
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
        println(event.name)
        meetingNameTextField.text = event.name
        meetingDescriptionTextView.text = event.description
        creatorLabel.text = "Created by " + event.creator_name!
        creatorEmailLabel.text = "(" + event.creator_email! + ")"
        creatorImageView.image = UIImage(named: event.image!)
        fromDate.text = "From\t" + event.start_date!
        toDate.text = "To\t\t" + event.end_date!
        decideByDateLabel.text = event.decide_by_date!
        participantsTextView.text = event.attendees
        
    }

}
