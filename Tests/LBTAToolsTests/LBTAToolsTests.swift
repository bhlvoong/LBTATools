import XCTest
@testable import LBTATools
import UIKit

@available(iOS 9.0, *)
final class LBTAToolsTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        
        let v = UIView()
        v.anchor(top: nil, leading: nil, bottom: nil, trailing: nil)
        XCTAssertEqual(LBTATools().text, "Hello, World!")
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
