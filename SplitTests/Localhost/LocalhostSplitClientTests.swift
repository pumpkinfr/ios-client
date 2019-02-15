//
//  LocalhostSplitClientTests.swift
//  SplitTests
//
//  Created by Javier L. Avrudsky on 15/02/2019.
//  Copyright © 2019 Split. All rights reserved.
//

import XCTest
@testable import Split


class LocalhostSplitClientTests: XCTestCase {

    var storage: FileStorageProtocol!
    var fetcher: TreatmentFetcher!
    let fileName = "localhost.splits"
    
    override func setUp() {
        let fileContent = """
                            s1 t1\n
                            s2 t2\n
                            s3 t3
                            """
        storage = FileStorageStub()
        storage.write(fileName: fileName, content: fileContent)
        var config = LocalhostSplitFetcherConfig()
        config.refreshInterval = 0
        fetcher = LocalhostTreatmentFetcher(storageManager: storage, config: config)
    }
    
    override func tearDown() {
    }
    
    func testInitial() {
        let fileContent = """
                            s1 t1\n
                            s2 t2\n
                            s3 t3
                            """
        storage.write(fileName: fileName, content: fileContent)
        fetcher.forceRefresh()
        XCTAssertEqual(fetcher.fetchAll()?.count, 3)
        for i in 1...3 {
            XCTAssertEqual(fetcher.fetch(splitName: "s\(i)"), "t\(i)")
        }
    }
    
    func testFileUpdate() {
        let fileContent = """
                            s5 t5\n
                            s6 t6\n
                            s7 t7
                            """
        storage.write(fileName: fileName, content: fileContent)
        fetcher.forceRefresh()
        XCTAssertEqual(fetcher.fetchAll()?.count, 3)
        for i in 5...7 {
            XCTAssertEqual(fetcher.fetch(splitName: "s\(i)"), "t\(i)")
        }
    }
    
    func testFileUpdate2() {
        let fileContent = """
                            s5 t5\n
                            s6 t6\n
                            s7 t7\n
                            s8 t8
                            """
        storage.write(fileName: fileName, content: fileContent)
        fetcher.forceRefresh()
        XCTAssertEqual(fetcher.fetchAll()?.count, 4)
        for i in 5...8 {
            XCTAssertEqual(fetcher.fetch(splitName: "s\(i)"), "t\(i)")
        }
    }


}