# Flutter To-Do App

A simple Flutter-based To-Do application that allows users to manage their tasks efficiently. Users can add, edit, delete, and view their to-do items with a clean and responsive UI.

## Features

- **Add To-Do**: Create new to-do items with a title and description.
- **Edit To-Do**: Modify existing to-do items.
- **Delete To-Do**: Remove unwanted to-do items.
- **View To-Do List**: Display all to-do items in a list format.
- **API Integration**: Interacts with a backend API for data persistence.
- **User Feedback**: Displays success and error messages using snackbars.

## Project Structure

```
lib/
├── main.dart                 # Entry point of the application
├── screens/
│   ├── add_page.dart         # Screen for adding/editing a to-do
│   ├── todo_list.dart        # Screen for displaying the list of to-dos
├── services/
│   └── todo_services.dart    # Handles API calls for to-do operations
├── utils/
│   └── snackbar_helpers.dart # Utility functions for showing snackbars
└── widgets/
    └── todo_card.dart        # Widget for displaying individual to-do items
```

## Installation

1. Clone the repository:
   ```bash
   git clone https://github.com/your-username/flutter-todo-app.git
   cd flutter-todo-app
   ```
2. Install dependencies:
   ```bash
   flutter pub get
   ```
3. Run the application:
   ```bash
   flutter run
   ```

## API Endpoints

The app interacts with the following API endpoints:

- **GET** `/todos` - Fetch all to-dos.
- **POST** `/todos` - Add a new to-do.
- **PUT** `/todos/{id}` - Update an existing to-do.
- **DELETE** `/todos/{id}` - Delete a to-do.

## Dependencies

The project uses the following dependencies:

- `flutter` - Flutter SDK
- `http` - For making API requests
- `cupertino_icons` - For iOS-style icons

Refer to the `pubspec.yaml` file for the complete list of dependencies.

## Screenshots

| Add/Edit Todo Page | Todo List Page |
|--------------------|---------------|
| ![Add/Edit Todo](path/to/add_edit_screenshot.png) | ![Todo List](path/to/todo_list_screenshot.png) |

## Contributing

Contributions are welcome! Please follow these steps:

1. Fork the repository.
2. Create a new branch for your feature or bug fix.
3. Commit your changes and push them to your fork.
4. Submit a pull request.

## License

This project is licensed under the MIT License. See the `LICENSE` file for details.

