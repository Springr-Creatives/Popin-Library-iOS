//
//  ProductDetailsView.swift
//  Popin
//
//  Created for Product Details Display
//

import SwiftUI
import UIKit

#if canImport(UIKit)
// MARK: - Product Details View

struct ProductDetailsView: View {
    let productId: String?
    let productName: String?
    let productUrl: String?
    let productImageUrl: String?
    let productDescription: String?
    let productExtra: String?

    // Computed properties for text display - matches Android logic
    private var primaryText: String {
        if let extra = productExtra, !extra.isEmpty {
            return extra
        }
        return productName ?? "No Product Name"
    }

    private var secondaryText: String {
        if let extra = productExtra, !extra.isEmpty {
            return productName ?? ""
        }
        return productId ?? ""
    }

    private func openProductUrl() {
        guard let urlString = productUrl,
              let url = URL(string: urlString),
              UIApplication.shared.canOpenURL(url) else { return }
        UIApplication.shared.open(url)
    }

    var body: some View {
        Button(action: openProductUrl) {
            HStack(alignment: .top, spacing: 8) {
                // Product Image - 4:3 aspect ratio matching Android (12:9)
                if let imageURL = productImageUrl, let url = URL(string: imageURL) {
                    AsyncImage(url: url) { image in
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                    } placeholder: {
                        Color.gray.opacity(0.3)
                    }
                    .frame(width: 75, height: 56)
                    .clipShape(RoundedRectangle(cornerRadius: 8))
                }

                // Product Text Details
                VStack(alignment: .leading, spacing: 0) {
                    Text(primaryText)
                        .font(.system(size: 13, weight: .medium))
                        .foregroundColor(.white)
                        .lineLimit(1)

                    if !secondaryText.isEmpty {
                        Text(secondaryText)
                            .font(.system(size: 13, weight: .medium))
                            .foregroundColor(.white.opacity(0.8))
                            .lineLimit(1)
                    }

                    // View details row with arrow
                    HStack(spacing: 4) {
                        Text("View details")
                            .font(.system(size: 12, weight: .bold))
                            .foregroundColor(.white)
                        Image(systemName: "arrow.right")
                            .font(.system(size: 12, weight: .bold))
                            .foregroundColor(.white)
                    }
                }

                Spacer()
            }
            .padding(.horizontal, 8)
            .padding(.vertical, 4)
            .background(Color.black.opacity(0.6))
            .cornerRadius(20)
        }
        .buttonStyle(PlainButtonStyle())
    }
}

// MARK: - Top Controls View

struct TopControls: View {
    @EnvironmentObject private var configHolder: PopinConfigHolder

    let onPipClick: () -> Void

    // Product data
    let productId: String?
    let productName: String?
    let productUrl: String?
    let productImageUrl: String?
    let productDescription: String?
    let productExtra: String?

    var body: some View {
        HStack(alignment: .center, spacing: 12) {
            // PiP/Back Button (Top Left)
            if !configHolder.config.hideBackButton {
                Button(action: onPipClick) {
                    Image(systemName: "pip.enter")
                        .font(.system(size: 20))
                        .foregroundColor(.white)
                        .padding(12)
                        .background(Color.black.opacity(0.4))
                        .clipShape(Circle())
                }
            }

            // Product Details (fills remaining width)
            if productId != nil || productName != nil {
                ProductDetailsView(
                    productId: productId,
                    productName: productName,
                    productUrl: productUrl,
                    productImageUrl: productImageUrl,
                    productDescription: productDescription,
                    productExtra: productExtra
                )
            } else {
                Spacer()
            }
        }
        .padding(.top, 16)
        .padding(.horizontal, 16)
    }
}
#endif
