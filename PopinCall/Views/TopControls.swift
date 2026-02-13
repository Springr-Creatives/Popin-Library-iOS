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
    let onBackClick: (() -> Void)?

    private var primaryText: String {
        return productName ?? productId ?? ""
    }

    private var secondaryText: String {
        if productName != nil {
            return productId ?? ""
        }
        return productExtra ?? ""
    }

    private func openProductUrl() {
        guard let urlString = productUrl,
              let url = URL(string: urlString),
              UIApplication.shared.canOpenURL(url) else { return }
        onBackClick?()
        UIApplication.shared.open(url)
    }

    var body: some View {
        if let id = productId, !id.isEmpty {
            Button(action: openProductUrl) {
                HStack(alignment: .center, spacing: 8) {
                    // Product image - square, matching Android 48dp
                    if let imageURL = productImageUrl, !imageURL.isEmpty, let url = URL(string: imageURL) {
                        AsyncImage(url: url) { image in
                            image
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                        } placeholder: {
                            Color.gray.opacity(0.3)
                        }
                        .frame(width: 48, height: 48)
                        .clipShape(RoundedRectangle(cornerRadius: 8))
                    }

                    // Text content
                    VStack(alignment: .leading, spacing: 2) {
                        Text(primaryText)
                            .font(.system(size: 14, weight: .semibold))
                            .foregroundColor(.white)
                            .lineLimit(1)

                        if !secondaryText.isEmpty {
                            Text(secondaryText)
                                .font(.system(size: 12, weight: .regular))
                                .foregroundColor(.white.opacity(0.7))
                                .lineLimit(1)
                        }
                    }
                }
            }
            .buttonStyle(PlainButtonStyle())
        }
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
        HStack(alignment: .center, spacing: 4) {
            // PiP/Back Button (Top Left)
            if !configHolder.config.hideBackButton {
                Button(action: onPipClick) {
                    Image(systemName: "pip.enter")
                        .font(.system(size: 20))
                        .foregroundColor(.white)
                        .frame(width: 40, height: 40)
                        .background(Color(hex: "433F40"))
                        .clipShape(Circle())
                }
                .buttonStyle(PlainButtonStyle())
            }

            // Product Details
            ProductDetailsView(
                productId: productId,
                productName: productName,
                productUrl: productUrl,
                productImageUrl: productImageUrl,
                productDescription: productDescription,
                productExtra: productExtra,
                onBackClick: onPipClick
            )

            Spacer()
        }
        .padding(.top, 16)
        .padding(.horizontal, 16)
    }
}
#endif
