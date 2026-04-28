## 💬 Chat Application (WhatsApp UI Clone)

This project is a **real-time chat application UI** inspired by WhatsApp, focusing on **clean architecture, scalable code, and high-quality UI implementation**.

---

### 🎯 Project Objective
To build a **feature-rich chat application** with:
- Modern messaging UI
- Support for multiple message types
- Clean and maintainable architecture
- Improved code quality using advanced concepts

---

### 💬 Core Features

#### 📩 Messaging
- Send & receive text messages
- Real-time chat UI updates

#### 📎 Media Sharing
- Send Images
- Send Videos
- Send Audio
- Send Documents

#### 👥 Chat Experience
- One-to-one chat interface
- Message bubbles (sender/receiver)
- Timestamp display
- Smooth scrolling chat list

---

### 🎨 UI Design
- WhatsApp-inspired UI
- Clean chat layout with message bubbles
- Custom widgets for messages
- Responsive and smooth user experience

---

### 🧠 State Management (Cubit)
- Managed chat states using Cubit
- States handled:
  - Loading
  - Success (Messages Loaded)
  - Error
- Reactive UI updates based on state changes

---

### 💾 Local Storage
- Used SharedPreferences for storing:
  - Chat data (basic)
  - User session

---

### 🏗️ Clean Architecture
- Structured into:
  - Presentation Layer (UI + Cubit)
  - Domain Layer (Entities + UseCases)
  - Data Layer (Local Storage)

Benefits:
- Loose coupling between components
- Better testability
- Easy to scale and maintain

---

### 🔌 Dependency Injection
- Implemented using GetIt
- Decoupled class dependencies
- Improved code modularity

---

### 🧩 Code Quality Improvements

#### 🔹 Enhanced Enums
- Used enums to represent:
  - Message types (text, image, video, audio, document)
  - Chat states
- Improved readability and type safety
- Reduced hardcoded values (strings)

#### 🔹 Loose Coupling
- Separation of concerns
- Independent layers
- Easier to modify and extend features


