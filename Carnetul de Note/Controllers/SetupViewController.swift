//
//  SetupViewController.swift
//  Carnetul de Note
//
//  Created by Vlad Stoica on 07/02/16.
//  Copyright © 2016 Vlad Stoica. All rights reserved.
//

import UIKit

class SetupViewController: UIViewController, UITableViewDelegate {
    var selectedSubjectRows = Array<NSIndexPath>()
    let defaultSubjects = [
        "Română", "Franceză", "Engleză", "Germană",
        "Matematică", "Fizică", "Biologie", "Chimie",
        "Informatică", "TIC", "Istorie", "Geografie",
        "Logică", "Psihologie", "Filozofie", "Muzică",
        "Desen", "Sport", "Religie","Economie",
        "Educație Antreprenorială"]
    
    override func viewWillAppear(animated: Bool) {
        let userDefaults = NSUserDefaults.standardUserDefaults()

        if userDefaults.boolForKey("didConfig") {
            navigateToMainApp(false)
        }
        
    }
    
    func navigateToMainApp(animated: Bool) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewControllerWithIdentifier("mainApp")
        self.parentViewController!.presentViewController(vc, animated: animated, completion: nil)
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return defaultSubjects.count;
    }
    
    @IBAction func nextButtonPressed(sender: AnyObject) {
        Subject.createSubjects(selectedSubjectRows.map({defaultSubjects[$0.row]}))
        
        let userDefaults = NSUserDefaults.standardUserDefaults()
        userDefaults.setBool(true, forKey: "didConfig")
        navigateToMainApp(true)
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        // Note:  Be sure to replace the argument to dequeueReusableCellWithIdentifier with the actual identifier string!
        let cell = tableView.dequeueReusableCellWithIdentifier("setupCell", forIndexPath: indexPath)
        cell.accessoryType = getAccesoryType(indexPath)
        cell.textLabel!.text = defaultSubjects[indexPath.row]
        return cell
    }

    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let cell = tableView.cellForRowAtIndexPath(indexPath)
        checkRow(indexPath)
        cell?.accessoryType = getAccesoryType(indexPath)
    }
    
    func checkRow(indexPath: NSIndexPath) {
        if let index = selectedSubjectRows.indexOf(indexPath) {
            selectedSubjectRows.removeAtIndex(index)
        } else {
            selectedSubjectRows.append(indexPath)
        }
    }
    
    func getAccesoryType(indexPath: NSIndexPath) -> UITableViewCellAccessoryType {
        return selectedSubjectRows.contains(indexPath) ?
            UITableViewCellAccessoryType.Checkmark :
            UITableViewCellAccessoryType.None;
    }
    
}
