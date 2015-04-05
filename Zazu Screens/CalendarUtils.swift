//
//  CalendarUtils.swift
//  Zazu Screens
//
//  Created by song on 4/3/15.
//  Copyright (c) 2015 Zazu Labs. All rights reserved.
//

import Foundation
import EventKit
import UIKit


struct calendarEvent {
    var event_title:String?
    var event_start_date:NSDate?
    var event_end_date:NSDate?
    
    init(title: String, start_date: NSDate, end_date: NSDate) {
        event_title = title
        event_start_date = start_date
        event_end_date = end_date
    }
}