# To-Do List App

A SwiftUI To-Do List App that demonstrates multi-screen navigation, task management, drag-and-drop reordering, and data persistence using UserDefaults. The app supports dark mode, custom theming, and smooth animations.

## Features

- **Multi-Screen Navigation**  
  Navigate seamlessly between the Task List, Task Detail, and New Task screens using `NavigationStack` and `NavigationLink`.

- **Task Management**  
  - Add new tasks with a title and description.
  - Mark tasks as completed using a checkbox.
  - Automatically move completed tasks to the bottom of the list.
  - Delete tasks with swipe actions.

- **Drag & Drop Reordering**  
  Reorder tasks manually via drag and drop (enabled by an `EditButton`).

- **Data Persistence**  
  Store tasks in `UserDefaults` so that the task list remains intact across app launches.

- **Custom Theming & Animations**  
  Enjoy a custom design with rounded borders and interactive UI elements, with support for dark mode and smooth animations.

## Requirements

- **iOS 15.0+**
- **Xcode 13+**

## Installation

1. **Clone the Repository:**  
   `git clone https://github.com/yourusername/ToDoListApp.git`

2. **Open the Project in Xcode:**  
   - Navigate to the project directory and open `ToDoListApp.xcodeproj`.

3. **Build and Run:**  
   - Select a simulator or your device, then press `Cmd + R` to build and run the app.

## Usage

### Adding a Task

- Tap the **"Add Task"** button in the navigation bar.
- Enter the task title and description in the provided fields.
- Tap the custom animated button to add the task.

### Marking Tasks as Completed

- Tap the checkbox on the left side of a task row to toggle its completion status.
- Completed tasks automatically move to the bottom of the list and are styled with a strikethrough.

### Reordering Tasks

- Tap the **Edit** button in the navigation bar.
- Drag tasks to rearrange their order.

### Viewing Task Details

- Tap on a task (the text portion) to view its detailed information.

## Architecture

### SwiftUI Views

- **ContentView.swift** – The main view that contains the navigation stack.
- **ListTaskView.swift** – Displays the list of tasks using custom-designed task rows.
- **TaskDetailView.swift** – Shows detailed information for a selected task.
- **NewTaskView.swift** – Provides a form for creating new tasks.
- **ToggleView.swift** – Offers dark mode toggling functionality.

### Model

- **Task.swift** – Defines the task model, including properties for title, description, and completion status.

### ViewModel

- **TaskViewModel.swift** – Manages task data, including adding, deleting, toggling completion, reordering, and persisting tasks using UserDefaults.

## Future Improvements

- Enhance the UI/UX with additional animations and custom themes.
- Implement more filtering and sorting options.
- Integrate cloud-based persistence (e.g., iCloud) for cross-device synchronization.
- Add notifications or reminders for tasks.

## Credits

- Developed by **Abdullah Hafiz**
- Designed using **SwiftUI** and following Apple’s Human Interface Guidelines.

## Contributing

Contributions are welcome! If you’d like to improve the app, please fork the repository and submit a pull request. For major changes, open an issue first to discuss your ideas.

## License

This project is for learning purposes
