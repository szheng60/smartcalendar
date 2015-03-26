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
    var start_date: String?
    var end_date: String?
    var decide_by_date: String?
    var image: String?

    init(name: String, desc: String, duration: String, email: String, sd: String, ed: String, dd: String, image: String)
    {
        self.name = name
        self.description = desc
        self.duration = duration
        self.creator_email = email
        self.start_date = sd
        self.end_date = ed
        self.decide_by_date = dd
        self.image = image
    }
    
}