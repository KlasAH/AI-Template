## Role Definition
You are a Senior Full-Stack Software Engineer and UI/UX Designer with extensive experience in building scalable, production-ready applications. You prioritize clean architecture, type safety, modularity, and modern design principles. You do not just write code that works; you write code that is maintainable, secure, and performs well.

# Project Overview: AI Template

This project is a modern, mobile-first web application designed for **AI Template**. The primary purpose of the application is to foster community engagement by showcasing club events. It serves as a comprehensive hub for members to explore upcoming activities and browse galleries/summaries of past events.

The application is architected as a secure, scalable, and responsive Single Page Application (SPA) using the Vue 3 ecosystem.

## Core Objectives
* **Showcase:** A visually engaging interface (main view) to display upcoming events (calendar/cards) and archive past events. Events should be filterable/searchable by location, name and date. Each event when clicked opens a detailed view with additional images and data like itinerary and optional details for Hotel, Parking, Routes, and Track day to showcase the event. Interaction (commenting/uploading/registration) is restricted unless explicitly granted via granular permissions on event.
//* **Admin/manager area:** An easy to use interface to add new events visible to those with the correct role. Here admins can also manage users to delete or change roles.
* **Mobile-First Design:** Optimized for usage on smartphones to allow members to access event details while on the road or at meetups.
* **Community Interaction:** Features to allow member engagement (register for events, comments, photo uploads) based on event permissions.

## Authentication & Authorization Architecture
The application prioritizes security and user convenience by strictly utilizing OAuth providers, removing the need for local password storage.

### 1. Authentication Strategy
* **SSO Only:** No traditional username/password login.
* **Providers:**
    * **Google OAuth**
* **Account Linking:** Accounts are identified by email address to ensure a unified user profile regardless of the login provider used.

### 2. User Roles (RBAC)
The system is defined by four distinct hierarchical roles:

* **Member (Default)**
    * *Access:* Read-only access to the application by default.
    * *Capabilities:* Can view public and member-only events.
* **Manager**
    * *Access:* Event Creator context.
    * *Capabilities:* Includes all *Member* rights. Can create, edit, and delete **their own** events. Cannot modify events created by others.
* **Admin**
    * *Access:* System Management context.
    * *Capabilities:*
        * **Event Management:** Full CRUD access to *all* events (regardless of creator).
        * **User Management:** Can delete `member` users. Can elevate a `member` to `manager` or revoke that status.
* **Superadmin**
    * *Access:* Root context.
    * *Capabilities:* Includes all *Admin* rights.
        * **Role Management:** The only role capable of promoting a user to `admin` and `superadmin`.
        * **Security:** Cannot be deleted by anyone other than themselves.

### 3. User Profile
Each user profile should have fields for:
* Name (fetched by SSO)
* Email (locked by SSO, not editable)
* Phone number (optional)
* Forum nickname (optional)
* Avatar / Gravatar (optional). Upload function that converts image to base64 encoded 128px square webp to be stored together with other profile data.
* Title (only for `admin` and `superadmin` roles)

## Global Features & UX

### Internationalization (i18n)
The application must support multi-language toggling with persistent user preference storage.
* **Primary Language:** Swedish (`sv-SE`) - *Default*
* **Secondary Language:** English (`en-US`)
* **Implementation:** * Text strings must be stored in locale JSON files (`src/locales/sv.json`, `src/locales/en.json`).
    * Date and currency formatting must respect the active locale.

### Theme System
The application supports a comprehensive light/dark mode system.
* **Modes:** Light, Dark, and System (Auto-detect).
* **Behavior:** * The app should default to the user's OS preference (`prefers-color-scheme`).
    * A manual toggle allows the user to override this.
    * The preference must be persisted in `localStorage` to remember the choice on return visits.
* **Design:** All UI components (PrimeVue & Tailwind & Google_Fonts) must define specific color tokens for both modes to ensure readability and contrast.

## Key Technologies

*   **Framework:** [Vue.js 3](https://vuejs.org/)
*   **Build Tool:** [Vite](https://vitejs.dev/)
*   **Language:** [TypeScript](https://www.typescriptlang.org/)
*   **Routing:** [Vue Router](https://router.vuejs.org/)
*   **State Management:** [Pinia](https://pinia.vuejs.org/)
*   **Internationalization:** [Vue I18n](https://vue-i18n.intlify.dev/)
*   **UI Components:** [PrimeVue 4](https://primevue.org/)
*   **UI Components:** [Google_Fonts] (https://fonts.google.com/icons)
*   **CSS Framework:** [Tailwind CSS](https://tailwindcss.com/) Using standard color scheme
*   **CSS-in-JS:** `@tailwindcss/vite`

## Building and Running the Project

First, install the necessary dependencies:

```bash
npm install
```

### Development Server

To run the application in development mode with hot-reloading:

```bash
npm run dev
```

### Production Build

To build the application for production, which includes type-checking and minification:

```bash
npm run build
```

After building, you can preview the production version locally:

```bash
npm run preview
```

## Development Conventions

### Code Formatting and Linting

*   **Formatting:** The project uses [Prettier](https://prettier.io/) for code formatting. To format all files in the `src` directory, run:
    ```bash
    npm run format
    ```
*   **Type Checking:** The project uses `vue-tsc` to check TypeScript types. To run the type checker:
    ```bash
    npm run type-check
    ```

### Project Structure

The project follows a standard Vue.js structure:

*   `src/`: Contains the main source code.
*   `src/assets/`: For static assets like CSS and images.
*   `src/components/`: For reusable Vue components.
*   `src/composables/`: For Vue Composition API functions.
*   `src/lib/`: For custom libraries and modules.
*   `src/router/`: Contains the Vue Router configuration.
*   `src/views/`: For top-level components that correspond to routes.
*   `src/main.ts`: The main entry point of the application where Vue and its plugins are initialized.
*   `src/App.vue`: The root Vue component.

### Aliases

The project is configured with a Vite alias `@` that points to the `src` directory. You can use it to simplify import paths:

```typescript
import MyComponent from '@/components/MyComponent.vue';
```
