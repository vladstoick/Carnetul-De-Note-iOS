//
//  SetupViewController.swift
//  Carnetul de Note
//
//  Created by Vlad Stoica on 07/02/16.
//  Copyright © 2016 Vlad Stoica. All rights reserved.
//

import UIKit

class SetupViewController: UIViewController, UITableViewDelegate {
    var selectedMateriiRows = Array<NSIndexPath>()
    let defaultMaterii = ["Română",
        "Franceză",
        "Engleză",
        "Germană",
        "Matematică",
        "Fizică",
        "Biologie",
        "Chimie",
        "Informatică",
        "TIC",
        "Istorie",
        "Geografie",
        "Logică",
        "Psihologie",
        "Filozofie",
        "Muzică",
        "Desen",
        "Sport",
        "Religie",
        "Economie",
        "Educație Antreprenorială"]
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return defaultMaterii.count;
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        // Note:  Be sure to replace the argument to dequeueReusableCellWithIdentifier with the actual identifier string!
        let cell = tableView.dequeueReusableCellWithIdentifier("setupCell", forIndexPath: indexPath)
        cell.accessoryType = getAccesoryType(indexPath)
        cell.textLabel!.text = defaultMaterii[indexPath.row]
        return cell
    }

    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let cell = tableView.cellForRowAtIndexPath(indexPath)
        checkRow(indexPath)
        cell?.accessoryType = getAccesoryType(indexPath)
    }
    
    func checkRow(indexPath: NSIndexPath) {
        if let index = selectedMateriiRows.indexOf(indexPath) {
            selectedMateriiRows.removeAtIndex(index)
        } else {
            selectedMateriiRows.append(indexPath)
        }
    }
    
    func getAccesoryType(indexPath: NSIndexPath) -> UITableViewCellAccessoryType {
        return selectedMateriiRows.contains(indexPath) ?
            UITableViewCellAccessoryType.Checkmark :
            UITableViewCellAccessoryType.None;
    }
    
}
