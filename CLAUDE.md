# Popin iOS SDK — Architecture & Design Patterns

## Pattern: VIP + Service Layer

This codebase uses **VIP (View → Interactor → Presenter)** for API-driven flows, combined with a **Service Layer** for domain logic and a **Facade** (`Popin.shared`) as the SDK entry point.

---

## Layer Responsibilities

### Interactor (`PopinCall/VIP/*Interactor.swift`)
- Owns raw network/data calls only.
- All methods are `async throws`.
- Decodes responses into models; throws `InteractorError` on failure.
- No UI, no callbacks, no MainActor dispatch — just pure data work.

```swift
func getCallDetails(callId: Int) async throws -> TalkModel { ... }
```

### Presenter (`PopinCall/VIP/*Presenter.swift`)
- Takes an Interactor via `init` (dependency injection).
- Wraps `async throws` calls in `Task { }`.
- Always dispatches results back via `await MainActor.run { callback() }`.
- Exposes closure-based `onSuccess`/`onFailure` API to callers.
- No SwiftUI, no UIKit imports — plain Foundation.

```swift
func getCallDetails(callId: Int, onSuccess: @escaping (TalkModel) -> Void, onFailure: @escaping () -> Void) {
    Task {
        do {
            let model = try await interactor.getCallDetails(callId: callId)
            await MainActor.run { onSuccess(model) }
        } catch {
            await MainActor.run { onFailure() }
        }
    }
}
```

### ViewModel (`PopinCall/VIP/VideoCallViewModel.swift`)
- `ObservableObject` with `@Published` properties for SwiftUI state.
- Holds closures (`onEndCall`, `onNetworkFailure`, etc.) that are set by the ViewController.
- No business logic — pure state container.

### Service / Coordinator (`PopinCall/Services/`)
- `CallOrchestrator` — call lifecycle state machine. Communicates purely via closures; never references `Popin.shared`.
- `CallUICoordinator` — owns VC presentation/dismissal. Also closure-based upward communication.
- `CallManager` — CallKit + PushKit. Uses the delegate pattern (`CallManagerDelegate`) for its output.
- `PopinPusher` — Pusher connection. Uses the delegate pattern (`PopinPusherDelegate`) for its output.

### Facade (`PopinCall/Core/Popin.swift`)
- The only place that wires everything together (`wireCallbacks()`).
- Sets closure callbacks between Orchestrator, UICoordinator, and the public `PopinEventsListener`.
- All public SDK methods live here.

---

## Rules for New Code

1. **New API call?** Add `async throws` method to the relevant Interactor. Add a closure-based wrapper in the relevant Presenter. Do not add network code anywhere else.

2. **New domain logic?** Add it to the relevant Service (or a new one). Services communicate upward via closures set by their owner — never by calling `Popin.shared` directly.

3. **New UI state?** Add `@Published` properties to `VideoCallViewModel`. Never add UIKit or business logic to a ViewModel.

4. **New public SDK event?** Add to `PopinEventsListener`, wire it through the chain in `Popin.wireCallbacks()`.

5. **Dependency injection:** Presenters receive their Interactor in `init`. Services receive dependencies in `init` where possible. Avoid adding new references to singletons inside service/presenter bodies.

6. **No circular references:** Services and Orchestrators must not reference `Popin.shared`. Use closures set by the Facade to communicate back up.

7. **Thread safety:** Interactors are `async`-safe. All UI/callback dispatch must use `await MainActor.run { }` or `DispatchQueue.main.async { }`.

8. **UIKit guard:** Any UIKit-dependent code must be wrapped in `#if canImport(UIKit)`.

---

## File Naming Convention
- `*Interactor.swift` — network/data layer
- `*Presenter.swift` — orchestrates Interactor, exposes closure API
- `*ViewModel.swift` — SwiftUI `@Published` state
- `*Service.swift` / named domain classes — business logic services
- `*Coordinator.swift` — UI or flow coordination
