//
//  Grade.swift
//  Carnetul de Note
//
//  Created by Vlad Stoica on 07/02/16.
//  Copyright © 2016 Vlad Stoica. All rights reserved.
//

import Foundation
import RealmSwift

class Grade: Object {
    dynamic var date = NSDate()
    dynamic var grade = 10
}
