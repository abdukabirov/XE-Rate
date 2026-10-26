<h1 align="center">XE-Rate</h1>

<p align="center">
  Track live cryptocurrency and currency exchange rates, and convert between currencies, in one Flutter app.
</p>

<p align="center">
  <img alt="Flutter" src="https://img.shields.io/badge/-Flutter-02569B?style=flat-square&logo=flutter&logoColor=white" />
  <img alt="Dart" src="https://img.shields.io/badge/-Dart-0175C2?style=flat-square&logo=dart&logoColor=white" />
  <img alt="Platforms" src="https://img.shields.io/badge/platforms-Android%20%7C%20iOS%20%7C%20Web-3DDC84?style=flat-square" />
  <img alt="Stars" src="https://img.shields.io/github/stars/abdukabirov/XE-Rate?style=flat-square&labelColor=343b41" />
</p>

<!-- TODO: add screenshots. Put images in a /screenshots folder, then uncomment:
<p align="center">
  <img src="screenshots/crypto.png" width="220" />
  <img src="screenshots/currency.png" width="220" />
  <img src="screenshots/exchange.png" width="220" />
</p>
-->

## Features

The app has three tabs in a bottom navigation bar:

- **Crypto:** the top 100 coins by market cap, with price and 24-hour change.
- **Currency:** live rates for a base currency, with country flags.
- **Exchange:** converts an amount from one currency to another.

There is also a side menu with a dark and light theme switch.

## Data sources

| Tab | Source | API key |
|---|---|---|
| Crypto | [CoinGecko](https://www.coingecko.com/en/api) | No |
| Currency | [Open Exchange Rates API](https://open.er-api.com) | No |
| Exchange | [ExchangeRate-API](https://www.exchangerate-api.com/docs/pair-conversion-requests) | Yes, free plan is enough |

Flags come from [flagcdn.com](https://flagcdn.com).

## Getting started

You need [Flutter](https://docs.flutter.dev/get-started/install) (Dart SDK 3.3.3 or newer).

1. Clone the repository and install packages:

   ```bash
   git clone https://github.com/abdukabirov/XE-Rate.git
   cd XE-Rate
   flutter pub get
   ```

2. Create the API key file. It is ignored by git, so it is not in the repository. Get a free key at [exchangerate-api.com](https://www.exchangerate-api.com), then create `lib/api/api_keys.dart`:

   ```dart
   const String YOUR_SECRET_API = 'paste-your-key-here';
   ```

3. Run the app:

   ```bash
   flutter run
   ```

Without the key file the app does not build, because the Exchange tab imports it.

## Project structure

```
lib/
├── api/        API calls and data models
├── crypto/     Crypto tab
├── currency/   Currency tab
├── exchange/   Exchange tab and side menu
├── router/     Bottom navigation
├── theme/      Dark and light themes
├── main.dart
└── xe_app.dart
```

## Built with

[Flutter](https://flutter.dev) · [dio](https://pub.dev/packages/dio) · [http](https://pub.dev/packages/http) · [shared_preferences](https://pub.dev/packages/shared_preferences) · [currency_picker](https://pub.dev/packages/currency_picker) · [flutter_svg](https://pub.dev/packages/flutter_svg) · [shimmer](https://pub.dev/packages/shimmer)
