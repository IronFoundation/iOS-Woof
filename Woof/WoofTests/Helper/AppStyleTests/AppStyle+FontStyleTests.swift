import XCTest

final class FontStyleTests: XCTestCase {
    func testAllFontSizesReturnCorrectValues() {
        let heading = 20.0
        let body = 16.0
        let footnote = 12.0

        XCTAssertEqual(heading, AppStyle.FontStyle.heading.size)
        XCTAssertEqual(body, AppStyle.FontStyle.body.size)
        XCTAssertEqual(footnote, AppStyle.FontStyle.footnote.size)
    }
}
