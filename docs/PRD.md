# Product Requirements Document (PRD)

> Version: 1.0  
> Status: Draft  
> Project Name: Learnify *(Working Title)*  
> Platform: Flutter (Android & iOS)  
> Architecture: Feature-First Architecture  
> Backend: Supabase (PostgreSQL)  
> Optional Backend: FastAPI (Python)  
> Primary User: PAUD / TK Teachers  
> Document Owner: Product Team

---

# Table of Contents

1. Executive Summary
2. Background
3. Problem Statement
4. Product Vision
5. Product Mission
6. Product Goals
7. Educational Objectives
8. Success Metrics
9. Target Users
10. User Personas
11. User Stories
12. Product Scope
13. Product Principles
14. UX Principles
15. UI Design Guidelines
16. Accessibility
17. Information Architecture
18. Navigation Flow
19. Learning Flow
20. Functional Requirements
21. Non Functional Requirements
22. Technical Architecture
23. Database Overview
24. Development Roadmap
25. AI Coding Guidelines
26. Acceptance Criteria
27. Future Scope

---

# 1. Executive Summary

CeriaAR adalah aplikasi pembelajaran interaktif berbasis Flutter yang dirancang untuk membantu guru PAUD dan TK menyampaikan materi pembelajaran menggunakan media digital yang lebih menarik.

Aplikasi menggabungkan tiga media pembelajaran utama:

- Video Pembelajaran
- Kuis Interaktif
- Augmented Reality (AR)

Seluruh fitur dikembangkan dengan mengutamakan performa, kemudahan penggunaan, efisiensi memori, dan arsitektur yang mudah dikembangkan.

Aplikasi ini bukan bertujuan menggantikan peran guru, melainkan menjadi media pendukung pembelajaran yang mampu meningkatkan keterlibatan siswa selama proses belajar berlangsung.

---

# 2. Background

Pembelajaran pada jenjang Pendidikan Anak Usia Dini membutuhkan media yang mampu menarik perhatian siswa secara visual dan interaktif.

Metode pembelajaran konvensional yang hanya mengandalkan buku atau penjelasan verbal sering kali membuat siswa cepat kehilangan fokus karena konsep yang disampaikan masih bersifat abstrak.

Perkembangan teknologi mobile memungkinkan guru memanfaatkan media digital seperti video, kuis interaktif, serta visualisasi objek tiga dimensi menggunakan Augmented Reality (AR).

Berdasarkan berbagai penelitian mengenai media pembelajaran interaktif, penggunaan media digital mampu meningkatkan:

- minat belajar siswa
- keterlibatan siswa
- motivasi belajar
- pemahaman konsep
- pengalaman belajar yang lebih bermakna

Karena itu diperlukan sebuah aplikasi yang ringan, mudah digunakan, dan mampu mengintegrasikan berbagai media pembelajaran ke dalam satu platform.

---

# 3. Problem Statement

Guru PAUD dan TK masih menghadapi beberapa kendala dalam proses pembelajaran, antara lain:

- Materi pembelajaran masih banyak disampaikan secara konvensional.
- Media pembelajaran digital masih tersebar pada berbagai platform.
- Sulit menghubungkan materi video dengan aktivitas evaluasi.
- Belum banyak media pembelajaran berbasis AR yang sederhana dan mudah digunakan.
- Sebagian besar aplikasi pembelajaran memiliki tampilan yang terlalu kompleks untuk digunakan di kelas.

Masalah tersebut menyebabkan pembelajaran menjadi kurang interaktif dan kurang mampu mempertahankan perhatian siswa.

---

# 4. Product Vision

Menjadi platform pembelajaran interaktif yang membantu guru PAUD dan TK menciptakan pengalaman belajar yang menarik, menyenangkan, serta mudah dipahami melalui integrasi video, kuis interaktif, dan Augmented Reality.

---

# 5. Product Mission

Menyediakan aplikasi pembelajaran yang:

- sederhana digunakan guru
- cepat diakses
- ringan dijalankan
- mudah dikembangkan
- mendukung pembelajaran aktif
- meningkatkan keterlibatan siswa

---

# 6. Product Goals

## Functional Goals

