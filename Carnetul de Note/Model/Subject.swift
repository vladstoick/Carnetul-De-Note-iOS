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
    
    static func allSubjects() -> Results<Subject>{
        let realm = try! Realm()
        return realm.objects(Subject)
    }
    
    static func allSubjectsAverage() -> Double {
        let realm = try! Realm()
        let results = realm.objects(Subject)
        var sum = 0
        for subject in results { sum += subject.average() }
        return Double(sum) / Double(results.count)
    }
    
    func average() -> Int {
        let sum = grades.sum("grade") as Int
        if sum == 0 {
            return finalGrade == -1 ? 10 : finalGrade
        } else {
            let gradesAverage : Double = Double(sum) / Double(grades.count)
            if finalGrade == -1 {
                return Int(round(gradesAverage))
            } else {
                let value = Double(gradesAverage * 3 + Double(finalGrade)) / 4
                return Int(round(value))
            }
        }
    }
}
