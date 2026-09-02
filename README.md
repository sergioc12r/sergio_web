# 🚀 Sergio Website

Portfolio website to show profile and work experience made with mobile/web Flutter.

## 🌐 Live Demo

You can see the website live on: **[sergiocarodev.com]**

---

## ✨ Characteristics

* ️ **Flutter Version:** 3.47.1
* ⚡ **Fast Render:** OnePage application with smooth animations.
* 📱 **Responsive:** Responsive for desktop, mobile and tablets.
* 🎨 **UI/UX:** Using Material Design.
* 🛠️ **State Management:** Uses Riverpod as state manager and reads content from json data.

---

## 🛠️ Install and Config

Follow this steps to run in local:

1. **Clone repository:**

2. **Create file lib/firebase_options.dart to connect firebase keys or configure with firebase cloud
   console**
   ```bash
      # If you don't have the Firebase CLI installed yet:
      npm install -g firebase-tools

      firebase login
      dart pub global activate flutterfire_cli
      flutterfire configure
   ```

3. **Install Dependencies:**
   ```bash
   flutter pub get
   ```

4. **Enable Flutter Web (If you didn't):**
   ```bash
   flutter config --enable-web
   ```

5. **Run in debug mode:**
   ```bash
   flutter run -d chrome
   ```

---

## 📦 Deploy (Build)

To generate production build version run:

```bash
flutter build web --release