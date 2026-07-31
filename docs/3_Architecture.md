# LifeOS Architecture

Version: v0.1.0-alpha

---

# Architecture Style

LifeOS follows a layered Clean Architecture combined with a Feature-First project structure.

```
Presentation Layer
        │
Business Logic Layer
        │
Repository Layer
        │
Database Layer
        │
SQLite (Drift)
```

---

# Layers

## Presentation

Responsible for:

- UI
- Screens
- Widgets
- Themes
- Navigation

---

## Business Logic

Responsible for:

- Task Engine
- Habit Engine
- Analytics Engine
- Reminder Engine

---

## Repository

Acts as a bridge between business logic and database.

Responsibilities:

- CRUD operations
- Queries
- Transactions

---

## Database

Uses Drift ORM with SQLite.

Responsible for:

- Local storage
- Relationships
- Indexes
- Migrations

---

# Core Modules

LifeOS Core

- Dashboard
- Tasks
- Calendar
- Habits
- Analytics
- Reports
- Notifications
- Backup
- Settings

Future Modules

- Finance
- Health
- Notes
- Journal
- AI Assistant

---

# Principles

- Offline First
- Feature First
- Modular
- Scalable
- Testable
- Maintainable

---

# Design Goals

- Fast startup
- Simple navigation
- High performance
- Low battery usage
- Minimal memory usage