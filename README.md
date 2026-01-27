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

### 2. Connect and Implement the Delegate

```swift
class ViewController: UIViewController, PopinCallDelegate {

    @IBAction func makeCall(_ sender: Any) {
        Popin.shared.connect(token: 51, popinDelegate: self)
    }

    // MARK: - PopinCallDelegate

    func onConnectionEstablished() {
        print("Connection established")
    }

    func onAllExpertsBusy() {
        print("All experts are currently busy")
    }

    func onQueuePositionChanged(position: Int) {
        print("Queue position: \(position)")
    }

    func onCallAccepted(callId: Int) {
        print("Call accepted: \(callId)")
    }

    func onCallMissed() {
        print("Call missed")
    }

    func onCallConnected() {
        print("Call connected")
    }

    func onCallDisconnected() {
        print("Call disconnected")
    }

    func onCallFail() {
        print("Call failed")
    }
}
```

That's it. The library handles user registration, Pusher connection, queue management, and automatically presents the video call UI when an agent accepts.

## API Reference

### Popin

The `Popin` singleton is the main entry point:

```swift
// Start a connection to an expert
Popin.shared.connect(token: sellerToken, popinDelegate: self)

// Stop waiting for call acceptance
Popin.shared.stopWaiting()
```

### PopinCallDelegate

| Method | Description |
|--------|-------------|
| `onConnectionEstablished()` | Connection to the Popin service is established |
| `onAllExpertsBusy()` | All available experts are currently busy |
| `onQueuePositionChanged(position:)` | Your position in the queue has changed |
| `onCallAccepted(callId:)` | An expert has accepted your call |
| `onCallMissed()` | The call was missed (no expert answered in time) |
| `onCallConnected()` | The video call is now active |
| `onCallDisconnected()` | The video call has ended |
| `onCallFail()` | The call failed to connect |

## Example Project

See the `PopinCallExamples` target for a complete working example.

## Dependencies

- [LiveKit](https://github.com/livekit/client-sdk-swift) (~> 2.10) - Video conferencing
- [LiveKitComponents](https://github.com/livekit/components-swift) (~> 0.1.6) - UI components
- [Alamofire](https://github.com/Alamofire/Alamofire) (~> 5.0) - HTTP networking
- [PusherSwift](https://github.com/pusher/pusher-websocket-swift) (~> 10.1) - Real-time messaging
- [SwiftyJSON](https://github.com/SwiftyJSON/SwiftyJSON) (~> 4.0) - JSON parsing

## Support

For support and questions, please contact: contact@popin.to

## License

This library is available under the MIT License. See [LICENSE.md](LICENSE.md) for details.

---

Made with care by [Springr Creatives](https://github.com/Springr-Creatives)
