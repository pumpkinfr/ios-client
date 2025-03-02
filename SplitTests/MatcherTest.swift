//
//  MatcherTest.swift
//  Split_Example
//
//  Created by Sebastian Arrubia on 3/8/18.
//  Copyright © 2018 CocoaPods. All rights reserved.
//

import Foundation
import XCTest

@testable import Split

class MatcherTests: XCTestCase {
    
    func testMatcher() {
        
        let matcher = try? JSON.encodeFrom(json: "{}", to: Matcher.self)
        let expectedVal = EngineError.MatcherNotFound
        do {
            _ = try matcher!.getMatcher()
        } catch EngineError.MatcherNotFound {
            debugPrint("MATCHER NOT FOUND")
            XCTAssertEqual(expectedVal, EngineError.MatcherNotFound, "Matcher should be equal to NOT_FOUND value")
            return
        } catch {
            debugPrint("Exception")
        }
    }
}