- Menyediakan materi pembelajaran dalam bentuk video.
- Menyediakan kuis interaktif sebagai evaluasi.
- Menampilkan objek pembelajaran menggunakan AR.
- Menyimpan seluruh data secara terstruktur menggunakan database relasional.

## Technical Goals

- UI responsif.
- Navigasi cepat.
- Arsitektur modular.
- Mudah dipelihara.
- Mudah dikembangkan.

## Educational Goals

- Membantu guru menyampaikan materi.
- Meningkatkan keterlibatan siswa.
- Membantu siswa memahami konsep melalui visualisasi.
- Memberikan pengalaman belajar yang menyenangkan.

---

# 7. Educational Objectives

Aplikasi dirancang berdasarkan prinsip pembelajaran interaktif.

Media pembelajaran harus mampu:

- meningkatkan minat belajar siswa;
- meningkatkan keterlibatan siswa selama pembelajaran;
- membantu siswa memahami konsep yang bersifat abstrak melalui visualisasi;
- menciptakan pengalaman belajar yang aktif, eksploratif, dan menyenangkan;
- memberikan umpan balik langsung melalui kuis interaktif.

Augmented Reality digunakan sebagai media untuk mengubah konsep yang sulit dipahami menjadi objek visual yang dapat diamati secara langsung dari berbagai sudut pandang.

Video pembelajaran berfungsi sebagai media penyampaian materi.

Kuis berfungsi sebagai media evaluasi sekaligus penguatan pemahaman siswa.

Guru tetap menjadi pusat proses pembelajaran, sedangkan aplikasi bertindak sebagai media pendukung (teacher-assisted learning).

---

# 8. Product Success Metrics

Keberhasilan aplikasi tidak hanya diukur dari sisi teknis, tetapi juga dari pengalaman belajar.

## User Experience

- Guru mampu menggunakan aplikasi tanpa pelatihan khusus.
- Navigasi dapat dipahami dalam kurang dari 5 menit.
- Semua fitur dapat diakses maksimal dalam tiga kali tap.

## Learning Experience

Aplikasi diharapkan mampu:

- meningkatkan perhatian siswa;
- meningkatkan partisipasi siswa;
- meningkatkan rasa ingin tahu siswa;
- meningkatkan pemahaman materi;
- membuat proses belajar menjadi lebih menyenangkan.

## Technical Metrics

- Startup time < 2 detik
- Screen transition < 300 ms
- FPS stabil di 60
- Tidak terjadi frame drop saat timer berjalan
- Tidak terjadi memory leak setelah keluar dari modul AR

---

# 9. Target Users

## Primary User

Guru PAUD

Guru TK

Karakteristik:

- tidak selalu memiliki kemampuan teknis tinggi;
- membutuhkan navigasi sederhana;
- menggunakan smartphone Android;
- membutuhkan media pembelajaran yang praktis.

---

## Secondary User

Anak usia dini

Karakteristik:

- usia 4–6 tahun;
- mudah tertarik oleh visual;
- mudah kehilangan fokus;
- belajar melalui eksplorasi dan interaksi.

---

# 10. User Personas

## Persona 1

Nama:

Bu Sinta

Profesi:

Guru TK

Goals:

- Mengajar lebih menarik.
- Menghemat waktu persiapan.
- Menggunakan media yang mudah dioperasikan.

Pain Points:

- Sulit mencari media pembelajaran yang sesuai.
- Terlalu banyak aplikasi berbeda.
- Sulit menggunakan aplikasi yang rumit.

---

## Persona 2

Nama:

Anisa

Usia:

5 tahun

Goals:

- Belajar sambil bermain.
- Melihat gambar bergerak.
- Menyentuh objek yang menarik.

Pain Points:

- Cepat bosan.
- Sulit memahami penjelasan abstrak.

---

# 11. User Stories

Sebagai guru,

Saya ingin memilih kategori materi,

Sehingga saya dapat menemukan materi dengan cepat.

---

Sebagai guru,

Saya ingin memutar video pembelajaran,

Sehingga siswa dapat memahami materi terlebih dahulu.

---

Sebagai guru,

Saya ingin membuka kuis setelah video selesai,

Sehingga saya dapat mengevaluasi pemahaman siswa.

---

Sebagai guru,

Saya ingin menampilkan objek AR,

Sehingga siswa dapat melihat bentuk objek secara nyata.

