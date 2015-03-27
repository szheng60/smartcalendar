//
//  AddInviteesViewController.swift
//  Zazu Screens
//
//  Created by Gokul Raghuraman on 3/26/15.
//  Copyright (c) 2015 Zazu Labs. All rights reserved.
//

import UIKit

class AddInviteesViewController: UIViewController, UITableViewDelegate, UITableViewDataSource
{
    @IBOutlet weak var contactsTableView: UITableView!
    
    var contacts = ["Adam Smith", "Apoorva Verkelar", "Binjie Sun", "David Cheng", "George P. Burdell", "Ian Lee", "John Doe", "Robert Hunt", "Rohan Gupta", "Saajan Shridhar", "Song Zheng", "Travis Hoult"]
    
    var contactSelections: [Bool] = Array<Bool>()
    var invitees:[String] = []
    
    //Meeting data from previous screen
    var meetingName: String?
    var meetingDescription: String?
    var fromDate: String?
    var toDate: String?
    var decideByDate: String?
    var duration: String?
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        contactsTableView.delegate = self
        contactsTableView.dataSource = self
        
        for contact in contacts
        {
            contactSelections.append(false)
        }
        
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int
    {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return contacts.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCellWithIdentifier("ContactCell") as UITableViewCell
        //cell.accessoryType = .Checkmark
        cell.textLabel?.text = contacts[indexPath.row]
        return cell
    }
    
    //TO-DO: Implement contact search-and-select
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath)
    {
        tableView.deselectRowAtIndexPath(indexPath, animated: false)
        
        let cell = tableView.cellForRowAtIndexPath(indexPath)
        if cell?.accessoryType == UITableViewCellAccessoryType.Checkmark
        {
            cell?.accessoryType = UITableViewCellAccessoryType.None
            contactSelections[indexPath.row] = false
        }
        else
        {
            cell?.accessoryType = UITableViewCellAccessoryType.Checkmark
            contactSelections[indexPath.row] = true
        }
    }
    
    @IBAction func addInviteesAction(sender: AnyObject)
    {
        var navigationController = self.navigationController! as UINavigationController
        var createMeetingViewController = navigationController.viewControllers[0] as CreateMeetingViewController
        
        for var index = 0; index < contacts.count; ++index
        {
            if contactSelections[index] == true
            {
                invitees.append(contacts[index])
            }
            
        }
        createMeetingViewController.dataPassed = invitees
        
        self.navigationController?.popViewControllerAnimated(true)
    }
    
}
