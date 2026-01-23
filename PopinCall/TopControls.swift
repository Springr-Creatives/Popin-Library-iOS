//
//  ProductDetailsView.swift
//  Popin
//
//  Created for Product Details Display
//

import SwiftUI

// MARK: - Product Details View

struct ProductDetailsView: View {
    let productId: String?
    let productName: String?
    let productUrl: String?
    let productImageUrl: String?
    let productDescription: String?
    let productExtra: String?
    let onPipClick: (() -> Void)?

    var body: some View {
        // Only show if product ID is available
        if let productId = productId, !productId.isEmpty {
            HStack(spacing: 0) {
                // Product image on the left
                if let productImageUrl = productImageUrl, !productImageUrl.isEmpty {
                    AsyncImage(url: URL(string: productImageUrl)) { phase in
                        switch phase {
                        case .empty:
                            Color.gray.opacity(0.3)
                        case .success(let image):
                            image
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                        case .failure:
                            Color.gray.opacity(0.3)
                        @unknown default:
                            Color.gray.opacity(0.3)
                        }
                    }
                    .frame(width: 75, height: 56.25) // 12:9 aspect ratio
                    .clipShape(RoundedRectangle(cornerRadius: 8))
                    .padding(.trailing, 8)
                }

                // Text views column
                VStack(alignment: .leading, spacing: 2) {
                    // Primary text: productExtra if available, otherwise productName
                    Text(productExtra ?? productName ?? "No Product Name")
                        .font(.system(size: 13, weight: .medium))
                        .foregroundColor(.white)
                        .lineLimit(1)
                        .frame(maxWidth: .infinity, alignment: .leading)

                    // Secondary text: productName if productExtra exists, otherwise productId
                    Text((productExtra != nil && !productExtra!.isEmpty) ? (productName ?? "") : productId)
                        .font(.system(size: 13, weight: .medium))
                        .foregroundColor(.white.opacity(0.8))
                        .lineLimit(1)
                        .frame(maxWidth: .infinity, alignment: .leading)

                    // View button below the id
                    HStack(spacing: 4) {
                        Text("View details")
                            .font(.system(size: 12, weight: .bold))
                            .foregroundColor(.white)

                        Image(systemName: "arrow.right")
                            .font(.system(size: 12, weight: .bold))
                            .foregroundColor(.white)
                    }
                }
                .padding(.leading, 5)
            }
            .padding(.horizontal, 8)
            .padding(.vertical, 4)
            .background(
                RoundedRectangle(cornerRadius: 20)
                    .fill(Color.black.opacity(0.6))
            )
            .onTapGesture {
                handleProductClick()
            }
            
        }
    }

    private func handleProductClick() {
        guard let productUrl = productUrl,
              let url = URL(string: productUrl) else {
            return
        }

        // Call onPipClick to minimize to PiP
        onPipClick?()

        // Open the URL
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
            UIApplication.shared.open(url)
        }
    }
}

// MARK: - Top Controls View

struct TopControls: View {
    let onPipClick: (() -> Void)?
    let productId: String?
    let productName: String?
    let productUrl: String?
    let productImageUrl: String?
    let productDescription: String?
    let productExtra: String?

    var body: some View {
        HStack(spacing: 0) {
            // PiP button (minimize to PiP)
            Button(action: {
                onPipClick?()
            }) {
           
                ZStack {
                    Circle()
                        .fill(Color(hex: "433F40"))
                        .frame(width: 44, height: 44)

                    Image(systemName: "pip.enter")
                        .font(.system(size: 18, weight: .medium))
                        .foregroundColor(.white)
                }
            }
            .frame(width: 40, height: 40)
            .buttonStyle(.plain)

            // Product details component (only show on phones, ignoring tablet code as requested)
            ProductDetailsView(
                productId: productId,
                productName: productName,
                productUrl: productUrl,
                productImageUrl: productImageUrl,
                productDescription: productDescription,
                productExtra: productExtra,
                onPipClick: onPipClick
            )
            .padding(.leading, 16)

            // Push back button to the left when product details are not shown
            Spacer()
        }
        .padding(.leading, 12)
        .padding(.trailing, 8)
        .padding(.top, 16)
    }
}

// MARK: - Preview

#if DEBUG
struct ProductDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.black

            VStack {
                TopControls(
                    onPipClick: { print("PiP clicked") },
                    productId: "SKU123",
                    productName: "Sample Product Name",
                    productUrl: "https://example.com/product",
                    productImageUrl: "https://via.placeholder.com/150",
                    productDescription: "Sample Description",
                    productExtra: "Extra Info"
                )

                Spacer()
            }
        }
        .previewLayout(.sizeThatFits)
    }
}
#endif
