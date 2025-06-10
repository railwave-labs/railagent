# Functional Requirements Document – ImgxAI

## 1. Overview

**Product Name:** ImgxAI  
**Purpose:** Browser-based image generation tool using OpenAI’s `gpt-image-1` model, offering a visual timeline of outputs, prompt customization, and reusability.  
**Target Users:** Designers, creators, and hobbyists using their own OpenAI API keys to generate AI images.

---

## 2. Core Functional Requirements

### 2.1 Image Generation

- Accept a user-entered **text prompt** via a fixed input at the bottom of the UI.
- Submit prompt to OpenAI’s `gpt-image-1` API using:
  - `moderation=low`
  - User-defined parameters: aspect ratio, quality, compression
- Default image format: **WebP**, **≤500kB**, **50% compression**.
- Triggered as a **background job** with loading placeholder in timeline until result returns.
- Prompt re-run must reuse *all original parameters* exactly.

### 2.2 Timeline Display

- Visual display of image generations in a **scrollable, responsive grid**:
  - **Mobile:** 1 column
  - **Tablet:** 2 columns
  - **Desktop:** 4 columns
- **Lazy-load images** using pagination or infinite scroll as user scrolls.
- All entries are **append-only** and persist across sessions.

### 2.3 Image Interaction

- Clicking an image opens a **Details Modal** with:
  - All images from the original prompt
  - Prompt text and full parameter metadata
  - Job ID, timestamp, model, dimensions, quality
  - Buttons: **Download** (WebP), **Re-run Prompt**
- Image re-runs spawn a new generation with preserved inputs.

### 2.4 Filtering and Sorting

- Timeline supports:
  - **Date range**
  - **Status** (e.g., completed, error)
  - **Aspect ratio**
  - **Sort order:** Newest ⇆ Oldest
- Minimal UI components (e.g. dropdowns or pills) to keep filtering streamlined.

---

## 3. Data Storage & Persistence

### 3.1 Local Persistence

- **IndexedDB:** Stores timeline entries (images + metadata) offline.
- **localStorage:** Stores user's **OpenAI API key** securely (never sent to backend).

### 3.2 Data Schema (IndexedDB)

Each generation entry stores:
- Prompt text
- Parameters: aspect ratio, quality, compression
- Returned image(s) as base64 or Blob
- Metadata: model used, timestamp, job ID

---

## 4. Settings and Configuration

- **Settings Menu:** Accessible UI section to:
  - Set or update OpenAI API key
  - Optionally adjust default prompt parameters
- API key is **required** before prompt input is enabled.
- Option to clear history and reset settings.

---

## 5. Technical & Performance Requirements

### 5.1 Frameworks & Libraries

- **Frontend:** Next.js 15, TailwindCSS, Shadcn UI
- **Form Handling:** React Hook Form + Zod
- **Async State:** React Query or SWR
- **Icons:** Lucide Icons

### 5.2 Performance Constraints

- Timeline must remain responsive with large number of entries
- All image files ≤ 500kB
- Background tasks must not block main UI thread

### 5.3 Accessibility & Responsiveness

- Fully navigable via **keyboard**
- Responsive across devices and screen sizes
- Modal and dropdowns must support:
  - Focus trapping
  - ESC to close

---

## 6. Non-Functional Requirements

| Category            | Requirement                                                            |
| ------------------- | ---------------------------------------------------------------------- |
| **Security**        | API key never leaves browser; stored only in localStorage              |
| **Reliability**     | Prompt failure should not crash app; show status and allow re-attempt  |
| **Maintainability** | Modular React components, strict typing via Zod                        |
| **Scalability**     | Must handle hundreds of timeline entries without degrading performance |
| **Offline Usage**   | Users can view past generations offline via IndexedDB                  |
