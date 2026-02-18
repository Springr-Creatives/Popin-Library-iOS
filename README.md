# PopinCall iOS Library

PopinCall is an iOS library that enables seamless integration of video calling functionality into your iOS applications. It provides an easy-to-use interface for connecting users with experts or support agents with robust real-time communication.


## Requirements

- iOS 15.0+
- Swift 5.0+
- Xcode 14.0+

## Installation

### Swift Package Manager

Add PopinCall as a dependency in your `Package.swift`:

```swift
dependencies: [
    .package(url: "https://github.com/AshwinDotMe/Popin-Library-iOS.git", from: "1.0.0")
]
```

Or in Xcode:

1. Select **File > Add Package Dependencies...**
2. Enter the package URL: `https://github.com/AshwinDotMe/Popin-Library-iOS.git`
3. Select the version you want to use.

## Permissions

Add the following to your `Info.plist`:

```xml
<key>NSCameraUsageDescription</key>
<string>This app needs access to camera for video calls</string>
<key>NSMicrophoneUsageDescription</key>
<string>This app needs access to microphone for video calls</string>
```

### Background Modes

Enable the following Background Modes in your app's Signing & Capabilities:

- **Audio, AirPlay, and Picture in Picture** - For audio/video streaming during calls
- **Voice over IP** - For VoIP call handling
- **Background fetch** - For downloading content from the network

Or add directly to your `Info.plist`:

```xml
<key>UIBackgroundModes</key>
<array>
    <string>audio</string>
    <string>voip</string>
    <string>fetch</string>
</array>
```

## Quick Start

### 1. Import the Library

```swift
import PopinCall
```

### 2. Initialize with Configuration

```swift
// Product info to display during the call (optional)
let product = PopinProduct(
    id: "SKU-12345",
    name: "Wireless Headphones",
    image: "https://example.com/product.jpg",
    url: "https://example.com/products/headphones",
    description: "Noise-cancelling wireless headphones",
    extra: "$299.99"
)

// Custom metadata (optional)
let metadata: [String: String] = [
    "source": "ios_app",
    "version": "1.0.0",
    "campaign": "summer_sale"
]

// Build configuration
let config = PopinConfig.Builder()
    // User information
    .userName("Demo User")
    .contactInfo("demo@example.com")  // email or phone
    .callerId("user-12345")

    // Environment
    .sandboxMode(true)

    // Product info to display in TopControls during call
    .product(product)

    // Custom metadata
    .meta(metadata)

    // UI customization text
    .secondaryProductText("Car details")  // Label shown below product name in top bar
    .expertDesignation("Car Expert")      // Label shown below expert name during call

    // Listeners
    .initListener(self)
    .eventsListener(self)

    // UI visibility options (all visible by default)
    .hideDisconnectButton(false)      // Show end call button
    .hideScreenShareButton(false)     // Show screen share option
    .hideFlipCameraButton(false)      // Show flip camera button
    .hideMuteVideoButton(false)       // Show video toggle button
    .hideMuteAudioButton(false)       // Show mic toggle button
    .hideBackButton(false)            // Show PiP/back button

    // Persistence mode
    .persistenceMode(true)            // Maintain user session

    .build()

// Initialize Popin
Popin.initialize(token: YOUR_SELLER_TOKEN, config: config)
```

### 3. Start a Call

```swift
Popin.shared?.startCall()
```

### 4. Implement Listeners

```swift
// MARK: - PopinInitListener

extension ViewController: PopinInitListener {
    func onInitComplete(userId: Int) {
        print("Popin initialized, userId: \(userId)")
    }

    func onInitFailed(reason: String) {
        print("Popin init failed: \(reason)")
    }
}

// MARK: - PopinEventsListener

extension ViewController: PopinEventsListener {
    func onPermissionGiven() {
        print("Permission given")
    }

    func onPermissionDenied() {
        print("Permission denied")
    }

    func onCallStart() {
        print("Call started")
    }

    func onCallAbandoned() {
        print("Call abandoned")
    }

    func onQueuePositionChanged(position: Int) {
        print("Queue position: \(position)")
    }

    func onCallMissed() {
        print("Call missed")
    }

    func onCallNetworkFailure(participant: String) {
        print("Network failure — participant: \(participant)")
    }

    func onCallConnected() {
        print("Call connected")
    }

    func onCallFailed() {
        print("Call failed")
    }

    func onCallEnd() {
        print("Call ended")
    }
}
```

## Runtime Configuration Updates

You can update `meta`, `callerId`, and `product` at any time before starting a call — without reinitializing the SDK:

```swift
let config = Popin.shared?.getConfig()
config?.product = PopinProduct(
    id: "NEW-SKU",
    name: "New Product",
    image: "https://example.com/new.jpg",
    url: "https://example.com/new",
    description: "Updated product",
    extra: "$199.99"
)
config?.callerId = "new_caller_id"
config?.meta = [
    "source": "ios_app",
    "campaign": "winter_sale"
]

// Now start the call — it will use the updated values
Popin.shared?.startCall()
```

## Receiving Incoming Calls via PushKit

