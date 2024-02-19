//
//  APIClientTests.swift
//  NewYorkTimesTests
//
//  Created by Patricio Calderon on 19/02/24.
//

import XCTest
import Alamofire
@testable import NewYorkTimes

final class APIClientTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
    }
    
    func testGetJSONObject_Success() {
        // Given
        let expectation = self.expectation(description: "Success response from API")
        let urlString = "viewed/1.json?api-key=qTl6HA9lEk9bHwEMNSrdjRAceMnSqQEZ"
        
        // When
        APIClient.shared.getJSONObject(urlString: urlString,
                                     success: { (statusCode, jsonObject) in
                                        // Then
                                        XCTAssertEqual(statusCode, 200, "Expected status code 200 for success response")
                                        XCTAssertFalse(jsonObject.isEmpty, "Expected non-empty JSON object")
                                        expectation.fulfill()
                                     },
                                     failure: { (errorCode) in
                                        XCTFail("Unexpected failure with error code: \(errorCode)")
                                        expectation.fulfill()
                                     })
        
        // Wait for the expectation to be fulfilled within a timeout
        waitForExpectations(timeout: 10, handler: nil)
    }
    
    func testGetJSONObject_Failure() {
        // Given
        let expectation = self.expectation(description: "Failure response from API")
        let urlString = "invalidEndpoint/"
        
        // When
        APIClient.shared.getJSONObject(urlString: urlString,
                                     success: { (statusCode, jsonObject) in
                                        XCTFail("Unexpected success with status code: \(statusCode)")
                                        expectation.fulfill()
                                     },
                                     failure: { (errorCode) in
                                        // Then
                                        XCTAssertEqual(errorCode, 401, "Expected error code 404 for not found")
                                        expectation.fulfill()
                                     })
        
        // Wait for the expectation to be fulfilled within a timeout
        waitForExpectations(timeout: 10, handler: nil)
    }


    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
