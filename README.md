# PopinCall iOS Library

PopinCall is an iOS library that enables seamless integration of video calling functionality into your iOS applications. It provides an easy-to-use interface for connecting users with experts or support agents with robust real-time communication.

## Features

- 🎥 High-quality video calling
- 🎤 Audio controls (mute/unmute microphone)
- 📹 Video controls (enable/disable camera, switch camera)
- 📱 Picture-in-picture local video view
- 🔄 Automatic connection management
- 📞 Expert availability handling
- 🎨 Customizable UI components

## Requirements

- iOS 13.0+
- Swift 4.2+
- Xcode 12.0+

## Installation

### CocoaPods

Add the following to your `Podfile`:

```ruby
source "https://cdn.cocoapods.org/"

target 'YourApp' do
  use_frameworks!
  
  pod 'PopinCall', '~> 0.1.3'
end
```

Then run:
```bash
pod install
```

## Permissions

Add the following permissions to your `Info.plist`:

```xml
<key>NSCameraUsageDescription</key>
<string>This app needs access to camera for video calls</string>
<key>NSMicrophoneUsageDescription</key>
<string>This app needs access to microphone for video calls</string>
```

## Quick Start

### 1. Import the Library

```swift
import PopinCall
```

### 2. Implement the Delegate

Implement the `PopinCallDelegate` protocol in your view controller:

```swift
class ViewController: UIViewController, PopinCallDelegate {
    
    func onConnectionEstablished() {
        // Connection established, present the call view controller
        let callVC = PopinCallViewController()
        self.navigationController?.pushViewController(callVC, animated: true)
    }
    
    func onAllExpertsBusy() {
        // Handle case when all experts are busy
        print("All experts are currently busy. Please try again later.")
    }
    
    func onCallConnected() {
        // Call successfully connected
        print("Call connected")
    }
    
    func onCallDisconnected() {
        // Call disconnected
        print("Call disconnected")
    }
    
    func onCallFail() {
        // Call failed
        print("Call failed")
    }
}
```

### 3. Initiate a Call

```swift
@IBAction func makeCallTapped(_ sender: Any) {
    // Replace with your actual seller token
    let sellerToken = 11506
    
    Popin.shared.connect(token: sellerToken, popinDelegate: self)
}
```

## Detailed Usage

### PopinCall Main Class

The `Popin` class is the main entry point for the library:

```swift
// Get the shared instance
let popin = Popin.shared

// Connect with your seller token
popin.connect(token: yourSellerToken, popinDelegate: self)
```

### PopinCallViewController

The `PopinCallViewController` provides a complete video calling interface with:

- Full-screen remote video view
- Picture-in-picture local video view  
- Control buttons for mute/unmute audio and video
- Camera switching functionality
- Call end button

```swift
// Present the call view controller when connection is established
func onConnectionEstablished() {
    let callViewController = PopinCallViewController()
    navigationController?.pushViewController(callViewController, animated: true)
}
```

### Delegate Methods

#### `onConnectionEstablished()`
Called when the connection to the Popin service is successfully established. This is when you should present the `PopinCallViewController`.

#### `onAllExpertsBusy()`
Called when all available experts/agents are currently busy. You can show an appropriate message to the user.

#### `onCallConnected()`
Called when the actual video call is connected and active.

#### `onCallDisconnected()`
Called when the video call is disconnected.

#### `onCallFail()`
Called when the call fails for any reason.

## Advanced Configuration

### Custom UI Integration

You can customize the appearance by subclassing `PopinCallViewController` or by implementing your own UI using the underlying components.

### Error Handling

The library provides comprehensive error handling through delegate methods. Make sure to implement all delegate methods to handle various scenarios:

```swift
func onCallFail() {
    DispatchQueue.main.async {
        let alert = UIAlertController(
            title: "Call Failed", 
            message: "Unable to connect to the call. Please try again.", 
            preferredStyle: .alert
        )
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        self.present(alert, animated: true)
    }
}
```

## Example Project

Check out the `PopinCallExamples` target in the project for a complete implementation example.

## Dependencies

This library uses the following dependencies:
- **Alamofire** (~> 5) - HTTP networking
- **PusherSwift** (~> 10.1.0) - Real-time messaging
- **SwiftyJSON** (~> 4.0) - JSON parsing


## Support

For support and questions, please contact: contact@popin.to

## License

This library is available under the MIT License. See [LICENSE.md](LICENSE.md) for details.

## Changelog

### Version 0.1.3
- Improved video quality and performance
- Enhanced connection stability
- Updated UI components

---

Made with ❤️ by [Springr Creatives](https://github.com/Springr-Creatives)
