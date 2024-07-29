# Flutter Demo Sample

This repository contains a Flutter application developed as a technical assessment project.

## Getting Started

### Pre-setup Steps

- Flutter SDK: [Install Flutter](https://flutter.dev/docs/get-started/install)
- Dart SDK: Included with Flutter installation.
- A code editor like [VS Code](https://code.visualstudio.com/) or [Android Studio](https://developer.android.com/studio).

### Installation

1. **Clone the repository:**

    ```bash
    git clone https://github.com/mufayed/flutter-demo-sample.git
    cd flutter-demo-sample
    ```

2. **Install dependencies:**

    ```bash
    flutter pub get
    ```

3. **Run the application:**

    ```bash
    flutter run
    ```

## Project Structure

The project follows a structured clean code approach, with the main directories as follows:

- `lib/`: Contains the main source code for the application.
  - `core/`: Contains core utilities, styles, and shared components.
  - `domain/`: Contains business logic and entities.
  - `data/`: Contains data handling logic and repositories.
  - `presentation/`: Contains the UI layer, including widgets and screens.

## Dependencies

- **flutter_bloc**: ^8.1.6
- **equatable**: ^2.0.5
- **intl**: ^0.17.0
- **sizer**: ^2.0.15
- **google_fonts**: ^6.2.1
- **flutter_svg**: ^2.0.10+1
- **get_it**: ^7.7.0