---

Sebagai guru,

Saya ingin aplikasi tetap ringan,

Sehingga tidak mengalami lag saat digunakan di kelas.

---

# 12. Product Scope

## Included

✅ Video Pembelajaran

✅ Kuis Interaktif

✅ Augmented Reality

✅ Supabase Database

✅ Kategori Materi

✅ Offline Video Cache

---

## Excluded (Version 1)

❌ Login Multi User

❌ Progress Belajar

❌ Leaderboard

❌ AI Chatbot

❌ Dashboard Orang Tua

❌ Sinkronisasi Multi Device

---

# 13. Product Principles

Produk dikembangkan berdasarkan prinsip berikut.

## Simplicity

Semua fitur harus mudah digunakan.

---

## Performance First

Setiap fitur harus mempertahankan performa tinggi.

---

## Modular

Setiap modul berdiri sendiri.

---

## Scalability

Semua struktur harus mudah dikembangkan.

---

## Teacher-Centered

Aplikasi membantu guru.

Bukan menggantikan guru.

---

## Visualization First

Konsep abstrak harus divisualisasikan.

Jika memungkinkan, gunakan gambar, animasi, video, atau AR dibanding teks panjang.

---

## Minimal Cognitive Load

Antarmuka harus membantu pengguna fokus terhadap materi, bukan terhadap cara menggunakan aplikasi.

# 14. UX Principles

Seluruh pengalaman pengguna harus mengikuti prinsip **Teacher-Centered Design**, yaitu meminimalkan hambatan penggunaan sehingga guru dapat fokus mengajar, bukan mempelajari aplikasi.

## Design Philosophy

Aplikasi harus:

- mudah dipelajari dalam waktu singkat;
- memiliki navigasi yang konsisten;
- meminimalkan jumlah klik;
- memberikan umpan balik yang jelas pada setiap interaksi;
- mempertahankan performa tinggi pada perangkat Android kelas menengah.

---

## UX Principles

### Simplicity First

Setiap halaman hanya memiliki satu tujuan utama.

Hindari menampilkan terlalu banyak informasi dalam satu layar.

---

### Consistency

Gunakan pola UI yang konsisten.

Contoh:

- posisi tombol kembali selalu sama;
- ukuran tombol seragam;
- typography konsisten;
- icon mengikuti Material Design.

---

### Recognition Over Recall

Pengguna tidak perlu mengingat langkah sebelumnya.

Semua menu harus mudah dikenali melalui:

- icon
- label
- warna

---

### Immediate Feedback

Setiap aksi harus memberikan respon.

Contoh:

- loading indicator
- snackbar
- animation
- progress indicator

---

### Accessibility

Gunakan:

- ukuran font minimal 16sp
- tombol minimal 48x48dp
- kontras warna yang baik
- ikon yang mudah dipahami

---

### Minimal Cognitive Load

Pengguna cukup fokus pada materi pembelajaran.

UI tidak boleh membingungkan.

---

### Progressive Disclosure

Informasi lanjutan hanya ditampilkan ketika diperlukan.

Contoh:

Video Detail

↓

Play

↓

Quiz

↓

AR

Bukan semuanya ditampilkan sekaligus.

---

# 15. UI Design Guidelines

## Design Language

Gunakan desain modern yang bersih.

Karakteristik:

- Flat Design
- Minimal
- Spacious
- Soft Colors
- Rounded Corner
- Material 3

---

## Color Palette

Primary

Pastel Blue

Secondary

Pastel Green

Accent

Pastel Orange

Background

White

Surface

Light Gray

Error

Soft Red

Warning

Soft Yellow

Success

Soft Green

---

## Typography

Gunakan Google Fonts:

- Poppins
atau

- Nunito

Hierarchy:

H1

32

H2

24

H3

20

Body

16

Caption

14

---

## Component Guidelines

Button Radius

12dp

Card Radius

16dp

Spacing

8dp

16dp

24dp

32dp

Gunakan kelipatan 8.

---

## Icons

Gunakan Material Symbols.

Hindari icon dekoratif yang tidak memiliki fungsi.

---

## Animation

Animation harus ringan.

Durasi:

150–300 ms

Gunakan:

- Fade
- Scale
- Slide

