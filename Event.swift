//
//  Event.swift
//  Zazu Screens
//
//  Created by Gokul Raghuraman on 3/26/15.
//  Copyright (c) 2015 Zazu Labs. All rights reserved.
//

import Foundation

class Event
{
    var name: String?
    var description: String?
    var duration: String?
    var creator_email: String?
    var creator_name: String?
    var attendees: String?
    var start_date: String?
    var end_date: String?
    var decide_by_date: String?
    var status: String?
    var image: String?

    init(name: String, desc: String, duration: String, email: String, creator_name: String, attendees: String, sd: String, ed: String, dd: String, status: String, image: String)
    {
        self.name = name
        self.description = desc
        self.duration = duration
        self.creator_email = email
        self.creator_name = creator_name
        self.attendees = attendees
        self.start_date = sd
        self.end_date = ed
        self.decide_by_date = dd
        self.status = status
        self.image = image
    }
    
}