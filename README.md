# SwiftUIMVVM Demo

This project is a demo app that showcases the use of SwiftUI and the MVVM architecture pattern on iOS 15.

## Features
- List of items fetched from a remote API
- Detail view for each item
- Search functionality to filter items
- Pull-to-refresh to update the list

## Requirements
- Xcode 13
- iOS 15

## Installation
1. Clone the repository: git clone https://github.com/abhiiOSdev/SwiftUIMVVMDemo.git
2. Open the Xcode project: open project-name.xcodeproj
3. Build and run the app

## Usage
The app will display a list of items fetched from the remote API. Tapping on an item will show the detail view. You can use the search bar to filter the list of items by name. Pulling down on the list will trigger a refresh of the data.

## Architecture
The app follows the MVVM architecture pattern, with the following components:

- Model: Represents the data to be displayed in the app, and provides methods for fetching and updating the data.
- View: Displays the UI elements and interacts with the user.
- ViewModel: Acts as a middleman between the Model and the View, providing the data and methods needed to update the UI.
The app also uses SwiftUI for the UI elements, which allows for declarative and reactive programming.

## License
This project is licensed under the MIT License.
