//
//  SynchronizedDictionaryWrapper.swift
//  Split
//
//  Created by Javier on 17/09/2018.
//  Copyright © 2018 Split. All rights reserved.
//

import Foundation

class SingleDictionaryWrapper<K: Hashable,T> {
    
    private var queue: DispatchQueue
    private var items: [K:T]
    
    var all: [K:T] {
        var allItems: [K:T]? = nil
        queue.sync {
            allItems = items
        }
        return allItems!
    }
    
    var count: Int {
        var count: Int = 0
        queue.sync {
            count = items.count
        }
        return count
    }
    
    init(){
        queue = DispatchQueue(label: NSUUID().uuidString, attributes: .concurrent)
        items = [K:T]()
    }
    
    func value(forKey key: K) -> T? {
        var value: T? = nil
        queue.sync {
            value = items[key]
        }
        return value
    }
    
    func removeValue(forKeys keys: Dictionary<K, T>.Keys) {
        queue.async(flags: .barrier) {
            for key in keys {
                self.items.removeValue(forKey: key)
            }
        }
    }
    
    func removeAll() {
        queue.async(flags: .barrier) {
            self.items.removeAll()
        }
    }
    
    func setValue(_ value: T, toKey key: K) {
        queue.async(flags: .barrier) {
            self.items[key] = value
        }
    }
}