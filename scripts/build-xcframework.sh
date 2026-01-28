#!/bin/bash
set -euo pipefail

# ─── Configuration ───────────────────────────────────────────────
PROJECT="PopinCall.xcodeproj"
SCHEME="PopinCall"
FRAMEWORK_NAME="PopinCall"
BUILD_DIR="$(pwd)/build"
ARCHIVE_DIR="${BUILD_DIR}/archives"
XCFRAMEWORK_DIR="${BUILD_DIR}/${FRAMEWORK_NAME}.xcframework"
OUTPUT_ZIP="${BUILD_DIR}/${FRAMEWORK_NAME}.xcframework.zip"

# ─── Clean previous build ───────────────────────────────────────
echo "Cleaning previous build..."
rm -rf "${BUILD_DIR}"
mkdir -p "${ARCHIVE_DIR}"

# ─── Archive for iOS device (arm64) ─────────────────────────────
echo "Archiving for iOS device..."
xcodebuild archive \
  -project "${PROJECT}" \
  -scheme "${SCHEME}" \
  -destination "generic/platform=iOS" \
  -archivePath "${ARCHIVE_DIR}/ios-device" \
  -skipPackagePluginValidation \
  SKIP_INSTALL=NO \
  INSTALL_PATH=/

# ─── Archive for iOS Simulator (arm64 + x86_64) ─────────────────
echo "Archiving for iOS Simulator..."
xcodebuild archive \
  -project "${PROJECT}" \
  -scheme "${SCHEME}" \
  -destination "generic/platform=iOS Simulator" \
  -archivePath "${ARCHIVE_DIR}/ios-simulator" \
  -skipPackagePluginValidation \
  SKIP_INSTALL=NO \
  INSTALL_PATH=/

# ─── Locate the built framework inside archives ─────────────────
DEVICE_FW=$(find "${ARCHIVE_DIR}/ios-device.xcarchive" -name "${FRAMEWORK_NAME}.framework" -type d | head -1)
SIM_FW=$(find "${ARCHIVE_DIR}/ios-simulator.xcarchive" -name "${FRAMEWORK_NAME}.framework" -type d | head -1)

if [ -z "$DEVICE_FW" ] || [ -z "$SIM_FW" ]; then
  echo "ERROR: Could not find ${FRAMEWORK_NAME}.framework in archives."
  echo "Device archive contents:"
  find "${ARCHIVE_DIR}/ios-device.xcarchive" -name "*.framework" -type d
  echo "Simulator archive contents:"
  find "${ARCHIVE_DIR}/ios-simulator.xcarchive" -name "*.framework" -type d
  exit 1
fi

echo "Found device framework: ${DEVICE_FW}"
echo "Found simulator framework: ${SIM_FW}"

# ─── Create XCFramework ─────────────────────────────────────────
echo "Creating XCFramework..."
xcodebuild -create-xcframework \
  -framework "${DEVICE_FW}" \
  -framework "${SIM_FW}" \
  -output "${XCFRAMEWORK_DIR}"

# ─── Zip and compute checksum ───────────────────────────────────
echo "Zipping XCFramework..."
cd "${BUILD_DIR}"
zip -r "${FRAMEWORK_NAME}.xcframework.zip" "${FRAMEWORK_NAME}.xcframework"
cd -

CHECKSUM=$(swift package compute-checksum "${OUTPUT_ZIP}")

echo ""
echo "================================================================"
echo "XCFramework built successfully!"
echo ""
echo "  Output:   ${OUTPUT_ZIP}"
echo "  Checksum: ${CHECKSUM}"
echo ""
echo "  Update your Package.swift with:"
echo "  .binaryTarget("
echo "      name: \"PopinCallBinary\","
echo "      url: \"https://<YOUR_CDN>/${FRAMEWORK_NAME}.xcframework.zip\","
echo "      checksum: \"${CHECKSUM}\""
echo "  )"
echo "================================================================"
