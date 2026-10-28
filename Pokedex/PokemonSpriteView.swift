//
//  PokemonSpirteView.swift
//  Pokedex
//
//  Created by Max Zelinka on 28/10/2026.
//

import Foundation
import SwiftUI

struct PokemonSpriteView: View {
    let url: URL?
    let size: CGFloat
    // Why UIImage and not SwiftUI’s Image? You’ll download raw Data (bytes). SwiftUI’s Image can’t be created from bytes, but UIImage(data:) can.
    @State private var image: UIImage? = nil
    var body: some View {
        ZStack {
            if let image {
                Image(uiImage: image)
                    .interpolation(.none)
                    .resizable()
                    .scaledToFit()
            } else {
                Image(systemName:"questionmark.circle")
                    .foregroundStyle(Color.white)
            }
        }
        .frame(width: size, height: size)
        .background(Color.white.opacity(0.1))
        .clipShape(RoundedRectangle(cornerRadius: 4))
        
        .task{
            // Unwraps the optional url. If it's nil (e.g. the hardcoded preview data), stop here and keep showing the placeholder.
            guard let url else { return }
            // Builds a request that uses the cached sprite however old it is, and only goes to the network if it isn't cached yet.
            let request: URLRequest = URLRequest(url: url, cachePolicy: .returnCacheDataElseLoad)
            // Downloads the sprite. try? turns a failure (e.g. offline and not cached) into nil, so the block below is skipped.
            // (data, _) unpacks the result: data holds the image bytes, _ ignores the response.
            if let (data, _) = try? await URLSession.shared.data(for: request) {
                // Turns the raw bytes into a UIImage and stores it in @State, which redraws the view with the sprite.
                image = UIImage(data: data)
            }
        }
    }
}
