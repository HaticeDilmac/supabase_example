# Supabase Task Manager App

A simple and beautiful **Task Manager App** built using **Flutter** and **Supabase**. This app allows users to register, log in, and manage their tasks securely using Supabase's **Row Level Security (RLS)** and real-time data sync.

---

## Features

- 🔐 User authentication (Sign up, Sign in, Sign out)
- 🧾 Add / Edit / Delete tasks
- ✅ Toggle task completion status
- 📡 Real-time task list updates via Supabase stream
- 🎨 Clean, responsive, and modern Flutter UI
- 🛡️ Data security using Supabase RLS policies

---

## Tech Stack

- **Flutter** – Cross-platform UI toolkit
- **Supabase** – Backend-as-a-service with PostgreSQL
- **PostgreSQL** – For managing user & task data
- **supabase_flutter** – Official Supabase Flutter SDK

---

## Screenshots
<img width="280" alt="calculator" src="https://github.com/user-attachments/assets/aa9e7716-b91a-4d87-b076-be815a07c1b3">   
<img width="280" alt="calculator" src="https://github.com/user-attachments/assets/57b738b0-2585-4a48-a4d6-87fb168789cd">   
<img width="280" alt="calculator" src="https://github.com/user-attachments/assets/aa9e7716-b91a-4d87-b076-be815a07c1b3">    



---

##  Installation

### 1. Clone the Repository

```bash
git clone https://github.com/your-username/supabase_task_manager.git
cd supabase_task_manager
````

### 2. Install Dependencies

```bash
flutter pub get
```

### 3. Setup Supabase in `main.dart`

```dart
await Supabase.initialize(
  url: 'https://your-project-id.supabase.co',
  anonKey: 'your-anon-key',
);
```

---

## Supabase Setup Guide

### 1. Create a New Project

Go to [Supabase Dashboard](https://app.supabase.com) and create a project.

### 2. Create `notes` Table

```sql
create table notes (
  id uuid default uuid_generate_v4() primary key,
  body text,
  user_id uuid references auth.users(id),
  is_completed boolean default false,
  created_at timestamp with time zone default timezone('utc'::text, now())
);
```

### 3. Enable Row Level Security (RLS)

```sql
alter table notes enable row level security;
```

### 4. Add RLS Policies

```sql
-- SELECT policy
create policy "Read own notes"
on notes
for select
to authenticated
using (user_id = auth.uid());

-- INSERT policy
create policy "Insert own notes"
on notes
for insert
to authenticated
with check (user_id = auth.uid());

-- DELETE policy
create policy "Delete own notes"
on notes
for delete
to authenticated
using (user_id = auth.uid());

-- UPDATE policy
create policy "Update own notes"
on notes
for update
to authenticated
using (user_id = auth.uid());
```

---

## 🔐 Authentication

Authentication is handled via **Supabase Auth** using email and password. The user ID (`auth.uid()`) is used in RLS policies to isolate each user's data.

---

## 📄 Project Structure
 
lib/
├── auth/
│   └── auth_service.dart        # Handles Supabase Auth logic
├── pages/
│   └── task_page.dart           # Task UI and logic (add/delete/update)
├── main.dart                    # App entry point with Supabase init
└── widgets/                     # Optional reusable widgets

---

## Real-Time Sync

All tasks are fetched using Supabase's `stream()` method. Any task updates or deletions are reflected immediately in the UI — no refresh needed.

 
## Why Supabase?

Supabase is an open-source Firebase alternative that provides:

* 🧠 Built-in authentication
* ⚡ Real-time PostgreSQL database
* 🛡️ Secure RLS (Row Level Security)
* 📦 Storage, Edge Functions, and more

It allows developers to build full-stack apps without managing backend infrastructure.
 
