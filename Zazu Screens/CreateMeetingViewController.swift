//
//  CreateMeetingViewController.swift
//  Zazu Screens
//
//  Created by Gokul Raghuraman on 3/26/15.
//  Copyright (c) 2015 Zazu Labs. All rights reserved.
//

import UIKit

class CreateMeetingViewController: UIViewController, UITextFieldDelegate, UITableViewDelegate, UITableViewDataSource
{
    
    //Invitee data passed from contacts screen
    var dataPassed: Array<String>!
    
    //Meeting data passed to contacts screen
    var meetingName: String?
    var meetingDescription: String?
    var fromDate: String?
    var toDate: String?
    var decideByDate: String?
    var duration: String?
    
    @IBOutlet weak var meetingNameTextField: UITextField!
    @IBOutlet weak var meetingDescriptionTextView: UITextView!
    @IBOutlet weak var fromDateTextField: UITextField!
    @IBOutlet weak var toDateTextField: UITextField!
    @IBOutlet weak var decideByDateTextField: UITextField!
    @IBOutlet weak var durationTextField: UITextField!
    @IBOutlet weak var inviteesTableView: UITableView!
    
    
    var fromDatePopDatePicker: PopDatePicker?
    var toDatePopDatePicker: PopDatePicker?
    var decideByDatePopDatePicker: PopDatePicker?
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        var tap:UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: "dismissKeyboard")
        view.addGestureRecognizer(tap)
        
        fromDatePopDatePicker = PopDatePicker(forTextField: fromDateTextField)
        toDatePopDatePicker = PopDatePicker(forTextField: toDateTextField)
        decideByDatePopDatePicker = PopDatePicker(forTextField: decideByDateTextField)
        
        //Assign delegates and dataSource
        fromDateTextField.delegate = self
        toDateTextField.delegate = self
        decideByDateTextField.delegate = self
        inviteesTableView.delegate = self
        inviteesTableView.dataSource = self
        
        //Important: if no data passed, set to empty list.
        if dataPassed == nil
        {
            dataPassed = []
        }
        
        //Re-populate text fields with data saved from last segue to contacts screen
        refillTextFields()
    }
    
    @IBAction func cancelButtonAction(sender: AnyObject)
    {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    
    @IBAction func createMeetingAction(sender: AnyObject)
    {
        meetingName = meetingNameTextField.text
        //TO-DO: Add popup asking for meeting name
        if meetingName == nil
        {
            return
        }
        
        meetingDescription = meetingDescriptionTextView.text
        fromDate = fromDateTextField.text
        toDate = toDateTextField.text
        decideByDate = decideByDateTextField.text
        duration = durationTextField.text
        
        
        //Go through the participants array and convert to string
        
        
        var participants:String = ", ".join(dataPassed)
        
        //var newEvent: Event = Event(name: meetingName!, desc: meetingDescription!, duration: duration!, email: "gokul2005@gmail.com", attendees: participants, sd: fromDate!, ed: toDate!, dd: decideByDate!, status: "new", image: "gokul.jpg")
        
        var navigationController = self.navigationController! as UINavigationController
        //var viewControllerCount = navigationController.viewControllers.count
        //println(viewControllerCount)
        var eventsViewController = navigationController.presentingViewController as ViewController
        
        eventsViewController.newEvent = Event(name: meetingName!, desc: meetingDescription!, duration: duration!, email: "gokul2005@gmail.com", creator_name: "Gokul Raghuraman",attendees: participants, sd: fromDate!, ed: toDate!, dd: decideByDate!, status: "new", image: "gokul.jpg")
        
        eventsViewController.loadEvents()
        
        println("Pushing new event")
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    // For resigning text fields as first responders
    func resignTextFields()
    {
        fromDateTextField.resignFirstResponder()
        toDateTextField.resignFirstResponder()
        decideByDateTextField.resignFirstResponder()
    }
    
    //Dismiss keyboard if screen tapped
    func dismissKeyboard()
    {
        view.endEditing(true)
    }
    
    func refillTextFields()
    {
        if meetingName != nil
        {
            meetingNameTextField.text = meetingName
        }
        if meetingDescription != nil
        {
            meetingDescriptionTextView.text = meetingDescription
        }
        if fromDate != nil
        {
            fromDateTextField.text = fromDate
        }
        if toDate != nil
        {
            toDateTextField.text = toDate
        }
        if decideByDate != nil
        {
            decideByDateTextField.text = decideByDate
        }
        if duration != nil
        {
            durationTextField.text = duration
        }
    }
    
    func textFieldShouldBeginEditing(textField: UITextField) -> Bool
    {
        
        //Resign date text fields as first responders
        resignTextFields()
        
        //Pop-up the date picker for each text field
        if textField == fromDateTextField
        {
            println("HERE!")
            let formatter = NSDateFormatter()
            formatter.dateStyle = .MediumStyle
            formatter.timeStyle = .MediumStyle
            let initDate = formatter.dateFromString(fromDateTextField.text)
            
            fromDatePopDatePicker!.pick(self, initDate:initDate, dataChanged: { (newDate : NSDate, forTextField : UITextField) -> () in
                
                // here we don't use self (no retain cycle)
                //forTextField.text = newDate.ToDateMediumString()
                forTextField.text = formatter.stringFromDate(newDate)
                
            })
            return false
        }
            
        else if textField == toDateTextField
        {
            let formatter = NSDateFormatter()
            formatter.dateStyle = .MediumStyle
            formatter.timeStyle = .MediumStyle
            let initDate = formatter.dateFromString(toDateTextField.text)
            
            toDatePopDatePicker!.pick(self, initDate:initDate, dataChanged: { (newDate : NSDate, forTextField : UITextField) -> () in
                
                // here we don't use self (no retain cycle)
                //forTextField.text = newDate.ToDateMediumString()
                forTextField.text = formatter.stringFromDate(newDate)
            })
            return false
        }
            
        else if textField == decideByDateTextField
        {
            let formatter = NSDateFormatter()
            formatter.dateStyle = .MediumStyle
            formatter.timeStyle = .MediumStyle
            let initDate = formatter.dateFromString(decideByDateTextField.text)
            
            decideByDatePopDatePicker!.pick(self, initDate:initDate, dataChanged: { (newDate : NSDate, forTextField : UITextField) -> () in
                
                // here we don't use self (no retain cycle)
                //forTextField.text = newDate.ToDateMediumString()
                forTextField.text = formatter.stringFromDate(newDate)
                println(formatter.stringFromDate(newDate))
                
            })
            return false
        }
        return true
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int
    {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return dataPassed.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        let cell = inviteesTableView.dequeueReusableCellWithIdentifier("InviteeCell") as UITableViewCell
        cell.textLabel?.text = dataPassed[indexPath.row]
        return cell
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?)
    {
        if segue.identifier == "AddInvitees"
        {
            var addInviteesViewController = segue.destinationViewController as AddInviteesViewController
            addInviteesViewController.meetingName = meetingName
            addInviteesViewController.meetingDescription = meetingDescription
            addInviteesViewController.fromDate = fromDate
            addInviteesViewController.toDate = toDate
            addInviteesViewController.decideByDate = decideByDate
            addInviteesViewController.duration = duration
        }
    }

    
    

}
