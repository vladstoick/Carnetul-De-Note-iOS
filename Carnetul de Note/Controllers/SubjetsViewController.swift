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
    var subjects:Results<Subject>?;
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        subjects = Subject.allSubjects()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {

    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return subjects!.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        // Note:  Be sure to replace the argument to dequeueReusableCellWithIdentifier with the actual identifier string!
        let cell = tableView.dequeueReusableCellWithIdentifier("subjectsCell", forIndexPath: indexPath)
        cell.textLabel!.text = subjects![indexPath.row].name
        return cell
    }
}
