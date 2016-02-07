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
    dynamic let teza = -1
    let grades = List<Grade>()
    
    static func createSubjects(names: Array<String>) {
        
        let realm = try! Realm()
        
        try! realm.write {
            for name in names {
                let subject = Subject()
                subject.name = name
                realm.add(subject)
            }
        }
    }
}
