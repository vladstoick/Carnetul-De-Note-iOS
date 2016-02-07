//
//  SubjectTests.swift
//  Carnetul de Note
//
//  Created by Vlad Stoica on 07/02/16.
//  Copyright © 2016 Vlad Stoica. All rights reserved.
//

import XCTest
import RealmSwift
@testable import Carnetul_de_Note
class SubjectTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        Realm.Configuration.defaultConfiguration.inMemoryIdentifier = self.name
    }
    
    func testCreateSubjects() {
        let subjectsName = ["Română", "Franceză", "Engleză", "Germană"]
        Subject.createSubjects(subjectsName)
        let realm = try! Realm()
        let results = realm.objects(Subject)
        XCTAssertEqual(results.count, 4)
        for subject in results {
            XCTAssert(subjectsName.contains(subject.name), "\(subject.name) isn't in the initial array")
        }
    }
    
    func testAverage() {
        let grades = [Grade(value: ["grade": 10]), Grade(value: ["grade": 9])]
        let subject = Subject(value: [name: "Test", "grades": grades])
        let realm = try! Realm()
        try! realm.write {
            realm.add(subject)
            XCTAssertEqual(subject.average(), 10)
            subject.grades.append(Grade(value: ["grade": 9]))
            XCTAssertEqual(subject.average(), 9)
            subject.finalGrade = 10
            XCTAssertEqual(subject.average(), 10)
        }

    }
    
}