Hindari animasi yang terlalu kompleks.

---

# 16. Accessibility

Aplikasi harus memenuhi prinsip dasar accessibility.

Semua tombol memiliki:

- label
- ukuran minimal 48dp

Semua teks memiliki:

- kontras tinggi

Semua icon memiliki:

- tooltip
- semantic label

---

# 17. Information Architecture

```
Splash

↓

Home

├── Video Learning
│
├── Interactive Quiz
│
├── AR Learning
│
└── Settings
```

Settings

↓

Storage

↓

Clear Video Cache

---

## Video Learning

```
Category

↓

Video List

↓

Video Detail

↓

Video Player

↓

Quiz Recommendation
```

---

## Quiz

```
Difficulty

↓

Quiz

↓

Result

↓

Back Home
```

---

## AR

```
AR Menu

↓

Camera Permission

↓

Load Model

↓

AR Session

↓

Dispose

↓

Back Home
```

---

# Asset Optimization

To ensure consistent application performance:

- Images should use WebP whenever possible.
- Icons should use SVG where supported.
- 3D assets must be compressed GLB files.
- Maximum texture resolution: 1024 × 1024.
- Video thumbnails should not exceed 250 KB.
- Avoid loading multiple 3D assets simultaneously.
- Preload only assets required for the current screen.
---

# 18. Navigation Flow

```
Splash

↓

Home

↓

Select Category

↓

Video List

↓

Watch Video

↓

Take Quiz

↓

View Result

↓

Open AR

↓

Back Home
```

Navigation Rules

- maksimum tiga kali tap menuju fitur utama
- gunakan GoRouter
- hindari nested navigation berlebihan
- back navigation selalu konsisten

---

# 19. Learning Flow

Pembelajaran mengikuti pendekatan bertahap.

```
Choose Topic

↓

Watch Learning Video

↓

Understand Concept

↓

Take Interactive Quiz

↓

Receive Immediate Feedback

↓

Explore 3D Object using AR

↓

Teacher Reinforcement
```

Prinsip:

Video menyampaikan konsep.

Quiz mengukur pemahaman.

AR memperkuat visualisasi konsep.

Guru memberikan penjelasan lanjutan.

---

# 20. Functional Requirements

---

## Home Module

### Objective

Menjadi pusat navigasi seluruh aplikasi.

---

### Features

Menampilkan:

- Greeting
- Menu Video
- Menu Quiz
- Menu AR
- Menu Settings

---

### Functional Requirements

FR-HOME-001

Aplikasi menampilkan Home setelah Splash Screen selesai.

FR-HOME-002

Semua menu utama dapat diakses maksimal satu kali tap.

FR-HOME-003

Home harus dimuat kurang dari dua detik.

---

### Acceptance Criteria

- Semua menu muncul.
- Tidak ada loading yang lama.
- Navigasi berjalan lancar.

---

## Video Module

### Objective

Menyampaikan materi pembelajaran.

---

### Features

- Browse Category
- Search Video
- Video Detail
- Video Player
- Cached Video

---

### Category

Kategori default:

- Umum
- Agama
- Matematika

Kategori dapat ditambah melalui database.

---

### Video Card

Menampilkan:

- Thumbnail
- Judul
- Durasi

---

### Video Detail

Menampilkan:

- Thumbnail
- Deskripsi
- Tombol Putar
- Tombol Mulai Kuis

---

### Video Player

Mendukung:

- Play
- Pause
- Replay
- Seek
- Fullscreen

---

### Cache

Video pertama kali diputar akan disimpan secara lokal.

Video berikutnya menggunakan cache.

Resolusi maksimal

720p

---

### Functional Requirements

FR-VIDEO-001

Video dapat diputar.

FR-VIDEO-002

Video dapat di-pause.

FR-VIDEO-003

Video dapat di-seek.

FR-VIDEO-004

Video dapat diputar kembali.

FR-VIDEO-005

Video menggunakan cache.

FR-VIDEO-006

Video gagal dimuat menampilkan pesan error.

---

### Acceptance Criteria

- Video berjalan lancar.
- Tidak buffering ketika cache tersedia.
- Kontrol video berfungsi.

---

## Quiz Module

### Objective

Mengukur pemahaman siswa.

---

### Features

