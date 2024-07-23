//
//  File.swift
//  
//
//  Created by msuzoagu on 7/22/24.
//

import Foundation
import SampleLibrary

class MockFileManager: FileManagerProtocol {
		var mockContents: [URL] = []

		func contentsOfDirectory(at url: URL, includingPropertiesForKeys keys: [URLResourceKey]?, options mask: FileManager.DirectoryEnumerationOptions) throws -> [URL] {
				return mockContents
		}
}
