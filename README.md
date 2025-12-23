# 🚀 Sergio Website

Portfolio website to show profile and work experience made with mobile/web Flutter.

## 🌐 Live Demo

You can see the website live on: **[sergiocarodev.com]**

---

## ✨ Characteristics

* ️ **Flutter Version:** 3.27.1
* ⚡ **Fast Render:** OnePage application with smooth animations.
* 📱 **Responsive:** Responsive for desktop, mobile and tablets.
* 🎨 **UI/UX:** Using Material Design.
* 🛠️ **State Management:** Uses provider as state manager and read info from json data.

---

## 🛠️ Install and Config

Follow this steps to run in local:

1. **Clone repository:**

2. **Create file lib/firebase_options.dart to connect firebase keys or configure with firebase cloud console**
   ```bash
      firebase login
      dart pub global activate flutterfire_cli
      flutterfire configure
   ```

3**Install Dependencies:**
   ```bash
   flutter pub get
   ```

4**Enable Flutter Web (If you didn't):**
   ```bash
   flutter config --enable-web
   ```

5**Run in debug mode:**
   ```bash
   flutter run -d chrome
   ```

---

## 📦 Deploy (Build)

To generate production build version run:

```bash
flutter build web --release