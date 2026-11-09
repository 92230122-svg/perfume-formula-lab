# Perfume Formula Lab

**Perfume Formula Lab** is a simple Flutter mobile application designed to calculate the ingredients needed to prepare a perfume formula based on the selected bottle size and ingredient percentages.

## Project Overview

The application helps users calculate the required quantities of:

- Fragrance Oil
- Alcohol
- Fixative

The user selects a bottle size and enters the desired oil and fixative percentages. The application automatically calculates the remaining alcohol quantity.

## Features

- Select bottle sizes: 15ml, 30ml, 50ml, and 100ml.
- Enter fragrance oil percentage.
- Enter fixative percentage.
- Automatically calculate ingredient quantities.
- Validate percentage inputs.
- Prevent invalid formulas where the total percentage exceeds 100%.
- Reset the calculator to its default values.
- Simple and responsive user interface.

## Formula

The application uses the following calculations:

**Fragrance Oil**

`Bottle Size × Oil Percentage ÷ 100`

**Fixative**

`Bottle Size × Fixative Percentage ÷ 100`

**Alcohol**

`Bottle Size − Oil Amount − Fixative Amount`

## Technologies Used

- Flutter
- Dart
- Visual Studio Code
- Git and GitHub

## Installation and Setup

1. Clone the repository:

```bash
git clone https://github.com/92230122-svg/perfume-formula-lab.git
```

2. Navigate to the project folder:

```bash
cd perfume-formula-lab
```

3. Install dependencies:

```bash
flutter pub get
```

4. Run the application:

```bash
flutter run
```

## Testing

Run the project tests using:

```bash
flutter test
```

Check the code for potential issues:

```bash
flutter analyze
```

## Project Information

- **Project Name:** Perfume Formula Lab
- **Course:** Mobile Application Development
- **Framework:** Flutter
- **Language:** Dart
- **Developer:** Hani
- **Project Type:** Individual Project

## Repository

[GitHub Repository](https://github.com/92230122-svg/perfume-formula-lab)

---

*Perfume Formula Lab — Calculate your formula with precision.*