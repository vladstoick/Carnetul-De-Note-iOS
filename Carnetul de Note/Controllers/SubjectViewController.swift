//
//  SubjectViewController.swift
//  Carnetul de Note
//
//  Created by Vlad Stoica on 12/02/16.
//  Copyright © 2016 Vlad Stoica. All rights reserved.
//

import UIKit

class SubjectViewController: UIViewController, UITableViewDelegate {
    var subject:Subject!
    
    @IBOutlet weak var finalGradeLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = subject.name
        setFinalGradeLabel()
    }
    
    func setFinalGradeLabel() {
        if (subject.finalGrade != -1) {
            self.finalGradeLabel.text = "Teza: \(subject.finalGrade)"
        } else {
            self.finalGradeLabel.text = "Teza: -"
        }
    }
    
    func createGradeAlertTextChanged(textField: UITextField) {
        if let alertController = self.presentedViewController as! UIAlertController? {
            let createAction = alertController.actions.first
            if let number = Int(textField.text!) where number >= 1 && number <= 10 {
                createAction?.enabled = true
            } else {
                createAction?.enabled = false
            }
        }
    }
    
    func showAddGradeAlert() {
        let createGradeAlert = UIAlertController(
            title: "Adauga o nota",
            message: "Introduceti nota",
            preferredStyle: .Alert
        )
        
        var gradeTextField: UITextField!
        
        createGradeAlert.addTextFieldWithConfigurationHandler {
            (textField: UITextField) -> Void in
                gradeTextField = textField
                gradeTextField.placeholder = "Nota"
                gradeTextField.keyboardType = .NumberPad
                gradeTextField.addTarget(
                    self,
                    action: "createGradeAlertTextChanged:",
                    forControlEvents: UIControlEvents.EditingChanged
            )
        }
        
        let createAction = UIAlertAction(
            title: "Adauga",
            style: .Default,
            handler: {
                (alert: UIAlertAction!) -> Void in
                let grade = Int(gradeTextField!.text!)
                self.subject.addGrade(grade!)
            }
        )
        
        createAction.enabled = false
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .Cancel, handler: nil)
        
        createGradeAlert.addAction(createAction)
        createGradeAlert.addAction(cancelAction)
        
        self.presentViewController(createGradeAlert, animated: true, completion: nil)
    }
    
    @IBAction func addButtonClicked(sender: AnyObject) {
        showAddGradeAlert()
    }
    
    func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 30;
    }
    
    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Note"
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return subject.grades.count;
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell =  tableView.dequeueReusableCellWithIdentifier("gradeCell", forIndexPath: indexPath)
        
        cell.textLabel!.text = String(subject.grades[indexPath.row].grade);
        
        return cell
    }
    
}