//
//  ImageDataServiceTests.swift
//  NewYorkTimesTests
//
//  Created by Patricio Calderon on 19/02/24.
//

import XCTest
@testable import NewYorkTimes

final class ImageDataServiceTests: XCTestCase {

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

    func testLoadImageFrom_Success() {
            // Given
            let imageHandler = ImageHandler.shared
            let urlString = "https://static01.nyt.com/images/2024/02/15/multimedia/15nat-georgia-courtroom-scene01-hfck/01-hfck-mediumThreeByTwo440.jpg"
            let expectation = self.expectation(description: "Success response from image URL")
            
            // When
            imageHandler.loadImageFrom(urlString: urlString, success: { (image) in
                // Then
                XCTAssertNotNil(image, "Expected non-nil image")
                expectation.fulfill()
            }, failure: { (image) in
                XCTFail("Unexpected failure to load image")
                expectation.fulfill()
            })
            
            // Wait for the expectation to be fulfilled within a timeout
            waitForExpectations(timeout: 10, handler: nil)
        }
        
        func testLoadImageFrom_Failure() {
            // Given
            let imageHandler = ImageHandler.shared
            let urlString = "https://invalidurl"
            let expectation = self.expectation(description: "Failure response from invalid URL")
            
            // When
            imageHandler.loadImageFrom(urlString: urlString, success: { (image) in
                XCTFail("Unexpected success in loading image")
                expectation.fulfill()
            }, failure: { (image) in
                // Then
                XCTAssertNotNil(image, "Expected non-nil placeholder image")
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
