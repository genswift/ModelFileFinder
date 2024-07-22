import os
import XCTest
@testable import SampleLibrary

final class SampleLibraryTests: XCTestCase {

		private static let logger = Logger(
				subsystem: "io.swiftpackage.fileNameGenerator", 
				category: "LibraryPackageTests"
		)

		override func setUpWithError() throws {
				try super.setUpWithError()
		}

		override func tearDownWithError() throws {
				try super.tearDownWithError()
		}


    func testGenerateList() throws {
				do {
						let result = try SampleLibrary.generateList()

						let expectedFiles = [
								"Locations.swift",
								"Names.swift"
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
