# Functional Requirements Document – ImgxAI

## 1. Introduction

This document outlines the product requirements for **ImgxAI**, a browser-based image generation tool using OpenAI’s `gpt-image-1` model. The PRD defines the key features, technical constraints, user stories, and design considerations necessary for building and shipping a minimal but powerful Midjourney-style experience targeted at creative users.

---

## 2. Product overview

**ImgxAI** enables users to generate high-quality AI images using natural language prompts and view them in a scrollable visual timeline. The app focuses on simplicity, performance, and client-side control, allowing users to input prompts, view results, re-run generations, and filter past creations without backend dependencies. All data is stored locally, and users provide their own OpenAI API keys for interaction.

---

## 3. Goals and objectives

- **Simplify AI image generation**: Provide a clean interface for generating images using OpenAI's API with user-controlled parameters.
- **Preserve and explore creative output**: Maintain a persistent timeline of image generations for browsing, filtering, and reuse.
- **Ensure data privacy and speed**: Store all user data (images and keys) locally, never transmitted externally.
- **Support iterative creativity**: Enable users to re-run prompts with identical parameters for refinement or inspiration.
- **Optimize for client performance**: Maintain responsiveness even with hundreds of image generations in the timeline.

---

## 4. Target audience

- **Designers** seeking quick creative exploration.  
- **Content creators** needing assets or inspiration.  
- **Hobbyists** experimenting with AI art tools.  
- All users must have their own **OpenAI API key** to use the tool.

---

## 5. Features

### 5.1 Prompt re-run functionality

- **Description**:  
  Allows users to re-generate an image batch from a previously submitted prompt using the exact same parameters.

- **Functional scope**:  
  ✅ Included: re-using prompt, model, aspect ratio, quality, and compression  
  ❌ Not included: prompt editing or parameter tweaking within this flow

- **Linked requirement IDs**: FR-201, FR-304, NF-401  
- **Design or logic summary**: Triggered via a button in the Details Modal. New job is queued as background task, and entry is appended to timeline.  
- **Related user stories**: US-103, US-201

---

### 5.2 Scrollable timeline view

- **Description**:  
  Visual grid layout displaying previous prompt generations, organized by time and responsive across devices.

- **Functional scope**:  
  ✅ Includes infinite scroll, lazy loading, and persistent layout  
  ❌ Does not support drag/drop or manual reordering

- **Linked requirement IDs**: FR-301, FR-302, NF-403  
- **Design or logic summary**: Client-rendered paginated grid with column count responsive to screen size. Timeline is append-only and backed by IndexedDB.  
- **Related user stories**: US-102, US-105

---

### 5.3 Image details modal

- **Description**:  
  Full metadata and management actions for each prompt displayed in a modal overlay on image click.

- **Functional scope**:  
  ✅ Displays prompt metadata, re-run and download buttons  
  ❌ No annotation or editing within modal

- **Linked requirement IDs**: FR-303, FR-304  
- **Design or logic summary**: Modal overlays the app, focus-trapped, supports keyboard interaction. Image set is grouped by prompt.  
- **Related user stories**: US-103, US-106

---

### 5.4 Prompt input and job submission

- **Description**:  
  Users submit prompts through a persistent input bar to initiate image generation requests.

- **Functional scope**:  
  ✅ Includes user-controlled parameters, validation, loading indicator  
  ❌ No multi-prompt batch processing

- **Linked requirement IDs**: FR-101, FR-102  
- **Design or logic summary**: Input form is fixed to the bottom of the UI. Parameters are submitted to OpenAI API with moderation and stored locally.  
- **Related user stories**: US-101, US-107

---

### 5.5 Filtering and sorting

- **Description**:  
  Lightweight tools to find and organize past generations by various attributes.

- **Functional scope**:  
  ✅ Includes filtering by date, status, aspect ratio, and sort order  
  ❌ Does not support tag-based search

- **Linked requirement IDs**: FR-305, FR-306  
- **Design or logic summary**: Client-side filters using dropdowns or pills. Operates on local IndexedDB dataset.  
- **Related user stories**: US-104, US-105

---

### 5.6 Offline persistence

- **Description**:  
  Enables users to view previously generated content even without internet connectivity.

