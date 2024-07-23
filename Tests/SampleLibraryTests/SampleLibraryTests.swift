import os
import XCTest
@testable import SampleLibrary

final class SampleLibraryTests: XCTestCase {

		var sampleLibrary: SampleLibrary!
		var mockFileManager: MockFileManager!

		override func setUpWithError() throws {
				try super.setUpWithError()

				/// Initialize mockFileManager and set its mock contents
				mockFileManager = makeMockDirectoryContents()

				/// Initialize sampleLibrary with the mockFileManager
				sampleLibrary = SampleLibrary(fileManager: mockFileManager)
		}

		override func tearDownWithError() throws {
				sampleLibrary = nil
				mockFileManager = nil
				try super.tearDownWithError()
		}

		private func makeMockDirectoryContents() -> MockFileManager {
				let mockFileManager = MockFileManager()

				mockFileManager.mockContents = [
						URL(fileURLWithPath: "/path/to/first.swift"),
						URL(fileURLWithPath: "/path/to/second.swift"),
						URL(fileURLWithPath: "/path/to/SampleLibrary.swift")
				]

				return mockFileManager
		}

		private static let logger = Logger(
				subsystem: "io.swiftpackage.fileNameGenerator",
				category: "LibraryPackageTests"
		)


    func testGenerateList() throws {

				do {
						let result = try sampleLibrary.generateList()

						let expectedFiles = [
								"first.swift",
								"second.swift"
						]

						XCTAssertEqual(
								result.sorted(), 
								expectedFiles,
								"the generateList method did ot return the expected files"
						)
				} catch {
						Self.logger.error(
								"Test failed with error: \(error.localizedDescription, privacy: .public)"
						)
				}
    }
}
