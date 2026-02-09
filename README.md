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
    func onInitComplete() {
        print("Popin initialized")
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

    func onCallCancel() {
        print("Call cancelled")
    }

    func onQueuePositionChanged(position: Int) {
        print("Queue position: \(position)")
    }

    func onCallMissed() {
        print("Call missed")
    }

    func onCallNetworkFailure() {
        print("Network failure")
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

## Receiving Incoming Calls via PushKit

To receive incoming call notifications, enable the feature in your `PopinConfig`:

```swift
let config = PopinConfig.Builder()
    .enableIncomingCalls(true)
    // ... other configurations
    .build()
```

You must also forward VoIP push tokens and incoming push payloads from your `AppDelegate` to the SDK so it can notify users of incoming calls.

### Step 1: Register for VoIP Pushes

Set up a `PKPushRegistry` in your `AppDelegate` and adopt the `PKPushRegistryDelegate` protocol:

```swift
import PushKit
import PopinCall

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var pushRegistry: PKPushRegistry!

    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Register for VoIP pushes
        pushRegistry = PKPushRegistry(queue: .main)
        pushRegistry.delegate = self
        pushRegistry.desiredPushTypes = [.voIP]

        return true
    }
}
```

### Step 2: Forward the VoIP Token

Call `Popin.setVoIPToken()` from your `PKPushRegistryDelegate` when a new token is received. The SDK registers this token with the Popin server so it can send incoming call notifications to the device. If the SDK is not yet initialized, the token is stored locally and sent automatically during the next initialization.

```swift
extension AppDelegate: PKPushRegistryDelegate {

    func pushRegistry(_ registry: PKPushRegistry,
                      didUpdate pushCredentials: PKPushCredentials,
                      for type: PKPushType) {
        guard type == .voIP else { return }

        let token = pushCredentials.token
            .map { String(format: "%02x", $0) }
            .joined()

        Popin.setVoIPToken(token)
    }
}
```

### Step 3: Forward Incoming Call Pushes

Call `Popin.onVoIPPushReceived(payload:completion:)` from your `PKPushRegistryDelegate` when an incoming push is received. The SDK checks whether the payload is an incoming call notification and handles it accordingly. It returns `true` if the push was handled by Popin, so you can skip your own processing for those pushes.

> **Important:** On iOS, PushKit **requires** that a CallKit call is reported for every VoIP push received, or the system will terminate your app. The Popin SDK handles this automatically when the push is identified as a Popin notification.

```swift
extension AppDelegate: PKPushRegistryDelegate {

    func pushRegistry(_ registry: PKPushRegistry,
                      didUpdate pushCredentials: PKPushCredentials,
                      for type: PKPushType) {
        guard type == .voIP else { return }

        let token = pushCredentials.token
            .map { String(format: "%02x", $0) }
            .joined()

        Popin.setVoIPToken(token)
    }

    func pushRegistry(_ registry: PKPushRegistry,
                      didReceiveIncomingPushWith payload: PKPushPayload,
                      for type: PKPushType,
                      completion: @escaping () -> Void) {
        guard type == .voIP else {
            completion()
            return
        }

        // Let Popin SDK handle incoming call notifications
        if Popin.onVoIPPushReceived(payload: payload.dictionaryPayload, completion: completion) {
            return
        }

        // Handle your own VoIP pushes here
        completion()
    }

    func pushRegistry(_ registry: PKPushRegistry,
                      didInvalidatePushTokenFor type: PKPushType) {
        // Token invalidated
    }
}
```

> **Note:** Popin incoming call messages contain `"source": "popin"` in their data payload. The SDK uses this to identify its own messages.

### PushKit Flow

1. App registers for VoIP pushes via `PKPushRegistry`
2. iOS delivers a VoIP token, which the app forwards to the SDK via `Popin.setVoIPToken()`
3. The SDK sends the token to the Popin server
4. When a call is initiated, the Popin server sends a VoIP push to the device
5. The app receives the push and forwards it to the SDK via `Popin.onVoIPPushReceived()`
6. The SDK reports the call to CallKit and displays the native incoming call UI
7. When the user answers, the SDK connects the video call

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

// Forward VoIP push token to SDK
Popin.setVoIPToken(token)

// Handle incoming VoIP push (returns true if handled by Popin)
let handled = Popin.onVoIPPushReceived(payload: payload, completion: completion)
```

### setGroup

Assigns the user to a group. This must be called **after** initialization is complete (i.e., inside the `onInitComplete()` callback). If called before initialization, the `onFailure` callback returns `"Not initialised yet"`.

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
| `onInitComplete()` | SDK initialization succeeded |
| `onInitFailed(reason:)` | SDK initialization failed |

### PopinEventsListener

| Method | Description |
|--------|-------------|
| `onPermissionGiven()` | Camera and microphone permissions were granted |
| `onPermissionDenied()` | Camera or microphone permissions were denied |
| `onCallStart()` | Call has been queued and is waiting for an agent |
| `onCallCancel()` | Call was cancelled (e.g., all experts busy) |
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
