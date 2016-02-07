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
    dynamic var finalGrade = -1
    let grades = List<Grade>()
    
    static func createSubjects(names: Array<String>) {
        let realm = try! Realm()
        try! realm.write {
            for name in names {
                realm.add(Subject(value: ["name": name]))
            }
        }
    }
    
    func average() -> Int {
        let sum = grades.sum("grade") as Int
        let gradesAverage : Double = Double(sum) / Double(grades.count)
        if finalGrade == -1 {
            return Int(round(gradesAverage))
        } else {
            let value = Double(gradesAverage * 3 + Double(finalGrade)) / 4
            return Int(round(value))
        }
    }
}
