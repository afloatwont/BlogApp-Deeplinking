# BlogApp-Deeplinking

### Prerequisites

- Flutter SDK: [Install Flutter](https://flutter.dev/docs/get-started/install)
- Firebase CLI: [Install Firebase CLI](https://firebase.google.com/docs/cli#install_the_firebase_cli)

### Setup

1. Clone the repository:
   ```sh
   git clone https://github.com/afloatwont/BlogApp-Deeplinking.git
   cd BlogApp-Deeplinking
   ```

2. Install dependencies:
   ```sh
   flutter pub get
   ```

3. Set up Firebase:
   - Follow the instructions to add Firebase to your Flutter app: [Add Firebase to your Flutter app](https://firebase.google.com/docs/flutter/setup)
   - Update `lib/firebase_options.dart` with your Firebase project configuration.

4. Run the app:
   ```sh
   flutter run
   ```

### Features

- **Blog List Screen**: Displays a list of blog posts.
- **Blog Detail Screen**: Displays the details of a selected blog post.
- **Deep Linking**: Supports deep linking to specific blog posts.
- **Firebase Integration**: Uses Firebase Firestore for storing and retrieving blog posts.
- **Error Handling**: Centralized error handling for Firebase and other errors.
- **Logging**: Uses the `logger` package for logging.

### Deep Linking

The app supports deep linking to specific blog posts. The deep link host is `zarityassignment.vercel.app`. Example deep link URL:
```
https://zarityassignment.vercel.app/blogs/{blogId}
```

### Project Structure

- `lib/main.dart`: Entry point of the application.
- `lib/core/services/`: Contains service classes for Firebase, deep linking, and storage.
- `lib/core/utils/`: Contains utility classes for logging, error handling, and constants.
- `lib/models/`: Contains data models.
- `lib/views/screens/blog/`: Contains UI screens for the blog list and blog details.

