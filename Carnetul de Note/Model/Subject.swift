//
//  Subject.swift
//  Carnetul de Note
//
//  Created by Vlad Stoica on 07/02/16.
//  Copyright © 2016 Vlad Stoica. All rights reserved.
//

import Foundation
import RealmSwift

class Subject: Object {
    dynamic var name = ""
    let grades = List<Grade>()
}
