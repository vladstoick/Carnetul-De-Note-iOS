//
//  SubjetsViewController.swift
//  Carnetul de Note
//
//  Created by Vlad Stoica on 12/02/16.
//  Copyright © 2016 Vlad Stoica. All rights reserved.
//

import UIKit
import RealmSwift

class SubjectsViewController: UIViewController, UITableViewDelegate {
    var subjects:Results<Subject> = {
        return Subject.allSubjects();
    }()
    
    @IBOutlet var tableView: UITableView!
    var token:NotificationToken?
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)

        subjects = Subject.allSubjects()
        tableView.estimatedRowHeight = 85.0
        tableView.rowHeight = UITableViewAutomaticDimension
    }
    
    override func viewDidLoad() {
        let realm = try! Realm()
        token = realm.addNotificationBlock { notification, realm in
            self.subjects = Subject.allSubjects();
            self.tableView.reloadData()
        }
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "showSubject" {
            let indexPath = tableView.indexPathForSelectedRow!
            tableView.deselectRowAtIndexPath(indexPath, animated: true)
            let selectedSubject = subjects[indexPath.row]
            if let destinationVC = segue.destinationViewController as? SubjectViewController {
                destinationVC.subject = selectedSubject
            }
        }
    }
    
    func presentCreateSubjectAlert() {
        let createSubjectAlert = UIAlertController(
            title: "Adauga materie",
            message: "Introduceti numele materiei",
            preferredStyle: .Alert
        )
        
        var nameTextField: UITextField!
        
        createSubjectAlert.addTextFieldWithConfigurationHandler { (textField: UITextField) -> Void in
            nameTextField = textField
            nameTextField.placeholder = "Numele materiei"
            
        }
        
        let createAction = UIAlertAction(
            title: "Adauga",
            style: .Default,
            handler: {
                (alert: UIAlertAction!) -> Void in
                Subject.createSubject(nameTextField.text!)
            }
        )
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .Cancel, handler: nil)

        createSubjectAlert.addAction(createAction)
        createSubjectAlert.addAction(cancelAction)
        
        self.presentViewController(createSubjectAlert, animated: true, completion: nil)
    }
    
    @IBAction func addButtonClicked(sender: AnyObject) {
        self.presentCreateSubjectAlert()
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return subjects.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell =  tableView.dequeueReusableCellWithIdentifier("subjectsCell", forIndexPath: indexPath) as! SubjectCell
        
        let subject = subjects[indexPath.row]
        cell.titleLabel.text = subject.name
        
        if subject.grades.count > 0 {
            cell.gradesLabel.hidden = false
            cell.gradesLabel.text = subject.gradeListDescription
        } else {
            cell.gradesLabel.hidden = true
        }
        
        cell.averageLabel.text = String(subject.average)
        return cell
    }
}
