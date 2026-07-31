# Software Requirements Specification (SRS)

**Project Name:** LifeOS

**Version:** 0.1.0-alpha

**Prepared By:** Nikil

**Technology Stack:** Flutter, Dart, Drift (SQLite), Riverpod

---

# 1. Introduction

## 1.1 Purpose

The purpose of this Software Requirements Specification (SRS) is to define the functional, non-functional, technical, and operational requirements for LifeOS. This document acts as the primary reference for designing, developing, testing, and maintaining the application throughout its lifecycle.

The SRS ensures that all stakeholders have a shared understanding of the application's goals, features, constraints, and expected behavior before implementation begins.

---

## 1.2 Scope

LifeOS is an offline-first intelligent productivity application designed to help users organize recurring tasks, habits, schedules, notes, reminders, and productivity reports.

The application focuses on privacy, local data storage, and intelligent analytics without requiring cloud services.

The initial release (v1.0.0) will include:

- Task Management
- Recurring Task Engine
- Calendar
- Habit Tracking
- Productivity Dashboard
- Analytics
- Reports
- Backup & Restore
- Local Notifications

Future versions will expand into finance, health, notes, AI assistance, and learning management.

---

## 1.3 Definitions

| Term | Meaning |
|------|---------|
| Task | A user-created activity. |
| Habit | A recurring task tracked over time. |
| Occurrence | A generated instance of a recurring task. |
| Dashboard | Home screen summarizing user activity. |
| Report | Exportable productivity summary. |
| Streak | Consecutive successful completion count. |
| Analytics | Statistical analysis of task completion. |

---

## 1.4 Acronyms

| Acronym | Meaning |
|----------|---------|
| UI | User Interface |
| UX | User Experience |
| SRS | Software Requirements Specification |
| API | Application Programming Interface |
| CRUD | Create Read Update Delete |
| SQLite | Local Database Engine |
| PDF | Portable Document Format |

---

## 1.5 References

- Flutter Documentation
- Dart Language Documentation
- Material Design 3 Guidelines
- SQLite Documentation
- Drift ORM Documentation
- Riverpod Documentation

---

## 1.6 Document Overview

This document describes the overall functionality, architecture, requirements, interfaces, database design, security, testing strategy, and future roadmap for the LifeOS application.

It will serve as the primary engineering reference throughout development.

---

# 2. Overall Description

## 2.1 Product Perspective

LifeOS is a standalone offline-first productivity platform designed to manage daily activities, habits, recurring schedules, and productivity insights. The application stores all user data locally and does not require an internet connection for its core functionality.

The application is modular in design, allowing future expansion without major architectural changes.

Current planned modules include:

- Task Management
- Habit Tracking
- Calendar
- Analytics
- Reports
- Backup & Restore

Future modules:

- Notes
- Finance
- Health
- AI Assistant
- Study Planner
- Journal

---

## 2.2 Product Functions

The first stable release (v1.0.0) shall provide:

### Task Management
- Create tasks
- Edit tasks
- Delete tasks
- Archive tasks
- Search tasks

### Recurring Task Engine
- Daily tasks
- Weekly tasks
- Monthly tasks
- Custom recurrence
- Date range tasks
- Excluded dates

### Habit Tracking
- Streaks
- Completion history
- Consistency percentage

### Dashboard
- Daily progress
- Productivity score
- Today's schedule
- Pending tasks

### Calendar
- Monthly calendar
- Daily history
- Task timeline

### Reports
- PDF export
- CSV export
- Excel export
- JSON backup

### Analytics
- Category analysis
- Monthly productivity
- Habit analysis
- Time spent
- Completion trends

### Backup
- Local backup
- Import
- Restore

---

## 2.3 User Classes

### Student

Uses LifeOS for:

- Study planning
- Assignments
- Exams
- Coding practice

---

### Professional

Uses LifeOS for:

- Office work
- Meetings
- Projects
- Daily routines

---

### Developer

Uses LifeOS for:

- Sprint planning
- Coding schedule
- Learning roadmap
- GitHub goals

---

### Personal User

Uses LifeOS for:

- Daily routines
- Shopping
- Bills
- Health habits

---

## 2.4 Operating Environment

Platform:

Android (Primary)

Future:

- Windows
- Linux
- macOS
- Web

Framework:

Flutter

Programming Language:

Dart

Database:

SQLite (Drift)

Minimum Android Version:

Android 8.0 (API 26)

---

## 2.5 Design Constraints

- Offline-first architecture
- Local database only
- Material Design 3
- Flutter framework
- Modular architecture
- Feature-first folder structure
- No mandatory account
- Responsive UI

---

## 2.6 Assumptions

The application assumes:

- Users own one Android device.
- Device storage is available.
- Local notifications are permitted.
- Date and time are correctly configured.

---

## 2.7 Dependencies

LifeOS depends on:

Flutter SDK

Android SDK

SQLite Database

Riverpod

Drift ORM

GoRouter

FL Chart

flutter_local_notifications

PDF package

Printing package