- Difficulty
- Question
- Countdown Timer
- Score
- Result

---

### Difficulty

Easy

Medium

Hard

Difficulty menentukan:

- jumlah soal
- waktu
- tingkat kesulitan

---

### Question

Satu soal ditampilkan per layar.

Jenis:

- pilihan ganda

---

### Timer

Countdown otomatis.

State timer hanya me-render widget timer.

Gunakan:

Riverpod

atau

ValueNotifier

---

### Result

Menampilkan:

- skor
- jumlah benar
- jumlah salah
- tombol ulangi
- kembali ke Home

---

### Functional Requirements

FR-QUIZ-001

Guru dapat memilih tingkat kesulitan.

FR-QUIZ-002

Timer berjalan otomatis.

FR-QUIZ-003

Jawaban dikoreksi otomatis.

FR-QUIZ-004

Skor dihitung otomatis.

FR-QUIZ-005

Result muncul setelah soal selesai.

---

### Acceptance Criteria

- Timer stabil.
- Tidak ada rebuild seluruh halaman.
- Perpindahan soal cepat.
- Skor akurat.

---

## AR Module

### Objective

Membantu siswa memahami objek pembelajaran melalui visualisasi tiga dimensi.

---

### Features

- Camera Permission
- Load Model
- Plane Detection
- Place Object
- Rotate Object
- Scale Object
- Remove Object

---

### Model

Format:

.glb

Ukuran maksimal

3 MB

---

### Lazy Loading

Library AR hanya dimuat ketika halaman dibuka.

---

### Dispose

Saat keluar halaman:

- dispose controller
- dispose camera
- release texture
- release model
- release session

---

### Functional Requirements

FR-AR-001

Camera meminta izin.

FR-AR-002

Model dapat dimuat.

FR-AR-003

Objek dapat diputar.

FR-AR-004

Objek dapat diperbesar.

FR-AR-005

Semua resource dibersihkan saat keluar.

---

### Acceptance Criteria

- Kamera terbuka.
- Model muncul.
- Tidak terjadi memory leak.
- RAM turun kembali setelah halaman ditutup.

---

## Settings Module

### Features

- About App
- Version
- Privacy Policy
- Reset Cache

---

### Acceptance Criteria

Semua informasi dapat ditampilkan tanpa koneksi internet.

# 21. Technical Architecture

The application shall adopt a modular, scalable, and maintainable architecture based on **Feature-First Architecture**.

Primary objectives:

- High maintainability
- Loose coupling
- High cohesion
- Easy feature expansion
- Independent feature development
- Separation of concerns

The architecture must support independent development for each feature without affecting other modules.

---

# 22. Project Structure

The Flutter project must follow the Feature-First Architecture.

```
lib/
│
├── app/
│   ├── app.dart
│   ├── router.dart
│   ├── theme.dart
│   └── providers.dart
│
├── core/
│   ├── constants/
│   ├── errors/
│   ├── extensions/
│   ├── services/
│   ├── utils/
│   └── widgets/
│
├── shared/
│   ├── models/
│   ├── repositories/
│   ├── providers/
│   └── widgets/
│
├── features/
│
│   ├── home/
│   ├── video/
│   ├── quiz/
│   ├── ar/
│   └── settings/
│
└── main.dart
```

---

Each feature should contain:

```
feature/

presentation/
│
├── pages/
├── widgets/
└── controllers/

domain/
│
├── models/
├── repositories/
└── usecases/

data/
│
├── datasource/
├── repository_impl/
└── dto/
```

Responsibilities:

Presentation

- UI
- Widget
- Screen

Domain

- Business Logic
- Entity
- Use Case

Data

- API
- Supabase
- Cache
- Local Storage

---

# 23. State Management

Preferred solution:

Riverpod

Reasons:

- Lightweight
- Scalable
- Compile-safe
- Testable

Small isolated states may use:

ValueNotifier

Examples:

Allowed:

- Timer
- Selected Answer
- Current Tab

Avoid:

Global State for temporary UI values.

---

State Flow

```
UI

↓

Controller

↓

Repository

↓

Datasource

↓

Supabase
```

---

# 24. Navigation

Use:

GoRouter

Requirements

- Declarative Routing
- Named Route
- Deep Link Ready
- Easy Future Expansion

Example

