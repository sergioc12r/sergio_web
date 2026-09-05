# Privacy Policy for Verdant

**Effective Date:** September 4, 2026
**Last Updated:** September 4, 2026

Sergio Caro ("we," "our," or "us") built Verdant, a plant-care tracker for iPhone, iPad, and Android devices. This Privacy Policy explains what Verdant does — and does not do — with your information.

By using Verdant, you agree to the practices described in this Privacy Policy. If you do not agree, please do not use the app.

**In short:** Verdant has no account and no server of ours. **Everything you create — your plants, photos, notes, care history, and schedules — stays in storage on your own device and is never transmitted to us or anyone else.** The single exception to Verdant's network silence is a small set of anonymous usage counts (which screens are opened, which care actions are logged) sent to a privacy-focused analytics provider, Aptabase, so we can see how the app is used in aggregate. Those events carry no account, no advertising identifier, and none of your garden's content. Section 5 describes exactly what is sent.

---

## 1. Information You Create in the App

Verdant stores the following on your device, and nowhere else:

- **Plant records** — the name, species, room, plant type, and light needs you enter for each plant.
- **Care schedules** — how often you want to water, mist, fertilize, rotate, and prune each plant.
- **Care history** — a log of each care action, including its date and any free-text note you choose to write.
- **Photos** — an optional photo per plant, taken with your camera or chosen from your photo library.
- **App preferences** — whether reminders are on, what time they arrive, and your light/dark appearance choice.

This information is written to a private database and photo folder inside Verdant's own storage area on your device. It is not transmitted to us, and we have no ability to access it. **None of the content listed above is included in the anonymous usage analytics described in Section 5** — no plant name, species, room, note, identifier, or photo is ever sent anywhere.

### Information We Do Not Collect

- We do not collect personal information or create user profiles.
- We do not require or offer account creation, sign-in, or email registration.
- We do not collect your name, email address, phone number, or contacts.
- We do not collect or request your location.
- We do not collect health, financial, or biometric information.
- We do not use advertising, attribution, or crash-reporting services. We do use one anonymous usage-analytics service, described in full in Section 5; it receives interaction counts only, never the content you create.
- We do not track you across other apps or websites, and we do not access your device's advertising identifier (IDFA/AAID).

---

## 2. Device Permissions Verdant Asks For

Every permission below is optional. Verdant remains fully usable if you decline all of them.

| Permission | Why | What leaves your device |
|---|---|---|
| **Camera** | To take a photo of a plant when you choose "Take a photo." | Nothing. The photo is saved locally. |
| **Photo Library** | To attach an existing photo to a plant. | Nothing. Verdant copies the single image you pick into its own storage and does not read the rest of your library. |
| **Notifications** | To deliver your daily care reminder. | Nothing. See Section 3. |

Verdant does not request location, contacts, microphone, calendar, health, or Bluetooth access, and contains no code capable of doing so.

On Android, Verdant declares the standard `INTERNET` permission, which the analytics described in Section 5 require. It is a normal-level permission: Android grants it at install time without a prompt, and it gives the app no access to anything on your device.

---

## 3. Reminders and Notifications

If you turn reminders on, Verdant schedules a daily notification listing the plants due for care.

These notifications are **created and delivered entirely on your device** by the operating system's local notification scheduler. There is no push server, no remote notification service, and no account associated with them. The content of a reminder is computed on your device from the plant data already stored there.

To schedule your reminder at the correct local hour, Verdant reads your device's current time zone. That time zone is used on-device only and is never transmitted.

You can turn reminders off at any time in Verdant's About screen, or revoke the notification permission in your device's system settings.

---

## 4. How Your Information Is Used and Shared

The plant data you create is used for one purpose: to run the app's features — your garden list, care schedules, care history, and reminders. It stays on your device and reaches no one else.

The anonymous usage events described in Section 5 are used for one purpose as well: to understand, in aggregate, which parts of Verdant people actually use, so we can decide what to improve. They are not used to build a profile of you, to advertise to you, or to make any decision about an individual.

**We do not sell, rent, trade, or share your personal information.** Your garden content never reaches us at all, and the usage events that do reach us are anonymous — they identify no person, contain no account, and are not linked to any identity we could sell or share even if we wanted to. The only third party that receives them is Aptabase, which processes them on our behalf as our service provider under its own published privacy policy and does not use them for advertising or resale.

We may disclose information only if required by law, regulation, legal process, or a lawful government request. In practice we hold no personal data about you: your garden content is not ours to produce, and the analytics we hold are anonymous aggregates that could not be tied to a named individual.

---

## 5. Third-Party Services and Network Activity

Verdant incorporates exactly one third-party service that transmits anything off your device: the anonymous usage analytics described below. It contains **no advertising, attribution, crash-reporting, or data-brokerage software**, and no other software development kit that sends information anywhere.

Apart from those analytics events, **Verdant makes no network requests on its own initiative.** There is no account server, no cloud sync, no remote content to fetch, and no background upload of your data. The typefaces the app is designed in (Bitter and Mulish) are bundled inside the app itself and are not downloaded. Every other component Verdant incorporates is an open-source library that runs entirely on your device and sends nothing anywhere.

