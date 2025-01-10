# Firebase Learning
This repository contains projects and experiments created while learning Firebase integration with iOS applications. The primary focus is on understanding Firebase features such as authentication, database in iOS development.

## Features
- Firebase Authentication
- Real-time Database
- Firestore Integration
- User Management (Login, Sign-up, Password Reset, Account Deletion)
- State Management with SwiftUI
- Customized Navigation

## Technologies Used
- **Programming Language**: Swift
- **Frameworks**: SwiftUI, UIKit
- **Firebase Tools**: Authentication, Firestore, Realtime Database
- **Development Tools**: Xcode

## Prerequisites
Ensure you have the following installed:
- Xcode (Version 14 or above recommended)
- A configured Firebase project with the necessary `GoogleService-Info.plist` file

## Demo Video
https://github.com/user-attachments/assets/0403c956-20a7-48ac-a73e-41ed87c2fd3d

## Getting Started
1. Clone the repository:
   ```bash
   git clone https://github.com/AnketKohak/FireBase-Learning.git
   ```

2. Add your `GoogleService-Info.plist` file to the project.
3. Build and run the application on a simulator or a real device.

## Main Functionality
The core functionality of this repository is implemented in the `AuthViewModel`. Below is a breakdown of its features:

### Authentication
- **Login**: Allows users to log in with an email and password.
- **Sign-up**: Enables user account creation with email, full name, and password.
- **Password Reset**: Provides the ability to reset a forgotten password via email.

### User Management
- **Store User in Firestore**: Saves user details (UID, email, full name) to Firestore during sign-up.
- **Fetch User Details**: Retrieves user data from Firestore based on UID.
- **Delete Account**: Deletes the user account and corresponding Firestore document.

### Session Management
- **Load User**: Automatically loads the current user session if the user is already authenticated.
- **Sign Out**: Ends the current user session and clears session data.

### Error Handling
- The `isError` property is used to handle errors during authentication and Firestore operations.

### Customized Navigation
- Includes a navigation system tailored for a seamless user experience, utilizing SwiftUI's state management.

## Structure
The `AuthViewModel` class is divided into several extensions for clarity:
1. **Login, Create, and Store**: Handles user login, account creation, and storing user data in Firestore.
2. **Sign-out and Delete Account**: Manages user sign-out and account deletion functionality.
3. **Load and Fetch**: Deals with loading the current session and fetching user details from Firestore.

## Contributing
Contributions are welcome! If you would like to contribute to this project, please follow these steps:
1. Fork the repository.
2. Create a new branch for your feature or bug fix.
   ```bash
   git checkout -b feature-name
   ```
3. Commit your changes.
   ```bash
   git commit -m "Add some feature"
   ```
4. Push to your branch.
   ```bash
   git push origin feature-name
   ```
5. Create a pull request.

## License
This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.

## Contact
For any inquiries, feel free to contact me:
- **Email**: anketkohak40@gmail.com
- **LinkedIn**: [Your LinkedIn Profile](#)
