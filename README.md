# Flutter-Node.js Starter Project

Hi, I'm Felix, a Student and Full Stack Developer. I created this open-source project to help those who are just starting out with building a server, creating a basic front-end, and connecting the two. This project serves as a simple and effective introduction to full-stack development using Flutter and Node.js.

## Overview

This project demonstrates how to:

- Set up a basic Node.js server with RESTful API endpoints.
- Build a simple Flutter front-end that interacts with the server.
- Connect the Flutter app to the Node.js backend for basic CRUD operations (Create, Read, Update, Delete).

## Requirements

Before you start, make sure you have the following software installed on your machine:

- **[Node.js](https://nodejs.org/)** (v14 or later): To run the server-side code.
- **[Flutter](https://flutter.dev/docs/get-started/install)** (v2 or later): To build and run the front-end application.
- **[Visual Studio Code (VS Code)](https://code.visualstudio.com/)**: A code editor with support for Flutter and Node.js development.
  - **Recommended Extensions**:
    - Flutter & Dart plugins for VS Code
    - Node.js Extension Pack
- **[Git](https://git-scm.com/)**: For cloning the repository.

## Getting Started

### Installation

1. **Clone the Repository**:
   ```bash
   git clone https://github.com/yourusername/flutter-nodejs-starter.git
   cd flutter-nodejs-starter
   ```

2. **Set Up the Node.js Server**:
   - Navigate to the `server` directory:
     ```bash
     cd server
     ```
   - Install the necessary dependencies:
     ```bash
     npm install
     ```
   - Start the server:
     ```bash
     node index.js
     ```
   - Your server should now be running on `http://localhost:2000`.

3. **Set Up the Flutter Front-End**:
   - Navigate to the `frontend` directory:
     ```bash
     cd ../frontend
     ```
   - Install the necessary Flutter dependencies:
     ```bash
     flutter pub get
     ```
   - Run the Flutter app on your emulator or connected device:
     ```bash
     flutter run
     ```

## Usage

- **Adding Products**: Use the Flutter app to add new products to the list. The app will send the data to the Node.js server, which will store it in memory.
- **Viewing Products**: The app displays a list of all products currently stored on the server.
- **Updating Products**: Select a product from the list to update its details.
- **Deleting Products**: Remove a product from the list by selecting the delete option.

## Contributing

Contributions are welcome! If you have ideas for improvements or find a bug, feel free to open an issue or submit a pull request.

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for more details.

## Contact

Feel free to reach out if you have any questions or need further assistance:
- **Email**: your.email@example.com
- **LinkedIn**: [Your LinkedIn Profile](https://www.linkedin.com/in/yourprofile/)
