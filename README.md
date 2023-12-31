
---

# 🌟 SideRail: Spice Up Your Flutter Navigation! 🌟

Welcome to SideRail, the sizzling-hot Flutter package that will take your app's navigation to the next level! 🚀

![SideRail](https://github.com/Phabbyrich/side_rail/blob/main/preview.png)

## What's SideRail, you ask?

SideRail is your ticket to adding a sleek and customizable sidebar navigation menu to your Flutter app. It's so spicy that it will make your users' experience extra caliente! 🌶️

## How to Get Started

Let's dive into the juicy part – how to get started with SideRail:

1. **Install the Package:**
   First things first, make sure you have SideRail installed in your project. Use `pub.dev` to add this spicy package to your dependencies.

   ```yaml
   dependencies:
     side_rail: ^1.0.0
   ```

2. **Import It:**
   In your Flutter code, import SideRail.

   ```dart
   import 'package:side_rail/side_rail.dart';
   ```

3. **Add the SideRail Widget:**
   Drop the `SideRail` widget into your app to instantly add sizzle and style. Customize it with your preferred colors and icons to match your app's flavor!

   ```dart
   SideRail(
     // Customize your navigation here 🔥
     // ...
   )
   ```

That's it! Your app just got spiced up!

## Features That'll Tickle Your Taste Buds

🌈 **Full Customization:** Spice up the look and feel with customizable options to match your app's personality.

🔗 **Smooth Navigation:** Navigate with flair using the stylish sidebar, making your users say "Wow!"

🎉 **Interactive Elements:** Engage users with clickable icons and smooth animations. It's a real party!

## Examples

Here's a taste of what you can do with SideRail:

```dart
SideRail(
  isExpanded: !isExpanded,
  selectedIndex: _selectedIndex,
  onTap: (index) {
    setState(() {
      _selectedIndex = index;
    });
  },
  expandedWidth: 300,
  backgroundColor: Colors.white,
  // ... Customize further as per your liking
)
```

## Get Ready to Spice It Up!

Get your users dancing to the rhythm of your app with SideRail. Your Flutter app just turned into a fiesta of flavors and features! 💃💥

🔥 Ready to get started? Head to [pub.dev](https://pub.dev/packages/side_rail) to install SideRail now!

Let the good times roll with SideRail! Happy coding! 🚀

---
