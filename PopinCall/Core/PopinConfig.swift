//
//  PopinConfig.swift
//  PopinCall
//
//  Created by Ashwin Nath.
//

import Foundation

public class PopinConfig {

    // MARK: - Immutable properties (set via Builder)

    public let userName: String
    public let contactInfo: String
    public let sandboxMode: Bool
    public weak var initListener: PopinInitListener?
    public weak var eventsListener: PopinEventsListener?
    public let hideDisconnectButton: Bool
    public let hideScreenShareButton: Bool
    public let hideFlipCameraButton: Bool
    public let hideMuteVideoButton: Bool
    public let hideMuteAudioButton: Bool
    public let hideBackButton: Bool
    public let persistenceMode: Bool

    // MARK: - Mutable runtime state

    public var product: PopinProduct?
    public var callerId: String?
    public var meta: [String: String]

    // MARK: - Init (via Builder)

    fileprivate init(builder: Builder) {
        self.userName = builder.userName
        self.contactInfo = builder.contactInfo
        self.sandboxMode = builder.sandboxMode
        self.initListener = builder.initListener
        self.eventsListener = builder.eventsListener
        self.hideDisconnectButton = builder.hideDisconnectButton
        self.hideScreenShareButton = builder.hideScreenShareButton
        self.hideFlipCameraButton = builder.hideFlipCameraButton
        self.hideMuteVideoButton = builder.hideMuteVideoButton
        self.hideMuteAudioButton = builder.hideMuteAudioButton
        self.hideBackButton = builder.hideBackButton
        self.persistenceMode = builder.persistenceMode
        self.product = builder.product
        self.callerId = builder.callerId
        self.meta = builder.meta
    }

    // MARK: - Builder

    public class Builder {
        var userName: String = ""
        var contactInfo: String = ""
        var sandboxMode: Bool = false
        var initListener: PopinInitListener?
        var eventsListener: PopinEventsListener?
        var hideDisconnectButton: Bool = false
        var hideScreenShareButton: Bool = false
        var hideFlipCameraButton: Bool = false
        var hideMuteVideoButton: Bool = false
        var hideMuteAudioButton: Bool = false
        var hideBackButton: Bool = false
        var persistenceMode: Bool = true
        var product: PopinProduct?
        var callerId: String?
        var meta: [String: String] = [:]

        public init() {}

        @discardableResult
        public func userName(_ userName: String) -> Builder {
            self.userName = userName
            return self
        }

        @discardableResult
        public func contactInfo(_ contactInfo: String) -> Builder {
            self.contactInfo = contactInfo
            return self
        }

        @discardableResult
        public func sandboxMode(_ sandboxMode: Bool) -> Builder {
            self.sandboxMode = sandboxMode
            return self
        }

        @discardableResult
        public func initListener(_ listener: PopinInitListener) -> Builder {
            self.initListener = listener
            return self
        }

        @discardableResult
        public func eventsListener(_ listener: PopinEventsListener) -> Builder {
            self.eventsListener = listener
            return self
        }

        @discardableResult
        public func hideDisconnectButton(_ hide: Bool) -> Builder {
            self.hideDisconnectButton = hide
            return self
        }

        @discardableResult
        public func hideScreenShareButton(_ hide: Bool) -> Builder {
            self.hideScreenShareButton = hide
            return self
        }

        @discardableResult
        public func hideFlipCameraButton(_ hide: Bool) -> Builder {
            self.hideFlipCameraButton = hide
            return self
        }

        @discardableResult
        public func hideMuteVideoButton(_ hide: Bool) -> Builder {
            self.hideMuteVideoButton = hide
            return self
        }

        @discardableResult
        public func hideMuteAudioButton(_ hide: Bool) -> Builder {
            self.hideMuteAudioButton = hide
            return self
        }

        @discardableResult
        public func hideBackButton(_ hide: Bool) -> Builder {
            self.hideBackButton = hide
            return self
        }

        @discardableResult
        public func persistenceMode(_ persistenceMode: Bool) -> Builder {
            self.persistenceMode = persistenceMode
            return self
        }

        @discardableResult
        public func product(_ product: PopinProduct) -> Builder {
            self.product = product
            return self
        }

        @discardableResult
        public func callerId(_ callerId: String) -> Builder {
            self.callerId = callerId
            return self
        }

        @discardableResult
        public func meta(_ meta: [String: String]) -> Builder {
            self.meta = meta
            return self
        }

        public func build() -> PopinConfig {
            return PopinConfig(builder: self)
        }
    }
}
