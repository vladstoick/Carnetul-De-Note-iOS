//
//  SubjectCell.swift
//  Carnetul de Note
//
//  Created by Vlad Stoica on 16/02/16.
//  Copyright © 2016 Vlad Stoica. All rights reserved.
//

import UIKit

class SubjectCell: UITableViewCell {
    @IBOutlet weak var gradesLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var averageLabel: UILabel!

    func updateCell(subject: Subject) {
        titleLabel.text = subject.name;
        
        averageLabel.text = "\(subject.average)";
        
        if subject.grades.count > 0 {
            gradesLabel.hidden = false
            gradesLabel.text = subject.gradeListDescription
        } else {
            gradesLabel.hidden = true
        }
    }
}