The SDK handles PushKit internally — it manages its own `PKPushRegistry`, receives VoIP tokens, sends them to the server, and processes incoming push payloads. You do **not** need to implement `PKPushRegistryDelegate` yourself.

### Step 1: Enable Incoming Calls

Enable the feature in your `PopinConfig`:

```swift
let config = PopinConfig.Builder()
    .enableIncomingCalls(true)
    // ... other configurations
    .build()
```

### Step 2: Register for VoIP Pushes Early

Call `Popin.registerForVoIPPushes()` in your `AppDelegate` to ensure PushKit is ready on cold launch, even before `Popin.initialize()` is called:

```swift
import UIKit
import PopinCall

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Register PushKit early so VoIP tokens/pushes are handled on cold launch
        Popin.registerForVoIPPushes()
        return true
    }
}
```

> **Important:** On iOS, PushKit **requires** that a CallKit call is reported for every VoIP push received, or the system will terminate your app. The SDK handles this automatically.

That's it — no `PKPushRegistryDelegate` implementation needed in your app.

### PushKit Flow

![PushKit Flow Diagram](docs/flow_diagram.png)

## API Reference

### Popin

```swift
// Initialize with config
Popin.initialize(token: sellerToken, config: config)

// Start a call
Popin.shared?.startCall()

// Cancel waiting for call acceptance
Popin.shared?.cancelCall()

// Set user group (must be called after initialization)
Popin.shared?.setGroup(identifier: "group-id", onSuccess: {
    print("Group set successfully")
}, onFailure: { error in
    print("Failed to set group: \(error)")
})

// Access current config
let config = Popin.shared?.getConfig()

// Register PushKit early (call in AppDelegate before initialize)
Popin.registerForVoIPPushes()
```

### setGroup

Assigns the user to a group. This must be called **after** initialization is complete (i.e., inside the `onInitComplete(userId:)` callback). If called before initialization, the `onFailure` callback returns `"Not initialised yet"`.

```swift
Popin.shared?.setGroup(identifier: "group-abc-123", onSuccess: {
    print("Group set successfully")
}, onFailure: { error in
    print("Failed to set group: \(error)")
})
```

| Parameter | Type | Description |
|-----------|------|-------------|
| `identifier` | `String` | The group ID to assign the user to |
| `onSuccess` | `() -> Void` | Called when the group is set successfully |
| `onFailure` | `(String) -> Void` | Called with an error message on failure |

### PopinConfig.Builder

| Method | Default | Description |
|--------|---------|-------------|
| `.userName(String)` | `""` | User's display name |
| `.contactInfo(String)` | `""` | User's contact info (email or phone) |
| `.callerId(String)` | `nil` | Custom caller identifier |
| `.sandboxMode(Bool)` | `false` | Use sandbox environment |
| `.product(PopinProduct)` | `nil` | Product context for the call |
| `.meta([String: String])` | `[:]` | Custom metadata key-value pairs |
| `.secondaryProductText(String)` | `"Product details"` | Label shown below product name in top controls |
| `.expertDesignation(String)` | `"Product expert"` | Role/designation label shown below expert's name during call |
| `.initListener(PopinInitListener)` | `nil` | Listener for initialization events |
| `.eventsListener(PopinEventsListener)` | `nil` | Listener for call events |
| `.hideDisconnectButton(Bool)` | `false` | Hide the end call button |
| `.hideScreenShareButton(Bool)` | `false` | Hide the screen share option |
| `.hideFlipCameraButton(Bool)` | `false` | Hide the flip camera button |
| `.hideMuteVideoButton(Bool)` | `false` | Hide the video toggle button |
| `.hideMuteAudioButton(Bool)` | `false` | Hide the mic toggle button |
| `.hideBackButton(Bool)` | `false` | Hide the PiP/back button |
| `.persistenceMode(Bool)` | `true` | Maintain user session across app restarts |
| `.enableIncomingCalls(Bool)` | `false` | Enable receiving incoming calls via PushKit. Requires VoIP background mode and PushKit delegate setup |

### PopinProduct

```swift
PopinProduct(
    id: "SKU-123",              // Product ID
    name: "Product Name",       // Display name
    image: "https://...",       // Image URL
    url: "https://...",         // Product page URL
    description: "Description", // Product description
    extra: "$99.99"             // Extra info (e.g., price)
)
```

### PopinInitListener

| Method | Description |
|--------|-------------|
| `onInitComplete(userId:)` | SDK initialization succeeded. Returns the user ID from the server |
| `onInitFailed(reason:)` | SDK initialization failed |

### PopinEventsListener

| Method | Description |
|--------|-------------|
| `onPermissionGiven()` | Camera and microphone permissions were granted |
| `onPermissionDenied()` | Camera or microphone permissions were denied |
| `onCallStart()` | Call has been queued and is waiting for an agent |
| `onCallAbandoned()` | Call was abandoned by user during connecting screen |
| `onQueuePositionChanged(position:)` | Your position in the queue has changed |
| `onCallMissed()` | No agent answered in time |
| `onCallNetworkFailure(participant:)` | A network error occurred. `participant` is `"user"` if the local network failed, or `"agent"` if the remote side dropped |
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
