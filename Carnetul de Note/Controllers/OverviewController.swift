//
//  OverviewController.swift
//  Carnetul de Note
//
//  Created by Vlad Stoica on 16/02/16.
//  Copyright © 2016 Vlad Stoica. All rights reserved.
//

import UIKit;

class OverviewController: UIViewController {
    
    @IBOutlet weak var overallAverageLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    
    }
    
    func updateUI(){
        overallAverageLabel.text = NSNumberFormatter.localizedStringFromNumber(
            Subject.allSubjectsAverage(),
            numberStyle: NSNumberFormatterStyle.DecimalStyle
        )
    }
}