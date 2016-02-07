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
        XCTAssert(results.count == 4)
        for subject in results {
            XCTAssert(subjectsName.contains(subject.name))
        }
    }
    
}