```
/

↓

/home

↓

/videos

↓

/videos/:id

↓

/quiz/:id

↓

/ar

↓

/settings
```

---

# 25. Dependency Management

3D Viewer

Preferred Package

model_viewer_plus

Supported formats

.glb

Capabilities

- Rotate
- Zoom
- Pan
- Animation Playback

Reason

Stable, actively maintained, lightweight, and compatible with modern Flutter versions.

For Version 1, the application uses an interactive 3D viewer instead of full camera-based Augmented Reality to maximize compatibility and application stability.

---

# 26. Backend Architecture

Backend Platform

Supabase

Services Used

- PostgreSQL Database
- Supabase Storage
- Authentication (Future)
- Row Level Security
- REST API
- Realtime (Optional)

Flutter communicates directly with Supabase using Repository Pattern.

No additional backend service is required for Version 1.

The architecture should remain backend-agnostic so that a custom backend may be introduced in future versions without affecting the Presentation or Domain layers.
---

# 27. Database Overview

Relationship

```
Category

↓

Video

↓

Quiz

↓

Question

↓

Answer
```

---

Tables

categories

```
id
name
icon
created_at
```

---

videos

```
id
category_id
title
description
thumbnail_url
video_url
duration
created_at
```

---

quizzes

```
id
video_id
title
difficulty
time_limit
created_at
```

---

questions

```
id
quiz_id
question
image_url
created_at
```

---

answers

```
id
question_id
answer
is_correct
```

---

ar_models

```
id
category_id
title
description
model_url
thumbnail_url
```

---

Future Tables

teachers

students

learning_history

favorites

analytics

feedback

---

# 28. Storage Strategy

Supabase Storage

Buckets

videos/

Store

- mp4

Maximum

720p

---

models/

Store

.glb

Maximum

3 MB

---

images/

Store

- thumbnail
- icon
- illustration

---

# 29. Repository Pattern

Every feature should expose only one repository.

Example

VideoRepository

Responsibilities

- Get Categories
- Get Videos
- Get Video Detail

QuizRepository

Responsibilities

- Get Quiz
- Get Questions
- Submit Result

ARRepository

Responsibilities

- Get Models
- Download Assets

---

UI must NEVER access Supabase directly.

Always use Repository Layer.

---

# 30. Data Flow

```
Supabase

↓

Datasource

↓

Repository

↓

Controller

↓

UI
```

Reverse flow

```
UI

↓

Controller

↓

Repository

↓

Datasource

↓

Supabase
```

---

# 31. Performance Requirements

Target Device

Android

RAM

4 GB

CPU

Mid-range

---

Application Startup

Target

< 2 seconds

---

Navigation

Target

< 300 ms

---

API Response

Target

< 1 second

---

Video Loading

< 2 seconds

---

Quiz Transition

< 100 ms

---

AR Initialization

< 5 seconds

---

# 32. Memory Optimization

Video

Cache after first play.

Release controller immediately after leaving page.

Video Cache Policy

- Videos are cached after the first successful playback.
- Maximum cache size: 500 MB.
- When the cache exceeds the limit, the oldest cached videos are automatically removed using an LRU (Least Recently Used) strategy.
- Users may manually clear the cache through the Settings page.

---

Quiz

Only timer widget rebuilds.

Questions loaded once.

No unnecessary rebuild.

---

AR

Initialize lazily.

Release:

- Camera
- Model
- Texture
- Controller
- Session

Immediately after dispose().

---

Image

Use CachedNetworkImage.

---

Avoid

- Large images
- Duplicate assets
- Memory leaks

---

# 33. Offline Strategy

Supported Offline

Cached Videos

Previously downloaded thumbnails

Application assets

Quiz data (optional future)

---

Not Supported

Realtime Sync

Cloud Update

Analytics

---

# 34. Security Requirements

Supabase Row Level Security must be enabled.

Public users

Read Only

Admin

CRUD

Never expose:

- Service Role Key
- Database Password
- Storage Secret

Store API Keys using:

flutter_dotenv

---

# 35. Error Handling

Every network request must handle:

Loading

Success

Error

Empty

Offline

Timeout

Unknown Error

Avoid application crashes.

Show friendly error messages.

---

# 36. Logging

Development

Use logger package.

Production

