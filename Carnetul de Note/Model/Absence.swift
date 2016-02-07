//
//  Absence.swift
//  Carnetul de Note
//
//  Created by Vlad Stoica on 07/02/16.
//  Copyright © 2016 Vlad Stoica. All rights reserved.
//

import Foundation
import RealmSwift

class Absence: Object {
    dynamic var date = NSDate()
    dynamic var excused = false
    
    static func unexcusedAbsences() -> Results<Absence> {
        let realm = try! Realm()
        let predicate = NSPredicate(format: "excused = %@", false)
        return realm.objects(Absence).filter(predicate)
    }
}
