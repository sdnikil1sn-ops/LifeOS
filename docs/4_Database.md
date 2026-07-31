# LifeOS Database Design

Version: v0.1.0-alpha

---

# Database Technology

- SQLite
- Drift ORM
- Offline First
- Fully Local Storage

---

# Design Principles

- Normalize data
- Avoid duplication
- Fast queries
- Easy backup
- Scalable
- Modular

---

# Database Tables

## 1. Categories

Purpose

Stores task categories.

Columns

- id
- name
- icon
- color
- createdAt

---

## 2. Tasks

Purpose

Stores master task information.

Columns

- id
- title
- description
- categoryId
- priority
- difficulty
- estimatedDuration
- repeatRule
- reminderTime
- startDate
- endDate
- status
- archived
- createdAt
- updatedAt

---

## 3. TaskOccurrences

Purpose

Generated daily instances of recurring tasks.

Columns

- id
- taskId
- occurrenceDate
- completed
- completedAt
- actualDuration
- notes

---

## 4. Habits

Columns

- id
- taskId
- currentStreak
- longestStreak
- successRate

---

## 5. HabitHistory

Columns

- id
- habitId
- date
- completed

---

## 6. Tags

Columns

- id
- name

---

## 7. TaskTags

Columns

- taskId
- tagId

---

## 8. Notes

Columns

- id
- taskId
- content
- createdAt

---

## 9. Attachments

Columns

- id
- taskId
- filePath
- type

---

## 10. Reminders

Columns

- id
- taskId
- notificationTime
- enabled

---

## 11. DailyRecords

Stores each day's summary.

Columns

- id
- date
- completedTasks
- totalTasks
- productivityScore
- timeSpent

---

## 12. AnalyticsCache

Stores pre-calculated analytics.

Columns

- id
- month
- completionRate
- bestCategory
- worstCategory

---

## 13. Settings

Columns

- id
- theme
- notificationsEnabled
- backupEnabled
- language

---

## 14. Backups

Columns

- id
- backupDate
- filePath
- version
---

# Relationships

Category

↓

Tasks

↓

TaskOccurrences

↓

DailyRecords

Task

↓

Notes

Task

↓

Attachments

Task

↓

Reminders

Task

↓

TaskTags

↓

Tags

Task

↓

Habit

↓

HabitHistory
Categories
      │
      │ 1
      │
      ▼
Tasks
      │
 ┌────┼───────────────┐
 │    │       │       │
 ▼    ▼       ▼       ▼
Notes Attach Reminders TaskOccurrences
                       │
                       ▼
                   DailyRecords

Tasks
 │
 ▼
Habits
 │
 ▼
HabitHistory

Tasks
 │
 ▼
TaskTags
 │
 ▼
Tags