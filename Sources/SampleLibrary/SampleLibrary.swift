// The Swift Programming Language
// https://docs.swift.org/swift-book
//
//

import os
import Foundation

public struct SampleLibrary {
		private static let logger = Logger(subsystem: "io.swiftpackage.fileNameGenerator", category: "LibraryPackage")

		public static func generateList() throws -> [String] {

				var result = [String]()
				let fileManager = FileManager.default
				let currentFilePath = #file
				let currentFileURL = URL(fileURLWithPath: currentFilePath)
				let sourceDirectoryURL = currentFileURL.deletingLastPathComponent()

				print("")
				print("this is currentFileURL: \(currentFileURL)")
				print("")
				print("this is sourceDirectoryURL: \(sourceDirectoryURL)")
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

				let currentFileName = URL(filePath: currentFilePath, directoryHint: .inferFromPath).lastPathComponent
				print("")
				print("this is currentFileName: \(currentFileName)")

				return result.filter { $0 != currentFileName }
		}
}
