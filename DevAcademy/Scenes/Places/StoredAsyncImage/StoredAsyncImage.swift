//
//  StoredAsyncImage.swift
//  DevAcademy
//
//  Created by Zdenko Čepan on 29/08/2023.
//

import SwiftUI
import CryptoKit

struct StoredAsyncImage<I: View, P: View>: View {

    @State private var image: Image?

    private let url: URL
    private let imageBuilder: (Image) -> I
    private let placeholderBuilder: () -> P


    init(url: URL, image: @escaping (Image) -> I, placeholder: @escaping () -> P) {
        self.url = url
        self.imageBuilder = image
        self.placeholderBuilder = placeholder
    }

    private func performURLFetch() async throws -> (UIImage, Image) {
        let (data, _) = try await URLSession.shared.data(from: url)
        guard let uiimage = UIImage(data: data) else {
            throw StoredAsyncImageError.decodingFailed
        }
        let image = Image(uiImage: uiimage)

        return (uiimage, image)
    }

    /// Look into the image cache, whether image is already downloaded.
    ///
    /// If so, store it in `image` state variable.
    /// If not, download the image via `performURLFetch()` function, store it in the cache and in the `image` state vriable.
    private func loadImage() async {
        if let image = ImageStorage.shared.loadImage(for: self.url)  {
            self.image = image
            return
        }
        
        do {
            let (uiimage, image) = try await performURLFetch()
            ImageStorage.shared.update(image: uiimage, at: self.url)
        } catch {
            return
        }
        self.image = image
    }

    /// The body should only show one of either states:
    ///
    /// If `image` state variable is filled, present image using `imageBuilder`
    /// If `image` state variable is empty, present `placeholder` and execute `loadImage()` function in the `.task` modifier.
    @ViewBuilder var body: some View {
            if let img = image {
                imageBuilder(img)
            } else {
                placeholderBuilder()
                    .task {
                        await loadImage()
                    }
            }
    }
}
