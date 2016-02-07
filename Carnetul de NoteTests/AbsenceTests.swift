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
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testDefaultExcused() {
        let absence = Absence()
        XCTAssert(absence.excused == false)
    }
    
    func testUnexecusedQuery() {
        let absence1 = Absence()
        let absence2 = Absence()
        
        let realm = try! Realm()
    
        try! realm.write {
            realm.add(absence1)
            realm.add(absence2)
        }
        var result = Absence.unexcusedAbsences()
        XCTAssert(result.count == 2)
        
        try! realm.write {
            absence1.excused = true
        }
        
        result = Absence.unexcusedAbsences()
        XCTAssert(result.count == 1)
    }
    
}
