//
//  VFLInterpreterTests.swift
//  VFLInterpreterTests
//
//  Created by ChenBin on 2021/1/8.
//

import XCTest
@testable import VFLInterpreter

class VFLInterpreterTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        
        let scanner = VFLScanner(input: "[button]-[textField]")
        var tokens: [Token] = []
        
        while let token = scanner?.nextToken() {
            tokens.append(token)
        }
        
        XCTAssert(tokens[0].type == .leftBrace && tokens[0].lexeme == "[")
        XCTAssert(tokens[1].type == .identifier && tokens[1].lexeme == "button")
        XCTAssert(tokens[2].type == .rightBrace && tokens[2].lexeme == "]")
        XCTAssert(tokens[3].type == .connection && tokens[3].lexeme == "-")
        XCTAssert(tokens[4].type == .leftBrace && tokens[4].lexeme == "[")
        XCTAssert(tokens[5].type == .identifier && tokens[5].lexeme == "textField")
        XCTAssert(tokens[6].type == .rightBrace && tokens[6].lexeme == "]")
        
        
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
