# PopinCall iOS Library

PopinCall is an iOS library that enables seamless integration of video calling functionality into your iOS applications. It provides an easy-to-use interface for connecting users with experts or support agents with robust real-time communication.

## Features

- High-quality video calling powered by LiveKit
- Audio controls (mute/unmute microphone)
- Video controls (enable/disable camera, switch camera)
- Picture-in-picture support
- CallKit integration for native call UI
- Automatic connection management with queue positioning
- Expert availability handling
- Configurable UI (hide/show individual controls)

## Requirements

- iOS 13.0+
- Swift 5.7+
- Xcode 14.0+

## Installation

### Swift Package Manager

Add PopinCall as a dependency in your `Package.swift`:

```swift
dependencies: [
    .package(url: "https://github.com/Springr-Creatives/Popin-Library-iOS.git", from: "1.0.0")
]
```

Or in Xcode:

1. Select **File > Add Package Dependencies...**
2. Enter the package URL: `https://github.com/Springr-Creatives/Popin-Library-iOS.git`
3. Select the version you want to use.

## Permissions

Add the following to your `Info.plist`:

```xml
<key>NSCameraUsageDescription</key>
<string>This app needs access to camera for video calls</string>
<key>NSMicrophoneUsageDescription</key>
<string>This app needs access to microphone for video calls</string>
```

And add `audio` to `UIBackgroundModes`:

```xml
<key>UIBackgroundModes</key>
<array>
    <string>audio</string>
</array>
```

## Quick Start

### 1. Import the Library

```swift
import PopinCall
```

### 2. Initialize with Configuration

```swift
let config = PopinConfig.Builder()
    .userName("John Doe")
    .contactInfo("john@example.com")
    .sandboxMode(true)
    .initListener(self)
    .hideScreenShareButton(true)
    .product(PopinProduct(
        id: "SKU-123",
        name: "Premium Widget",
        image: "https://example.com/product.jpg"
    ))
    .build()

Popin.initialize(token: 51, config: config)
```

### 3. Start a Call

```swift
Popin.shared?.startCall(eventsListener: self)
```

### 4. Implement Listeners

```swift
extension ViewController: PopinInitListener {
    func onInitComplete() {
        print("Popin initialized")
    }

    func onInitFailed(reason: String) {
        print("Init failed: \(reason)")
    }
}

extension ViewController: PopinEventsListener {
    func onPermissionGiven()                        { }
    func onPermissionDenied()                       { }
    func onCallStart()                              { }
    func onCallCancel()                             { }
    func onQueuePositionChanged(position: Int)      { }
    func onCallMissed()                             { }
    func onCallNetworkFailure()                     { }
    func onCallConnected()                          { }
    func onCallFailed()                             { }
    func onCallEnd()                                { }
}
```

## API Reference

### Popin

```swift
// Initialize with config
Popin.initialize(token: sellerToken, config: config)

// Start a call
Popin.shared?.startCall(eventsListener: self)

// Cancel waiting for call acceptance
Popin.shared?.cancelCall()

// Access current config
let config = Popin.shared?.getConfig()
```

### PopinConfig.Builder

| Method | Default | Description |
|--------|---------|-------------|
| `.userName(String)` | `""` | User's display name |
| `.contactInfo(String)` | `""` | User's contact info (email/phone) |
| `.sandboxMode(Bool)` | `false` | Use sandbox environment |
| `.initListener(PopinInitListener)` | `nil` | Listener for initialization events |
| `.hideDisconnectButton(Bool)` | `false` | Hide the disconnect/hang-up button |
| `.hideScreenShareButton(Bool)` | `false` | Hide the screen share button |
| `.hideFlipCameraButton(Bool)` | `false` | Hide the flip camera button |
| `.hideMuteVideoButton(Bool)` | `false` | Hide the mute video button |
| `.hideMuteAudioButton(Bool)` | `false` | Hide the mute audio button |
| `.hideBackButton(Bool)` | `false` | Hide the back button |
| `.persistenceMode(Bool)` | `true` | Reuse session across app restarts |
| `.product(PopinProduct)` | `nil` | Product context for the call |
| `.callerId(String)` | `nil` | Custom caller identifier |
| `.meta([String: String])` | `[:]` | Custom metadata key-value pairs |

### PopinProduct

```swift
PopinProduct(
    id: "SKU-123",
    name: "Product Name",
    image: "https://example.com/image.jpg",
    url: "https://example.com/product",
    description: "Product description",
    extra: "Additional info"
)
```

### PopinInitListener

| Method | Description |
|--------|-------------|
| `onInitComplete()` | SDK initialization succeeded |
| `onInitFailed(reason:)` | SDK initialization failed |

### PopinEventsListener

| Method | Description |
|--------|-------------|
| `onPermissionGiven()` | Camera and microphone permissions were granted |
| `onPermissionDenied()` | Camera or microphone permissions were denied |
| `onCallStart()` | Call has been queued and is waiting for an agent |
| `onCallCancel()` | Call was cancelled (e.g. all experts busy) |
| `onQueuePositionChanged(position:)` | Your position in the queue has changed |
| `onCallMissed()` | No agent answered in time |
| `onCallNetworkFailure()` | A network error occurred |
| `onCallConnected()` | The video call is now active |
| `onCallFailed()` | The call failed to connect |
| `onCallEnd()` | The call has ended |

## Example Project

See the `PopinCallExamples` target for a complete working example.

## Support

For support and questions, please contact: contact@popin.to

## License

This library is available under the MIT License. See [LICENSE.md](LICENSE.md) for details.

---

Made with care by [Springr Creatives](https://github.com/Springr-Creatives)
