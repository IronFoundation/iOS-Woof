import Foundation
import XCTest

final class StringIconNameTests: XCTestCase {
    func testAllIconNamesReturnCorrectValues() {
        let findSitterTabIconName = "magnifyingglass"
        let walkingsTabIconName = "pawprint"
        let profileTabIconName = "person.text.rectangle"
        let scheduleTab = "calendar"
        let avatarPlaceholder = "person.circle"
        let filledStar = "star.fill"
        let unfilledStar = "star"
        let phone = "phone.fill"
        let filledPerson = "person.fill"
        let city = "building.2"
        let house = "house"
        let doc = "doc.on.doc"
        let notes = "note.text"
        let calendar = "calendar"
        let clock = "clock"

        XCTAssertEqual(findSitterTabIconName, String.IconName.findSitterTab)
        XCTAssertEqual(walkingsTabIconName, String.IconName.walkingsTab)
        XCTAssertEqual(profileTabIconName, String.IconName.profileTab)
        XCTAssertEqual(scheduleTab, String.IconName.scheduleTab)
        XCTAssertEqual(avatarPlaceholder, String.IconName.avatarPlaceholder)
        XCTAssertEqual(filledStar, String.IconName.filledStar)
        XCTAssertEqual(unfilledStar, String.IconName.unfilledStar)
        XCTAssertEqual(phone, String.IconName.phone)
        XCTAssertEqual(filledPerson, String.IconName.filledPerson)
        XCTAssertEqual(city, String.IconName.city)
        XCTAssertEqual(house, String.IconName.house)
        XCTAssertEqual(doc, String.IconName.twoDocuments)
        XCTAssertEqual(notes, String.IconName.notes)
        XCTAssertEqual(calendar, String.IconName.calendar)
        XCTAssertEqual(clock, String.IconName.clock)
    }
}
