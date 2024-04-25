# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.1.0/).

## [Unreleased]

### Added 

- Add `Walking` entity - [#88](https://github.com/IronFoundation/iOS-Woof/pull/88)
- Add `City` property to the `owner` entity - [#93](https://github.com/IronFoundation/iOS-Woof/pull/93)
- Add the capability to store and interact with properties needed for displaying onboarding screens - [#100](https://github.com/IronFoundation/iOS-Woof/pull/100)
- Add `OwnerOnboardingView` - [#105](https://github.com/IronFoundation/iOS-Woof/pull/105)
- Add `SitterOnboardingView` - [#111](https://github.com/IronFoundation/iOS-Woof/pull/111)
- Add  section with available slots to `DetailedPetSitterView` - [#109](https://github.com/IronFoundation/iOS-Woof/pull/109)
- Add  `BookingSlotView` for owner flow - [#112](https://github.com/IronFoundation/iOS-Woof/pull/112)
- Add  `WalkingsView` for owner flow - [#115](https://github.com/IronFoundation/iOS-Woof/pull/115)

### Changed
- Refactor `PreferencesHandler` and `Preferences` types' methods to interact with properties needed for displaying onboarding screens - [#110](https://github.com/IronFoundation/iOS-Woof/pull/110)
- Change the values of UI Elements (font sizes and avatar size) - [#101](https://github.com/IronFoundation/iOS-Woof/pull/101)
- Update `build-app.yml` to support required node.js version 20 - [#107](https://github.com/IronFoundation/iOS-Woof/pull/107)
- Update the environment settings and documentation - [#108](https://github.com/IronFoundation/iOS-Woof/pull/108)
- Update the `DetailedPetSitterView` to new style - [#106](https://github.com/IronFoundation/iOS-Woof/pull/106)

### Deleted

- Delete `expired` status from enum `WalkingStatus` - [#91](https://github.com/IronFoundation/iOS-Woof/pull/91)
- Delete  structures `Location` `Reviews` `Rating` and their tests for the `Walking` entity  - [#95](https://github.com/IronFoundation/iOS-Woof/pull/95)

## [0.5.0] - 27.12.2023

### Added 

- Added a city filter to the list of sitters - [#56](https://github.com/IronFoundation/iOS-Woof/pull/56)
- Add new templates for `epic` issue and `feature request` - [#4](https://github.com/IronFoundation/iOS-Woof/pull/4)
- Add the possibility for sitters to update info about themselves - [#52](https://github.com/IronFoundation/iOS-Woof/pull/52)
- Add enums `AppButton` and `AppAlert` which contain repeating strings and text in buttons - [#55](https://github.com/IronFoundation/iOS-Woof/pull/55)

### Changed

- Update tests to support debug and release versions [#60](https://github.com/IronFoundation/iOS-Woof/pull/60)
- Update `EditSitterInformationView` to add info about the `city` field - [#50](https://github.com/IronFoundation/iOS-Woof/pull/50)
- Update `SitterInfoCardView` to display `city` field - [#49](https://github.com/IronFoundation/iOS-Woof/pull/49)
- Update `Sitter` model: add a new property `city` - [#46](https://github.com/IronFoundation/iOS-Woof/pull/46)
- Update`WoofAppEndpoint`: add new case to update sitter - [#48](https://github.com/IronFoundation/iOS-Woof/pull/48)
- Update `GeneralInfoSectionView` and `DetailPetSitterView` to display city info for owner flow - [#51](https://github.com/IronFoundation/iOS-Woof/pull/51)

### Fixed 

- Display different currency type in `SitterListView` and in `SitterProfileView` - [#45](https://github.com/IronFoundation/iOS-Woof/pull/45)

## [0.4.0] - 27.09.2023

### Added 

- Add `SitterProfileViewModel` - [#164](https://github.com/ios-course/ironfoudation-team-project/pull/164)
- Integrate `NetworkService` package into the `WoofApp` - [#188](https://github.com/ios-course/ironfoudation-team-project/pull/188)
- Add the ability to create and save a new owner or sitter when choosing a role on the `LoginView` screen - [#192](https://github.com/ios-course/ironfoudation-team-project/pull/192)
- Add `SitterProfileView` to display and edit personal information about the sitter - [#190](https://github.com/ios-course/ironfoudation-team-project/pull/190)
- Add `Obfuscator` enum with `reveal(_:_:)` method - [#196](https://github.com/ios-course/ironfoudation-team-project/pull/196) 
- Add bash script `Obfuscator.sh` - [#197](https://github.com/ios-course/ironfoudation-team-project/pull/197)
- Add `ProductionEndpoint`, `APIEnvironment` - [#199](https://github.com/ios-course/ironfoudation-team-project/pull/199)
- Add scripts to insert API-key to the build phase of the `Woof` target - [#202](https://github.com/ios-course/ironfoudation-team-project/pull/202)
- Add a new endpoint to `WoofAppEndpoint` for adding new sitter - [#205](https://github.com/ios-course/ironfoudation-team-project/pull/205)
- Add request to backend in `SitterProfileViewModel` to upload Sitter information - [#211](https://github.com/ios-course/ironfoudation-team-project/pull/211)
- Add a new endpoint to `WoofAppEndpoint` for receiving all the saved sitters - [#208](https://github.com/ios-course/ironfoudation-team-project/pull/208)
- Add `CodingKeys` for `Sitter` model - [#213](https://github.com/ios-course/ironfoudation-team-project/pull/213)
- Add method `fetchSitters` to `SitterListViewModel` to get a list of sitters form the server - [#214](https://github.com/ios-course/ironfoudation-team-project/pull/214)

### Changed

 - Update PR template [#194](https://github.com/ios-course/ironfoudation-team-project/pull/194)
 - Update revision of the `SimpleNetworkService` package in the project - [#204](https://github.com/ios-course/ironfoudation-team-project/pull/204)
 - Update `SitterProfileView` to allow the user to enter profile info only once - [#212](https://github.com/ios-course/ironfoudation-team-project/pull/212)
 - Update `SitterListView` to present a loading indicator and occurring errors - [#218](https://github.com/ios-course/ironfoudation-team-project/pull/218)

## [0.3.1] - 21.08.2023

### Changed 

- Changing the application icon in order to enable distributing releases through TestFlight. - [#198](https://github.com/ios-course/ironfoudation-team-project/pull/198)

## [0.3.0] - 19.06.2023

### Added

- Add `enum Stars` and `enum StarRating` and use it into `FiveStarRatingView` and updated code that depends on these changes - [#127](https://github.com/ios-course/ironfoudation-team-project/pull/127)
- Add `SitterMainTabView` for the sitter with stub view for tabs - [#108](https://github.com/ios-course/ironfoudation-team-project/pull/108)
- Update storage keys and storage names to use with the `KeyValueStorage` - [#109](https://github.com/ios-course/ironfoudation-team-project/pull/109)
- Create `Preferences` model, enum `Role` - [#111](https://github.com/ios-course/ironfoudation-team-project/pull/111)
- Move `AvatarView` file to the `ReusableViews` folder - [#136](https://github.com/ios-course/ironfoudation-team-project/pull/136)
- Create `PreferencesHandler` model - [#115](https://github.com/ios-course/ironfoudation-team-project/pull/115)
- Create `CapsuleWithWhiteText` as `ButtonStyle` and apply in the `OwnerProfileView` - [#135](https://github.com/ios-course/ironfoudation-team-project/pull/135)
- Add build schemes for the Woof and WoofTests targets - [#148](https://github.com/ios-course/ironfoudation-team-project/pull/148)
- Add `LoginViewModel` to work with data in LoginView - [#157](https://github.com/ios-course/ironfoudation-team-project/pull/157)
- Add `CopyToClipboardLabel`. Add feature copy to clipboard the pet sitter's name and the phone number. - [#134](https://github.com/ios-course/ironfoudation-team-project/pull/134)
- Add the `StartScreenViewModel` to get user role, update the `WoofApp` to show proper view based on user role - [#156](https://github.com/ios-course/ironfoudation-team-project/pull/156)
- Create view models: `SitterMainTabViewModel`, `OwnerMainTabViewModel` for main tab views - [#154](https://github.com/ios-course/ironfoudation-team-project/pull/154)
- Add the `SitterInfoCardView` - [#112](https://github.com/ios-course/ironfoudation-team-project/pull/158)
- Create `PurpleCapsuleOfInfinityWidth` as `ButtonStyle`. Create `LoginView` and apply in the `WoofApp` to display when running the app when the user role is not selected - [#160](https://github.com/ios-course/ironfoudation-team-project/pull/160)
- Add the `EditSitterInformationView` and the reusable element `TextEditorWithPlaceholder` - [#159](https://github.com/ios-course/ironfoudation-team-project/pull/159)
- Add ability to change the user role using `Logout` button on the `SitterMainTabView` and `OwnerMainTabView` screens - [#167](https://github.com/ios-course/ironfoudation-team-project/pull/167)

### Changed

- Update the Authors section for the `README.md` file - [#139](https://github.com/ios-course/ironfoudation-team-project/pull/139)
- Update the general issue template - [#149](https://github.com/ios-course/ironfoudation-team-project/pull/149)
- Change the class name from `StartScreenViewModel` to `UserRoleViewModel`. Add methods to the `UserRoleViewModel` to set and reset user's role in the application - [#166](https://github.com/ios-course/ironfoudation-team-project/pull/166)


## [0.2.0] - 05.06.2023

### Added 

- Add `OwnerProfileViewModel` for `OwnerProfileView` - [#88](https://github.com/ios-course/ironfoudation-team-project/pull/88)
- Add `OwnerCardView`- [81](https://github.com/ios-course/ironfoudation-team-project/pull/81)
- Enhancement: make `IconName` extension of `String` instead of `Image` - [#95](https://github.com/ios-course/ironfoudation-team-project/pull/95)
- Add icon image for the app [#96](https://github.com/ios-course/ironfoudation-team-project/pull/96)
- Add `OwnerProfileView`- [#93](https://github.com/ios-course/ironfoudation-team-project/pull/93)

## [0.1.0] - 31.05.2023

### Added 

- Add environment setting files: `.gitignore` file, rules for linters - [#24](https://github.com/ios-course/ironfoudation-team-project/pull/24)
- Add project documentation files: `README.md`, `board_rules.md`, `CHANGELOG.md`, `release_notes.md` - [#25](https://github.com/ios-course/ironfoudation-team-project/pull/25)
- Add Xcode project and integrate linters into Xcode build phase - [#26](https://github.com/ios-course/ironfoudation-team-project/pull/26)
- Create project structure - [#27](https://github.com/ios-course/ironfoudation-team-project/pull/27)
- Add `Owner` model to the model layer - [#36](https://github.com/ios-course/ironfoudation-team-project/pull/36)
- Add `Sitter` model to the model layer - [#37](https://github.com/ios-course/ironfoudation-team-project/pull/37)
- Add `MainTabView` for the owner with stub view for tabs - [#29](https://github.com/ios-course/ironfoudation-team-project/pull/29)
- Add `SitterCardViewModel` for `SitterCardView` - [#38](https://github.com/ios-course/ironfoudation-team-project/pull/38)
- Add `SitterCardView` as part of `SitterListView` - [#42](https://github.com/ios-course/ironfoudation-team-project/pull/42)
- Add `SitterListView` to the Sitter's tab in `MainTabView` - [#48](https://github.com/ios-course/ironfoudation-team-project/pull/48)
- Add `DetailedSitterView` to present the detailed information about the selected sitter from `SitterListView`  - [#55](https://github.com/ios-course/ironfoudation-team-project/pull/55)
- Add template for PRs  - [#53](https://github.com/ios-course/ironfoudation-team-project/pull/53)
- Add template for issues  - [#54](https://github.com/ios-course/ironfoudation-team-project/pull/54)
- Add missed information to `CHANGELOG.md`  - [#56](https://github.com/ios-course/ironfoudation-team-project/pull/56)
- Add the `KeyValueStorage` class to manage persistent data storage - [#58](https://github.com/ios-course/ironfoudation-team-project/pull/58)
- Add `EditOwnerInformationView` - [#77](https://github.com/ios-course/ironfoudation-team-project/pull/77)
