//
//  InternalSplitClientStub.swift
//  SplitTests
//
//  Created by Javier L. Avrudsky on 27/03/2019.
//  Copyright © 2019 Split. All rights reserved.
//

import Foundation
@testable import Split

class InternalSplitClientStub: InternalSplitClient {

    var splitFetcher: SplitFetcher?
    var mySegmentsFetcher: MySegmentsFetcher?
    
    init(splitFetcher: SplitFetcher, mySegmentsFetcher: MySegmentsFetcher) {
        self.splitFetcher = splitFetcher
        self.mySegmentsFetcher = mySegmentsFetcher
    }
    
    func getTreatment(_ split: String, attributes: [String : Any]?) -> String {
        return ""
    }
    
    func getTreatment(_ split: String) -> String {
        return ""
    }
    
    func getTreatments(splits: [String], attributes: [String : Any]?) -> [String : String] {
        return ["":""]
    }
    
    func getTreatmentWithConfig(_ split: String) -> SplitResult {
        return SplitResult(treatment: SplitConstants.CONTROL)
    }
    
    func getTreatmentWithConfig(_ split: String, attributes: [String : Any]?) -> SplitResult {
        return getTreatmentWithConfig(split)
    }
    
    func getTreatmentsWithConfig(splits: [String], attributes: [String : Any]?) -> [String : SplitResult] {
        return ["": SplitResult(treatment: SplitConstants.CONTROL)]
    }
    
    func on(event: SplitEvent, execute action: @escaping SplitAction) {
    
    }
    
    func track(trafficType: String, eventType: String) -> Bool {
        return true
    }
    
    func track(trafficType: String, eventType: String, value: Double) -> Bool {
        return true
    }
    
    func track(eventType: String) -> Bool {
        return true
    }
    
    func track(eventType: String, value: Double) -> Bool {
        return true
    }
    
    func track(trafficType: String, eventType: String, properties: [String: Any]?) -> Bool {
        return true
    }
    
    func track(trafficType: String, eventType: String, value: Double, properties: [String: Any]?) -> Bool {
        return true
    }
    
    func track(eventType: String, properties: [String: Any]?) -> Bool {
        return true
    }
    
    func track(eventType: String, value: Double, properties: [String: Any]?) -> Bool {
        return true
    }
    
}