Disable debug logs.

Never print:

- API Keys
- User Data
- Tokens

---

# 37. Coding Standards

Follow Effective Dart.

Use

PascalCase

for classes.

camelCase

for variables.

snake_case

for filenames.

Avoid

God Classes.

Functions should perform one responsibility only.

Maximum recommended function length:

30 lines.

Maximum widget nesting:

5 levels.

Extract reusable widgets whenever possible.

---

# 38. Testing Strategy

Unit Test

Repository

Controller

Business Logic

Widget Test

Buttons

Forms

Navigation

Integration Test

Video Flow

Quiz Flow

AR Flow

---

Minimum Coverage

70%

# 39. Development Roadmap

Development follows an incremental approach.

Each phase must be completed, reviewed, and validated before continuing to the next phase.

---

## Phase 1 — Project Initialization

Objectives

- Setup Flutter project
- Configure Feature-First Architecture
- Configure Riverpod
- Configure GoRouter
- Configure Theme
- Configure Folder Structure

Deliverables

- Project structure
- Theme system
- Navigation skeleton

Definition of Done

- Project compiles successfully.
- Navigation works.
- Folder structure follows architecture.

---

## Phase 2 — UI Foundation

Objectives

Build static user interface.

Pages

- Splash
- Home
- Category
- Video List
- Video Detail
- Video Player
- Difficulty Selection
- Quiz
- Result
- AR Page
- Settings

Deliverables

Complete UI without backend integration.

Definition of Done

- All pages completed.
- Responsive layout.
- Consistent design system.

---

## Phase 3 — Video Module

Objectives

Implement learning videos.

Features

- Browse categories
- Video detail
- Video player
- Video cache

Deliverables

Fully functional video module.

Definition of Done

- Video playback works.
- Video cache works.
- Error handling implemented.

---

## Phase 4 — Quiz Module

Objectives

Implement interactive quizzes.

Features

- Difficulty selection
- Timer
- Score calculation
- Result page

Deliverables

Complete quiz module.

Definition of Done

- Timer works.
- No unnecessary widget rebuild.
- Score calculation is correct.

---

## Phase 5 — AR Module

Objectives

Implement Augmented Reality.

Features

- Camera permission
- Plane detection
- Load GLB model
- Object placement
- Object rotation

Deliverables

Functional AR viewer.

Definition of Done

- Model appears.
- Camera works.
- Memory released after dispose.

---

## Phase 6 — Supabase Integration

Objectives

Connect application with backend.

Features

- Fetch Categories
- Fetch Videos
- Fetch Quiz
- Fetch AR Models

Deliverables

Application connected to Supabase.

Definition of Done

- CRUD Read operations work.
- Error handling implemented.

---

## Phase 7 — Optimization

Objectives

Improve application performance.

Tasks

- Memory optimization
- FPS optimization
- Cache optimization
- Widget optimization
- Lazy loading

Deliverables

Production-ready application.

Definition of Done

Performance targets achieved.

---

# 40. Definition of Done (DoD)

A feature is considered complete only if all of the following conditions are met.

## Functional

- Feature works according to requirements.
- User flow completed successfully.
- No blocking bug.

---

## UI

- Consistent with design system.
- Responsive layout.
- Accessible.

---

## Performance

- No memory leak.
- Stable 60 FPS.
- No unnecessary rebuild.

---

## Code Quality

- Follows architecture.
- Proper naming.
- Clean code.
- Reusable components.

---

## Testing

- Unit test passed.
- Widget test passed.
- Manual testing completed.

---

# 41. Acceptance Criteria

## Home

- Home loads successfully.
- Navigation works.
- No broken buttons.

---

## Video

- Videos play correctly.
- Cache works.
- Fullscreen works.
- Replay works.

---

## Quiz

- Questions display correctly.
- Timer works.
- Score is accurate.
- Results displayed correctly.

---

## AR

- Camera permission requested.
- Model displayed.
- Rotation works.
- Memory released after closing.

---

## Settings

- Information displayed correctly.
- Cache can be cleared.

---

# 42. Success Metrics

The project is considered successful if:

## Technical

- Startup < 2 seconds
- Navigation < 300 ms
- Video starts < 2 seconds
- Stable 60 FPS
- No memory leak
- Crash-free rate > 99%

