//
//  MockFileManager.swift
//
//
//  Created by msuzoagu on 7/22/24.
//

import Foundation
import SampleLibrary

class MockFileManager: FileManagerProtocol {
  var mockContents: [URL] = []

  func contentsOfDirectory(
    at _: URL,
    includingPropertiesForKeys _: [URLResourceKey]?,
    options _: FileManager.DirectoryEnumerationOptions
  ) throws -> [URL] {
    mockContents
  }
}
