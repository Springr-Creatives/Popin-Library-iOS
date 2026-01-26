//
//  ProductDetailsView.swift
//  Popin
//
//  Created for Product Details Display
//

import SwiftUI

#if canImport(UIKit)
// MARK: - Product Details View

struct ProductDetailsView: View {
    let productId: String?
    let productName: String?
    let productUrl: String?
    let productImageUrl: String?
    let productDescription: String?
    let productExtra: String?

    var body: some View {
        HStack(spacing: 12) {
            // Product Image
            if let imageURL = productImageUrl, let url = URL(string: imageURL) {
                AsyncImage(url: url) { image in
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                } placeholder: {
                    Color.gray.opacity(0.3)
                }
                .frame(width: 48, height: 48)
                .clipShape(RoundedRectangle(cornerRadius: 8))
            } else {
                RoundedRectangle(cornerRadius: 8)
                    .fill(Color.gray.opacity(0.3))
                    .frame(width: 48, height: 48)
                    .overlay(
                        Image(systemName: "photo")
                            .font(.system(size: 20))
                            .foregroundColor(.white.opacity(0.5))
                    )
            }

            // Product Text Details
            VStack(alignment: .leading, spacing: 2) {
                if let productName = productName, !productName.isEmpty {
                    Text(productName)
                        .font(.system(size: 14, weight: .semibold))
                        .foregroundColor(.white)
                        .lineLimit(1)
                }

                if let productId = productId, !productId.isEmpty {
                    Text(productId)
                        .font(.system(size: 12))
                        .foregroundColor(.white.opacity(0.8))
                        .lineLimit(1)
                }
                
                if let extra = productExtra, !extra.isEmpty {
                     Text(extra)
                         .font(.system(size: 11))
                         .foregroundColor(.white.opacity(0.6))
                         .lineLimit(1)
                 }
            }
            
            Spacer()
        }
        .padding(12)
        .background(Color.black.opacity(0.6))
        .cornerRadius(12)
    }
}

// MARK: - Top Controls View

struct TopControls: View {
    let onPipClick: () -> Void
    
    // Product data
    let productId: String?
    let productName: String?
    let productUrl: String?
    let productImageUrl: String?
    let productDescription: String?
    let productExtra: String?

    var body: some View {
        HStack(alignment: .top) {
            // PiP Button (Top Left)
            Button(action: onPipClick) {
                Image(systemName: "pip.enter")
                    .font(.system(size: 20))
                    .foregroundColor(.white)
                    .padding(12)
                    .background(Color.black.opacity(0.4))
                    .clipShape(Circle())
            }
            .padding(.top, 16)
            .padding(.leading, 16)

            Spacer()

            // Product Details (Top Right/Center)
            if productId != nil || productName != nil {
                ProductDetailsView(
                    productId: productId,
                    productName: productName,
                    productUrl: productUrl,
                    productImageUrl: productImageUrl,
                    productDescription: productDescription,
                    productExtra: productExtra
                )
                .padding(.top, 16)
                .padding(.trailing, 16)
                .frame(maxWidth: 250) // Limit width
            }
        }
    }
}
#endif
