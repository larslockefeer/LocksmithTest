//
//  LocksmithTestTests.swift
//  LocksmithTestTests
//
//  Created by Lars Lockefeer on 23/05/15.
//  Copyright (c) 2015. All rights reserved.
//

import UIKit
import XCTest
import Locksmith

class LocksmithTestTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testStoreAndLoadData() {
        let error = Locksmith.updateData(["key": "value"], forUserAccount: "com.locksmith.locksmithtest.userAccount", inService: "com.locksmith.locksmithtest.service")
        
        XCTAssertNil(error)
        
        let (dict, loadError) = Locksmith.loadDataForUserAccount("com.locksmith.locksmithtest.userAccount", inService: "com.locksmith.locksmithtest.service")
        
        XCTAssertNil(loadError)
        
        if let value = dict?.valueForKey("key") as? String {
            XCTAssertEqual(value, "value")
        } else {
            XCTAssertFalse(true)
        }
        
    }
    
}
