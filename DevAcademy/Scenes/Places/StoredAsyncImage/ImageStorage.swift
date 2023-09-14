//
//  ImageStorage.swift
//  DevAcademy
//
//  Created by Zdenko Čepan on 29/08/2023.
//

import Foundation
import CryptoKit
import SwiftUI

class ImageStorage {
    static let shared: ImageStorage = ImageStorage()

    /// Select an folder in this application bundle. We want ideally an "Application Support" directory. In this directory, we want to store our images in subdirectory called "imageCache",
    private let defaultPath: URL = { .applicationSupportDirectory.appendingPathComponent("imageCache") }()

    /// Initializer first checks, whether folder for `defaultPath` exists. If not, it creates a new one.
    init() {
        let url: URL = defaultPath
        if !FileManager.default.fileExists(atPath: url.path(percentEncoded: false)) {
            try! FileManager.default.createDirectory(at: defaultPath, withIntermediateDirectories: true)
        }
    }


    /// Takes an URL as a input and produces SHA256 String of the URL as the output.
    ///
    /// We don't use protocol `Hashable` from two reasons. Firstly, the Apple Documentation explicitly forbids to use `Hashable` and `hashValue` for any purpose related to persistence. The hashes are different at each execution for security reasons. Secondly, the 64-bit `Int` is just too short.
    ///
    /// - Parameter url: URL to be hashed
    /// - Returns: Hashed string
    private func hash(of url: URL) -> String {
        let path = url.description.data(using: .utf8)!
        return SHA256.hash(data: path).compactMap { String(format: "%02x", $0) }.joined()
    }


    /// Check, whether file is already cached and if so, returns an Image.
    ///
    /// The function should have following behavior:
    ///  - Hash the URL
    ///  - Check, whether file names by this hash already exists
    ///  - If so, load it and return it as an Image
    ///
    /// - Parameter url: The URL of the request that would be executed upon the server.
    /// - Returns: Image if exists.
    func loadImage(for url: URL) -> Image? {
        let hashUrl: String = hash(of: url)
        var contents: [String] = try! FileManager.default.contentsOfDirectory(atPath: defaultPath.path(percentEncoded: false))
        
        guard contents.contains(hashUrl) else {
            return nil
        }

        // HINT: Data -> UIImage
        // let uiimage = UIImage(data: data)
        let data = try? Data(contentsOf: defaultPath.appendingPathComponent(hashUrl))
        guard let data = data else { return nil }
        let uiimage = UIImage(data: data)
        return Image(uiImage: uiimage!)
    }


    /// Updates image in the cache.
    ///
    /// The function should have following behavior:
    ///  - Hash the URL
    ///  - Remove existring file (if exists)
    ///  - Create a binary data from the image
    ///  - Save the binary data to the file
    ///
    /// - Parameters:
    ///   - image: Image to be stored
    ///   - url: The URL that was executed upon the server to get this image.
    func update(image: UIImage, at url: URL) {
        let hashUrl: String = hash(of: url)

        var contents: [String] = try! FileManager.default.contentsOfDirectory(atPath: defaultPath.path(percentEncoded: false))
        
        if contents.contains(hashUrl) {
            try! FileManager.default.removeItem(at: defaultPath.appendingPathComponent(hashUrl))
        }
        
        // HINT: UIImage -> Data
        guard let bytes = image.jpegData(compressionQuality: 1.0) else { return }
        try! bytes.write(to: defaultPath.appendingPathComponent(hashUrl))
    }
}
