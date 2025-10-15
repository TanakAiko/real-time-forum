# Real-Time Forum

A modern, real-time forum application built with a microservices architecture using Go and vanilla JavaScript. This project features real-time messaging, post interactions, and a complete authentication system.

<div align="center">

![Go](https://img.shields.io/badge/Go-00ADD8?style=for-the-badge&logo=go&logoColor=white)
![JavaScript](https://img.shields.io/badge/JavaScript-F7DF1E?style=for-the-badge&logo=javascript&logoColor=black)
![Docker](https://img.shields.io/badge/Docker-2496ED?style=for-the-badge&logo=docker&logoColor=white)
![WebSocket](https://img.shields.io/badge/WebSocket-010101?style=for-the-badge&logo=socketdotio&logoColor=white)
![SQLite](https://img.shields.io/badge/SQLite-003B57?style=for-the-badge&logo=sqlite&logoColor=white)
![HTML5](https://img.shields.io/badge/HTML5-E34F26?style=for-the-badge&logo=html5&logoColor=white)
![CSS3](https://img.shields.io/badge/CSS3-1572B6?style=for-the-badge&logo=css3&logoColor=white)
![Microservices](https://img.shields.io/badge/Microservices-FF6B6B?style=for-the-badge&logo=micro&logoColor=white)

</div>

<details>
<summary>📋 Table of Contents</summary>

- [Real-Time Forum](#real-time-forum)
  - [🎯 Overview](#-overview)
  - [📸 Screenshots](#-screenshots)
    - [Login Page](#login-page)
    - [Register Page](#register-page)
    - [Home Page](#home-page)
  - [✨ Features](#-features)
  - [🏗️ Architecture](#️-architecture)
  - [🛠️ Tech Stack](#️-tech-stack)
    - [Backend](#backend)
    - [Frontend](#frontend)
  - [📦 Prerequisites](#-prerequisites)
  - [🚀 Installation](#-installation)
    - [1. Clone the Repository](#1-clone-the-repository)
    - [2. Initialize and Update Submodules](#2-initialize-and-update-submodules)
    - [3. Build and Run with Docker](#3-build-and-run-with-docker)
  - [🎮 Usage](#-usage)
  - [📁 Project Structure](#-project-structure)
  - [🔗 Submodules](#-submodules)
    - [Working with Submodules](#working-with-submodules)
  - [🔌 API Services](#-api-services)
    - [Gateway (Port 8080)](#gateway-port-8080)
    - [AuthAPI](#authapi)
    - [PostAPI](#postapi)
    - [CommentAPI](#commentapi)
    - [ChatAPI](#chatapi)
  - [💻 Development](#-development)
    - [Running Services Individually](#running-services-individually)
    - [Stopping the Application](#stopping-the-application)
    - [Viewing Logs](#viewing-logs)
  - [🤝 Contributing](#-contributing)

</details>

## 🎯 Overview

This real-time forum application demonstrates a microservices architecture with separate services for authentication, posts, comments, and real-time chat functionality. All services communicate through a central gateway and are containerized using Docker.

For the original project specifications, click [here](https://github.com/01-edu/public/tree/master/subjects/real-time-forum).

## 📸 Screenshots

### Login Page
![Login Page](img/Screenshot%20from%202025-10-15%2002-54-29.png)
*Secure user authentication interface*

### Register Page
![Register Page](img/Screenshot%20from%202025-10-15%2002-56-26.png)
*User registration with form validation*

### Home Page
![Home Page](img/Screenshot%20from%202025-10-15%2003-05-35.png)
*Main forum view with posts, comments, real-time chat, and notifications*

## ✨ Features

- **User Authentication**: Secure registration and login system
- **Real-time Chat**: WebSocket-based instant messaging
- **Post Management**: Create, read, and interact with posts
- **Comment System**: Add comments to posts
- **Like/Dislike**: React to posts and comments
- **User Profiles**: View user information and activity
- **Notifications**: Real-time notifications for user interactions
- **Responsive Design**: Modern and clean UI

## 🏗️ Architecture

This application follows a microservices architecture:

```
┌─────────────┐
│   Frontend  │ (Port 8089)
│  (clientJS) │
└──────┬──────┘
       │
       ▼
┌─────────────┐
│   Gateway   │ (Port 8080)
└──────┬──────┘
       │
       ├─────────┬─────────┬─────────┐
       ▼         ▼         ▼         ▼
   ┌────────┐ ┌────────┐ ┌────────┐ ┌────────┐
   │ AuthAPI│ │PostAPI │ │CommentAPI│ChatAPI │
   └────────┘ └────────┘ └────────┘ └────────┘
```

## 🛠️ Tech Stack

### Backend
- **Language**: Go (Golang)
- **WebSockets**: For real-time communication
- **Database**: SQLite (per microservice)
- **Containerization**: Docker & Docker Compose

### Frontend
- **Language**: Vanilla JavaScript
- **Styling**: CSS3
- **Server**: Go HTTP server

## 📦 Prerequisites

Before you begin, ensure you have the following installed:

- [Docker](https://docs.docker.com/get-docker/) (v20.10+)
- [Docker Compose](https://docs.docker.com/compose/install/) (v2.0+)
- [Git](https://git-scm.com/downloads)

## 🚀 Installation

### 1. Clone the Repository

```bash
git clone https://github.com/TanakAiko/real-time-forum.git
cd real-time-forum
```

### 2. Initialize and Update Submodules

This project uses Git submodules for each microservice. Initialize them with:

```bash
git submodule update --init --recursive
```

To update submodules to their latest commits:

```bash
git submodule update --remote --merge
```

### 3. Build and Run with Docker

The easiest way to run the application is using the provided script:

```bash
./script/run.sh
```

Or manually with Docker Compose:

```bash
docker-compose up --build
```

## 🎮 Usage

Once the application is running:

1. **Access the application**: Open your browser and navigate to:
   ```
   http://localhost:8089
   ```

2. **Register a new account**: Click on the register button and create your account

3. **Login**: Use your credentials to log in

4. **Start using the forum**:
   - Create posts
   - Comment on posts
   - Like/Dislike content
   - Chat with other users in real-time
   - View notifications

## 📁 Project Structure

```
real-time-forum/
├── backend/
│   ├── gateway/              # API Gateway (submodule)
│   └── services/
│       ├── authAPI/          # Authentication service (submodule)
│       ├── postAPI/          # Post management service (submodule)
│       ├── commentAPI/       # Comment service (submodule)
│       └── chatAPI/          # Real-time chat service (submodule)
├── frontend/
│   └── clientJS/             # Frontend application (submodule)
├── script/
│   ├── init.sh               # Initialization script
│   ├── push.sh               # Git push helper
│   └── run.sh                # Run application script
├── docker-compose.yml        # Docker orchestration
└── README.md                 # This file
```

## 🔗 Submodules

This project is organized using Git submodules for better modularity:

| Submodule | Repository | Description |
|-----------|------------|-------------|
| `backend/gateway` | [gateway](https://github.com/TanakAiko/gateway) | API Gateway - Routes requests to microservices |
| `backend/services/authAPI` | [authAPI](https://github.com/TanakAiko/authAPI) | Authentication and session management |
| `backend/services/postAPI` | [postAPI](https://github.com/TanakAiko/postAPI) | Post creation and retrieval |
| `backend/services/commentAPI` | [commentAPI](https://github.com/TanakAiko/commentAPI) | Comment management |
| `backend/services/chatAPI` | [chatAPI](https://github.com/TanakAiko/chatAPI) | Real-time chat functionality |
| `frontend/clientJS` | [clientJS](https://github.com/TanakAiko/clientJS) | Frontend application |

### Working with Submodules

**Pull latest changes from all submodules:**
```bash
git submodule update --remote --merge
git add .
git commit -m "Update submodules to latest commits"
git push
```

**Make changes in a submodule:**
```bash
cd backend/services/authAPI
# Make your changes
git add .
git commit -m "Your commit message"
git push
cd ../../..
git add backend/services/authAPI
git commit -m "Update authAPI submodule"
git push
```

## 🔌 API Services

### Gateway (Port 8080)
Central routing service that forwards requests to appropriate microservices.

**Main Endpoints:**
- `/register` - User registration
- `/login` - User authentication
- `/authorized` - Check authentication status
- `/getUserData` - Get user information
- `/getChats` - Retrieve chat history
- `/ws` - WebSocket connection for real-time features

### AuthAPI
Handles user authentication and session management.

### PostAPI
Manages post creation, retrieval, and interactions (likes/dislikes).

### CommentAPI
Handles comment creation and management for posts.

### ChatAPI
Provides real-time messaging functionality using WebSockets.

## 💻 Development

### Running Services Individually

Each service can be run independently for development:

```bash
# Run a specific service
cd backend/services/authAPI
go run main.go
```

### Stopping the Application

```bash
docker-compose down
```

To remove volumes as well:

```bash
docker-compose down -v
```

### Viewing Logs

```bash
# All services
docker-compose logs -f

# Specific service
docker-compose logs -f gateway
docker-compose logs -f authapi
```

## 🤝 Contributing

1. Fork the project
2. Create your feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit your changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

---

**Note**: Make sure all submodules are properly initialized before running the application. If you encounter any issues, try running `git submodule update --init --recursive` again.

---

<div align="center">

**⭐ Star this repository if you found it helpful! ⭐**

Made with ❤️ from 🇸🇳

</div>