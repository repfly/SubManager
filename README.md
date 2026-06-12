# SubManager

SubManager is a Swift package designed to provide necessary tools and components to make the rapid development process easier. It includes various modules that can be used independently or combined to build robust and feature-rich applications.

## Features

SubManager offers the following key features:

- **ComponentKit**: A collection of reusable SwiftUI components to enhance your user interface, including `DatePickerView`, `EmptyStateView`, `LottieView`, `SheetView`, and `ToggleSwitch`.

- **NetworkKit**: A networking module that simplifies HTTP requests and provides an easy-to-use API for sending requests, handling responses, and managing sessions.

- **SubscriptionKit**: A module for managing in-app subscriptions, including the `PurchaseService` class for handling purchases and restoring previous purchases.

- **ThemeKit**: A theming module that allows you to define and manage themes in your app. The `ThemeManager` class helps you apply and manage themes throughout your application.

- **UtilityKit**: A collection of useful extensions to extend the functionality of Swift built-in types, including `Array` and `String`.

- **Views**: Ready-to-use views that can be easily integrated into your SwiftUI-based projects. The `LandingPage` view provides a customizable landing page with horizontal scrolling, page indicators, and skip/dismiss functionality.

## Installation

SubManager can be easily integrated into your project using the Swift Package Manager (SPM). Simply add SubManager as a dependency in your `Package.swift` file:

```swift
dependencies: [
    .package(url: "https://github.com/your-account/SubManager.git", .upToNextMajor(from: "1.0.0"))
]
```
## Usage
To use SubManager's modules and components in your project, import the appropriate module into your file. For example, to use the ComponentKit components, import the ComponentKit module:

```swift
import SubManager.ComponentKit
```
Then, you can directly use the available components, such as `DatePickerView`, `EmptyStateView`, etc., in your SwiftUI views.

To make use of the other modules like `NetworkKit`, `SubscriptionKit`, `ThemeKit`, or `UtilityKit`, import the respective modules and follow the provided documentation and examples.

## Contributing
Contributions to SubManager are welcome! If you find any issues or have ideas for enhancements, please open an issue or submit a pull request on the [GitHub repository](https://github.com/repfly/SubManager).

## License
SubManager is released under the MIT license. See LICENSE for more information.

---

© 2023 Alper Yildirim
