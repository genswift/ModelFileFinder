// The Swift Programming Language
// https://docs.swift.org/swift-book
//
//

import os
import Foundation

public struct SampleLibrary {

		private let fileManager: FileManagerProtocol

		private let logger = Logger(
				subsystem: "io.swiftpackage.fileNameGenerator",
				category: "LibraryPackage"
		)

		public init(fileManager: FileManagerProtocol = FileManager.default) {
				self.fileManager = fileManager
		}

		public func generateList() throws -> [String] {

				var result = [String]()

				let currentFilePath = #file
				let currentFileURL = URL(filePath: currentFilePath, directoryHint: .inferFromPath)
				let sourceDirectoryURL = currentFileURL.deletingLastPathComponent()

				print("")
				print("this is currentFileURl: \(currentFileURL)")
				print("")

				do {
						let contents = try fileManager.contentsOfDirectory(
								at: sourceDirectoryURL,
								includingPropertiesForKeys: nil,
								options: []
						)

						contents.forEach { fileUrl in
								result.append(fileUrl.lastPathComponent)
						}

				} catch {
						logger.error("Error occurred: \(error.localizedDescription)")
						throw error
				}

				let currentFileName = URL(
						filePath: currentFilePath,
						directoryHint: .inferFromPath
				).lastPathComponent

				return result.filter { $0 != currentFileName }
		}
}
