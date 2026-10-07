# Swift Notification Center

A Swift UIKit project demonstrating how to implement a custom notification system using `NotificationCenter`.

The project contains two screens: a **Sender** that posts a custom notification and a **Receiver** that observes the notification and updates its UI when the event is received.

## 📱 Features

- Custom notifications using `NotificationCenter`
- Posting notifications from a UIKit view controller
- Observing notifications with `addObserver`
- Handling notifications with `@objc` and `#selector`
- Updating UI when a notification is received
- Removing observers properly in `deinit`
- Navigation between Sender and Receiver using a `UITabBarController`

## 🧠 Concepts Practiced

### NotificationCenter

`NotificationCenter` allows different parts of an application to communicate without having a direct reference to each other.

The basic flow is:

```text
Sender
   ↓
post()
   ↓
NotificationCenter
   ↓
Observer
   ↓
handleNotification()
   ↓
UI Update
```

The Sender does not need to know who is listening to the notification.

### Custom Notification Names

Custom notification names are defined using an extension of `Notification.Name`:

```swift
extension Notification.Name {
    static let customNotification =
        Notification.Name("customNotification")
}
```

This allows the notification to be referenced safely and consistently:

```swift
NotificationCenter.default.post(
    name: .customNotification,
    object: nil
)
```

### Observing Notifications

The Receiver registers itself as an observer:

```swift
NotificationCenter.default.addObserver(
    self,
    selector: #selector(handleNotification),
    name: .customNotification,
    object: nil
)
```

When the notification is posted, `NotificationCenter` calls the corresponding handler.

### Handling Notifications

The handler is exposed to Objective-C runtime using `@objc`:

```swift
@objc func handleNotification(_ notification: Notification) {
    messageLabel.text = "Notification received!"
}
```

The `#selector` used during registration points to this method.

### Removing Observers

The observer is removed when the view controller is deallocated:

```swift
deinit {
    NotificationCenter.default.removeObserver(self)
}
```

This prevents an object that no longer exists from remaining registered as an observer.

## 🏗️ Project Structure

```text
SwiftNotificationCenter/
├── AppDelegate.swift
├── SceneDelegate.swift
├── Main.storyboard
│
├── Notifications/
│   └── AppNotifications.swift
│
└── ViewControllers/
    ├── SenderViewController.swift
    └── ReceiverViewController.swift
```

## 📂 Source Files

### `AppNotifications.swift`

Defines the custom notification name used throughout the application.

### `SenderViewController.swift`

Posts the custom notification when the user presses the **Send Notification** button.

```swift
NotificationCenter.default.post(
    name: .customNotification,
    object: nil
)
```

### `ReceiverViewController.swift`

Registers as an observer, handles the notification, updates the label, and removes itself from `NotificationCenter` when deallocated.

## 🔄 Application Flow

1. The application starts on the **Sender** screen.
2. The user presses **Send Notification**.
3. `SenderViewController` posts `.customNotification`.
4. `NotificationCenter` delivers the event to registered observers.
5. `ReceiverViewController` receives the notification.
6. The Receiver updates its label to **"Notification received!"**.
7. The observer is removed when the Receiver is deallocated.

## 🛠️ Technologies

- Swift
- UIKit
- NotificationCenter
- Storyboards
- Xcode

## 🎯 Learning Objective

This project was created to understand the **Observer Pattern** in iOS and learn how `NotificationCenter` can be used for decoupled communication between different components of an application.
