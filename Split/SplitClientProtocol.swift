//
//  SplitClient.swift
//  Pods
//
//  Created by Brian Sztamfater on 18/9/17.
//
//

import Foundation

public protocol SplitClientProtocol {
    
    func getTreatment(_ split: String, attributes:[String:Any]?) -> String

    func on(_ event:SplitEvent, _ task:SplitEventTask) -> Void
}

public extension SplitClientProtocol {
    
    func getTreatment(_ split: String, attributes:[String:Any]? = nil) -> String {
        return getTreatment(split, attributes: attributes)
    }
    
}