- **Functional scope**:  
  ✅ Timeline, metadata, and images available offline  
  ❌ No offline prompt submission (requires API access)

- **Linked requirement IDs**: FR-401, NF-404  
- **Design or logic summary**: Images and metadata cached in IndexedDB; prompt jobs only sent when online.  
- **Related user stories**: US-108, US-109

---

### 5.7 User settings

- **Description**:  
  Users can configure default parameters, store API keys, and reset their app state.

- **Functional scope**:  
  ✅ API key storage, default config, clear/reset  
  ❌ Does not support multiple key profiles

- **Linked requirement IDs**: FR-501, FR-502, NF-402  
- **Design or logic summary**: Minimal settings panel; stored in localStorage with input validation via Zod.  
- **Related user stories**: US-110, US-111

---

## 6. User stories and acceptance criteria

### Prompt input and job submission

- **US-101**: As a user, I want to enter a prompt and submit it to the image generation engine.  
  **Acceptance criteria**:
  - Input is only active when a valid API key is stored
  - Form includes prompt field and optional parameter overrides
  - Submitting triggers a new job and shows loading entry in timeline

- **US-107**: As a user, I want the app to show a loading placeholder while the image is being generated.  
  **Edge case**: Handle slow or failed API response gracefully with a retry option.

---

### Timeline view and display

- **US-102**: As a user, I want to view a grid of past generations that scales with my device.  
  **Acceptance criteria**:
  - Grid shows 1 col (mobile), 2 (tablet), 4 (desktop)
  - Scroll loads additional items via pagination or infinite scroll

- **US-105**: As a user, I want to sort and filter the timeline to find previous prompts.  
  **Filters**: date, status, aspect ratio  
  **Sort**: newest ⇆ oldest  
  **Acceptance criteria**: Filters update the UI immediately without reload

---

### Details modal and re-run

- **US-103**: As a user, I want to click on an image to see full metadata and related options.  
  **Acceptance criteria**:
  - Modal shows all images for the prompt
  - Displays parameters, model info, timestamp
  - Focus-trap, ESC closes, keyboard-navigable

- **US-106**: As a user, I want to download any image directly from the modal.  
  **Acceptance criteria**: WebP image downloads via browser on click

- **US-201**: As a user, I want to re-run the same prompt from the modal and generate new images.  
  **Acceptance criteria**: New entry appears in timeline with loading placeholder; all parameters are preserved

---

### Data persistence and offline use

- **US-108**: As a user, I want to view my history even when I’m offline.  
  **Acceptance criteria**: All past entries are loaded from IndexedDB

- **US-109**: As a user, I want to be informed that I can't generate new images offline.  
  **Acceptance criteria**: Submit button is disabled or error shown if offline

---

### Settings and API key

- **US-110**: As a user, I want to save and update my OpenAI API key.  
  **Acceptance criteria**: API key is stored in localStorage, never sent externally

- **US-111**: As a user, I want to reset my app and clear all stored data.  
  **Acceptance criteria**: Timeline, API key, and settings are cleared from IndexedDB and localStorage

---

## 7. Technical requirements / stack

| Component            | Choice                              |
| -------------------- | ----------------------------------- |
| **Framework**        | Next.js 15                          |
| **Styling**          | TailwindCSS                         |
| **UI Library**       | Shadcn UI                           |
| **Form Handling**    | React Hook Form + Zod               |
| **State Management** | React Query or SWR                  |
| **Icons**            | Lucide Icons                        |
| **Data storage**     | IndexedDB, localStorage             |
| **Image format**     | WebP, max 500kB, 50% compression    |
| **Background jobs**  | Handled via client-side async logic |
| **API moderation**   | Always use `moderation=low`         |

---

## 8. Design and user interface

- **Prompt Input**: Fixed bottom input with field for text and toggle for parameters (dropdown or collapsible form).
- **Timeline Grid**: Responsive grid using Tailwind breakpoints; lazy-load with scroll.
- **Modal**: Uses Shadcn UI Dialog with full keyboard support, focus trap, and accessibility.
- **Filters**: Displayed as dropdown or filter pills above timeline.
- **Settings Panel**: Toggleable panel or modal for managing API key and default values.
- **Visual Language**: Clean, minimalist aesthetic with soft shadows and clear spacing. Emphasize user content.
