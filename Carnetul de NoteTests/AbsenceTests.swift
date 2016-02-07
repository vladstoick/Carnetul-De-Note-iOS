//
//  AbsenceTests.swift
//  Carnetul de Note
//
//  Created by Vlad Stoica on 07/02/16.
//  Copyright © 2016 Vlad Stoica. All rights reserved.
//

import XCTest
import RealmSwift
@testable import Carnetul_de_Note

class AbsenceTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        Realm.Configuration.defaultConfiguration.inMemoryIdentifier = self.name
    }
        
    func testDefaultExcused() {
        let absence = Absence()
        XCTAssertEqual(absence.excused, false)
    }
    
    func testUnexecusedQuery() {
        let absence1 = Absence()
        let absence2 = Absence()
        
        let realm = try! Realm()
    
        try! realm.write {
            realm.add(absence1)
            realm.add(absence2)
        }
        
        var results = Absence.unexcusedAbsences()
        XCTAssertEqual(results.count, 2)
        
        try! realm.write {
            absence1.excused = true
        }
        
        results = Absence.unexcusedAbsences()
        XCTAssertEqual(results.count, 1)
    }
    
}