### Anonymous Usage Analytics (Aptabase)

Verdant uses **Aptabase** (https://aptabase.com), a privacy-focused analytics provider, to measure in aggregate how the app is used. Aptabase acts as our **data processor**: it handles these events on our behalf and under our instructions.

**The complete set of events Verdant is capable of sending is the following five. There are no others, and each carries only fixed, predefined values — never free text, never anything you typed:**

| Event | What it means | Values sent with it |
|---|---|---|
| `app_opened` | The app was launched. | None. |
| `screen_viewed` | You opened one of the app's screens. | `screen`: one of `garden`, `care`, `plant_detail`, `add_plant`, `about`. |
| `plant_added` | You added a plant. | `garden_size`: a size band — one of `1`, `2-3`, `4-10`, `11+`. Never the exact number of plants you own. |
| `care_logged` | You marked a care action done. | `care_type`: one of `water`, `mist`, `fertilize`, `rotate`, `prune`. |
| `reminders_toggled` | You turned reminders on or off. | `enabled`: true or false. |

**What is never sent:** no plant name, species, room, plant type, note, photo, photo path, care date, internal identifier, or any other content you create. None of your garden ever leaves your device. The events above record that an action of a given kind happened — not what it was about.

**No persistent identifier.** Verdant has no account, no login, and no user ID. It does not read or transmit your device's advertising identifier (IDFA/AAID) or any other persistent device identifier. The Aptabase SDK assigns a temporary session identifier that expires after one hour of inactivity, so activity is not linked across sessions by the app. On its own servers, Aptabase derives a rotating identifier from a salted hash of the network IP address the request arrived from, discards it every 24 hours, and does not retain the raw IP address — so events cannot be correlated across days, or across different apps using Aptabase.

**Automatically attached by the Aptabase SDK**, as standard technical context on each event: operating system name and version, device locale, Verdant's version and build number, and whether the build is a debug build. These are properties of the software environment, not of you.

**Where it goes.** Our Aptabase account is configured for the European Union region, so these events are processed and stored exclusively on servers in the European Union (Germany). Events are transmitted over an encrypted HTTPS connection. Aptabase's own privacy policy, which governs its handling of this data as our processor, is available at https://aptabase.com/privacy.

**What it is not used for.** These events are not used for advertising, for cross-app or cross-site tracking, for profiling, for any automated decision about you, or for any purpose beyond understanding aggregate usage of Verdant itself. They are not sold, rented, or traded.

**When analytics run.** Analytics are active only in released builds of Verdant that ship with a valid analytics key. They are disabled entirely in development, testing, and any build without that key — in those builds no network request is made at all.

**Offline behaviour.** Verdant's own features — your plants, photos, care schedules, history, and reminders — continue to work fully offline and in airplane mode, exactly as before; none of them needs a network connection. Analytics events are the sole exception: when the device is offline they are held on the device by the Aptabase SDK and sent once connectivity returns, or discarded.

### Links You Choose to Open

Verdant's About screen contains links to our website, this Privacy Policy, an email address for contacting us, and — on iOS — a shortcut to Verdant's page in your system settings. These open only when you tap them, in your browser, mail app, or Settings app. Once you leave Verdant, the privacy policy of that destination applies instead of this one. We receive no notification that you tapped a link.

---

## 6. Device Backups

If you have enabled iCloud Backup (iOS) or Android's backup service, your device's operating system may include Verdant's data — including your plant records and photos — in the encrypted backup it makes of your device.

Those backups are made by Apple or Google under **their** privacy policies and terms, not ours. We cannot access them, and we are not party to them. You can review or disable app backups in your device's system settings.

---

## 7. Data Retention and Deletion

Verdant retains your data on your device until you remove it. There is no server-side copy of your garden with a retention period, because we operate no server and hold no copy of it.

The anonymous usage events described in Section 5 are retained by Aptabase under its retention practices for the purpose of showing us aggregate usage trends over time. Because those events contain no identifier that points to you, there is no way — for us, for Aptabase, or for you — to single out "your" events and remove them individually; there is nothing in them by which to find you. The deletion options below therefore cover every piece of data that is actually yours.

You can delete your data in three ways:

1. **Delete an individual plant** in the app. This removes the plant record, its photo file, and its entire care history, and cancels any reminders that referred to it.
2. **Delete everything** from Verdant's About screen. This removes every plant, photo, and care record on the device and cancels all scheduled reminders. This action cannot be undone.
3. **Uninstall Verdant.** The operating system deletes the app's database and photo folder along with it. (A pre-existing device backup, as described in Section 6, may still contain a copy until that backup is overwritten or deleted through your Apple or Google account.)

---

## 8. Data Security

Your data's security rests on your device's own protections. Verdant's database and photos live in the app's private storage area, which the operating system isolates from other apps, and which is covered by your device's disk encryption when a passcode or biometric lock is set.

We recommend keeping a passcode enabled and your operating system up to date. Because your garden content is never transmitted, there is no server of ours holding it for an attacker to breach and no transmission of it for one to intercept. The anonymous usage events described in Section 5 are sent over an encrypted HTTPS connection, and contain nothing that would identify or harm you if intercepted.

---

## 9. Your Rights

You already hold complete, direct control over every piece of information Verdant handles: you can view, edit, and delete any plant, photo, note, or schedule at any time inside the app, without asking us.

Because we hold no copy of your garden data, we cannot access, correct, export, or delete it on your behalf — there is nothing on our side to act on. This is a consequence of the app's design, not a refusal. The anonymous usage events in Section 5 are the only data that reaches us, and they contain no identifier by which your events could be located, retrieved, or singled out for deletion.

### For Residents of the European Economic Area and the United Kingdom (GDPR / UK GDPR)

For the plant data you create in Verdant, we are **not a data controller**: that data is never transmitted to us, and we have no access to it or means of obtaining it.

For the anonymous usage events described in Section 5, we are the controller and **Aptabase is our processor**. We rely on our **legitimate interest** (Article 6(1)(f) GDPR) in understanding aggregate usage of our own app in order to maintain and improve it. That interest is narrowly drawn: the data is minimised to five event types with fixed values, carries no account, no advertising identifier and no content you create, is not used to build a profile of you, and supports no automated decision-making. These events are processed and stored on Aptabase's servers in the European Union (Germany), as described in Section 5.

Because these events contain no identifier linking them to you, we cannot identify you from them, and Article 11 GDPR does not require us to acquire additional information in order to do so. You retain the right to object to this processing under Article 21 GDPR; write to us at sergio951112@gmail.com and we will act on your objection.

Your GDPR rights — access, rectification, erasure, restriction, portability, and objection — over the data you create are exercised directly on your device, as described above. You may contact us at sergio951112@gmail.com with any question, and you retain the right to lodge a complaint with the supervisory authority in your country of residence.

### For Colombian Residents (Ley 1581 de 2012 — Habeas Data)

The developer of Verdant is based in Colombia. Colombian data protection law — **Ley Estatutaria 1581 de 2012** and its implementing **Decreto 1377 de 2013** — establishes your constitutional right of *habeas data*: to know, update, rectify, and delete the personal data held about you, and to withdraw any authorization for its processing.

Verdant does not collect, store, transmit, or process your personal data on our side. The anonymous usage events described in Section 5 are not attributed to any identified or identifiable person ("titular"), so we operate no database ("base de datos") of personal information subject to registration with the Registro Nacional de Bases de Datos. There is accordingly no authorization for you to withdraw and no record held by us for you to consult, update, or delete — you exercise complete control over your information directly on your device, as described in Sections 7 and 9.

If you believe your habeas data rights have been affected, you may contact us at sergio951112@gmail.com, and you have the right to file a complaint with the **Superintendencia de Industria y Comercio (SIC)**, Colombia's data protection authority (https://www.sic.gov.co).

### For California Residents (CCPA / CPRA)

We have never sold your personal information, and we have never shared it for cross-context behavioural advertising, as those terms are defined by the CCPA/CPRA. We do not do so now and have no plans to. We therefore provide no "Do Not Sell or Share My Personal Information" link, because there is nothing to opt out of.

The only information Verdant transmits is the anonymous usage events described in Section 5. They contain no identifiers, no content you create, and nothing that is reasonably capable of being associated with you or your household, and we make no attempt to re-identify them. We collect no sensitive personal information as the CPRA defines it. You will never be discriminated against for exercising a privacy right. Questions: sergio951112@gmail.com.

### App Tracking Transparency

Apple defines "tracking" narrowly: linking data collected in an app with data from other companies' apps, websites, or offline properties for targeted advertising or advertising measurement, or sharing data with a data broker. Verdant collects the anonymous usage events described in Section 5, but that collection is not tracking under this definition.

Specifically, Verdant does not access the Advertising Identifier (IDFA), collects no data linked to your identity, links no data to third-party data for advertising or measurement purposes, serves no advertising, uses no attribution or ad-network SDK, and shares data with no data broker. The analytics are first-party, anonymous, and used solely to understand aggregate use of Verdant itself.

Verdant therefore does not present, and is not required to present, an App Tracking Transparency prompt.

---

## 10. Children's Privacy

Verdant is not directed to children under 13 and is not offered in Apple's Kids Category. We do not knowingly collect personal information from children under 13 — consistent with Sections 1 and 5, we collect no personal information from any user of any age, and the anonymous usage events Verdant sends contain no identifier, no contact detail, and no content, whatever the age of the person using the app. If you believe a child has provided us with personal information, contact us at sergio951112@gmail.com.

---

## 11. Changes to This Privacy Policy

We may update this Privacy Policy — for example, if a future version of Verdant adds a feature that changes how data is handled. When we make significant changes, we will:

- Update the "Last Updated" date at the top of this document
- Post the updated policy at https://sergiocarodev.com/verdantapp/privacy-policy

Your continued use of Verdant after changes are posted constitutes acceptance of the updated Privacy Policy.

---

## 12. Contact Us

Questions or concerns about this Privacy Policy or Verdant's data practices:

- **Email:** sergio951112@gmail.com
- **Developer:** Sergio Caro
- **Website:** https://sergiocarodev.com/verdantapp
