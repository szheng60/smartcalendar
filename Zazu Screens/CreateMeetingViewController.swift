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
    
    //Data passed from contacts screen
    var dataPassed: Array<String>!
    
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
    }
    
    @IBAction func cancelButtonAction(sender: AnyObject)
    {
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
        let cell = inviteesTableView.dequeueReusableCellWithIdentifier("InviteesCell") as UITableViewCell
        cell.textLabel?.text = dataPassed[indexPath.row]
        return cell
    }

    
    

}