---

## Educational

Teachers can:

- Quickly access learning materials.
- Conduct lessons more interactively.
- Easily operate the application.

Students can:

- Stay engaged during lessons.
- Better understand learning materials.
- Participate actively through quizzes and AR.

---

## Product

The application should:

- Reduce teacher preparation time.
- Increase classroom engagement.
- Improve the overall learning experience.

---

# 43. Future Scope

Potential future developments include:

Authentication

- Teacher login
- Student login

Learning Progress

- Learning history
- Quiz history
- Progress dashboard

Gamification

- Achievement badges
- Daily challenges
- Rewards

Artificial Intelligence

- AI Tutor
- AI Question Generator
- AI Recommendation

Analytics

- Learning analytics
- Teacher dashboard
- Student performance

Content Management

- Admin Panel
- Content approval
- Dynamic categories

Offline Mode

- Full offline learning
- Downloadable quizzes
- Downloadable AR assets

Cloud Synchronization

- Multi-device support
- Backup & restore

---

# 44. Risks and Assumptions

## Risks

- Large video files may increase storage usage.
- AR performance depends on device capabilities.
- Internet connectivity affects first-time content loading.

---

## Assumptions

- Teachers have access to Android smartphones.
- Devices support Flutter requirements.
- Stable internet is available during initial content download.

---

# 45. AI Coding Guidelines

This project will be developed using AI-assisted programming.

The AI assistant must follow these rules.

## Architecture

- Use Feature-First Architecture.
- Keep modules independent.
- Separate Presentation, Domain, and Data layers.

---

## UI

- Build UI before backend integration.
- Use reusable widgets.
- Keep layouts responsive.
- Follow Material Design 3.

---

## State Management

- Use Riverpod.
- Use ValueNotifier only for isolated widget updates.
- Avoid global mutable state.

---

## Performance

- Avoid unnecessary widget rebuilds.
- Lazy load heavy resources.
- Dispose controllers immediately.
- Cache reusable assets.

---

## Backend

- Do not access Supabase directly from UI.
- Always use Repository Pattern.
- Separate DTOs from domain models.

---

## Code Style

Generate production-ready code.

Prioritize:

- readability
- maintainability
- modularity
- scalability

Avoid overengineering.

---

# 46. Development Constraints

The AI assistant must NOT:

- Mix UI with business logic.
- Access database directly from widgets.
- Duplicate code.
- Use unnecessary packages.
- Introduce breaking architectural changes.

The AI assistant SHOULD:

- Reuse widgets.
- Write documentation.
- Add comments only where necessary.
- Prefer composition over inheritance.

---

# 47. Design Tokens

Spacing

- 8dp
- 16dp
- 24dp
- 32dp

Border Radius

- Small: 8dp
- Medium: 12dp
- Large: 16dp

Typography

- H1: 32sp
- H2: 24sp
- H3: 20sp
- Body: 16sp
- Caption: 14sp

Touch Target

Minimum:

48 x 48dp

---

# 48. Naming Convention

Folders

snake_case

Files

snake_case.dart

Classes

PascalCase

Variables

camelCase

Constants

UPPER_SNAKE_CASE

Providers

xxxProvider

Repositories

xxxRepository

Controllers

xxxController

Pages

xxxPage

Widgets

xxxCard
xxxButton
xxxTile

---

# 49. Out of Scope (Version 1)

The following features are intentionally excluded from the first release:

- User Authentication
- Teacher Dashboard
- Student Dashboard
- Learning History
- Notifications
- Push Messaging
- Multiplayer Learning
- AI Chatbot
- Voice Recognition
- Offline Synchronization
- Payment System

These features may be considered in future versions.

---

# 50. Conclusion

CeriaAR is designed as a modern, scalable, and high-performance educational application for PAUD and TK teachers.

The application integrates learning videos, interactive quizzes, and Augmented Reality into a single platform that supports active learning, improves student engagement, and assists teachers in delivering meaningful classroom experiences.

The project prioritizes:

- Simplicity
- Performance
- Maintainability
- Scalability
- Educational effectiveness

By following this Product Requirements Document, the development team and AI coding assistants should have a shared understanding of the product vision, technical architecture, implementation roadmap, and quality standards required to build a production-ready application.