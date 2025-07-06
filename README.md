{\rtf1\ansi\ansicpg1252\cocoartf2822
\cocoatextscaling0\cocoaplatform0{\fonttbl\f0\fswiss\fcharset0 Helvetica;}
{\colortbl;\red255\green255\blue255;}
{\*\expandedcolortbl;;}
\paperw11900\paperh16840\margl1440\margr1440\vieww11520\viewh8400\viewkind0
\pard\tx720\tx1440\tx2160\tx2880\tx3600\tx4320\tx5040\tx5760\tx6480\tx7200\tx7920\tx8640\pardirnatural\partightenfactor0

\f0\fs24 \cf0 # \uc0\u55356 \u57124  Qibli \'96 iOS Weather App\
\
Qibli is a clean, minimalistic iOS weather app built using Swift, UIKit, and CoreLocation. It fetches real-time weather data based on user input or current location using the OpenWeatherMap API.\
\
<div align="center">\
    <img src="https://img.shields.io/badge/Swift-5.0-orange" />\
    <img src="https://img.shields.io/badge/iOS-13+-blue" />\
    <img src="https://img.shields.io/badge/Xcode-15+-blue" />\
</div>\
\
---\
\
## \uc0\u55357 \u56561  Features\
\
- \uc0\u55357 \u56589  Search weather by **city name**\
- \uc0\u55357 \u56525  Get weather for **current location**\
- \uc0\u55356 \u57121  Displays **temperature**, **weather condition**, and **city name**\
- \uc0\u55356 \u57256  Clean and responsive **UI with SF Symbols**\
- \uc0\u55356 \u57104  Fetches data from **OpenWeatherMap API**\
- \uc0\u55358 \u56813  Built-in **CoreLocation** permission handling\
- Support for **dark mode**\
---\
\
## \uc0\u55357 \u56568  Screenshots\
\
([Simulator Screenshot - iPhone 16 Pro - 2025-07-01 at 22.09.06.png](https://drive.google.com/file/d/1QcmL_BSUBGXgoGjkI6v6U1TKcEcZGXSs/view?usp=share_link)) \
---\
\
## \uc0\u55358 \u56816  Tech Stack\
\
- **Language:** Swift 5\
- **Frameworks:** UIKit, CoreLocation\
- **API:** OpenWeatherMap (REST)\
- **Architecture:** MVC (Model-View-Controller)\
- **Design:** Storyboard, SF Symbols\
\
---\
\
## \uc0\u55357 \u56550  Installation\
\
1. Clone the repository:\
\
    ```bash\
    git clone https://github.com/yourusername/qibli-ios.git\
    cd qibli-ios\
    ```\
\
2. Open in Xcode:\
\
    ```bash\
    open Qibli.xcodeproj\
    ```\
\
3. Replace the API key in `WeatherManager.swift`:\
\
    ```swift\
    let weatherURL = "https://api.openweathermap.org/data/2.5/weather?appid=YOUR_API_KEY&units=metric"\
    ```\
\
4. Run the project on an iOS Simulator or real device.\
\
---\
\
## \uc0\u55357 \u56592  Permissions\
\
- **Location Usage:** The app requests location access for fetching weather data based on your current coordinates. A fallback alert is shown if permission is denied.\
\
---\
\
## \uc0\u55357 \u56513  Project Structure\
\
Qibli/\
\uc0\u9474 \
\uc0\u9500 \u9472 \u9472  WeatherViewController.swift // Main UI & logic\
\uc0\u9500 \u9472 \u9472  WeatherModel.swift // Weather data model + condition symbol logic\
\uc0\u9500 \u9472 \u9472  WeatherData.swift // JSON response structure\
\uc0\u9500 \u9472 \u9472  WeatherManager.swift // Handles networking & decoding\
\uc0\u9500 \u9472 \u9472  Main.storyboard // App interface & layout\
\uc0\u9500 \u9472 \u9472  LaunchScreen.storyboard // Launch screen\
\uc0\u9492 \u9472 \u9472  Assets.xcassets // Images, symbols, and colors\
\
---\
\
## \uc0\u10024  Future Enhancements\
\
- Add **forecast** for next 5 days\
- Show additional info like **humidity**, **wind speed**, **feels like**, etc.\
- Add **unit switching** (Celsius \uc0\u8596  Fahrenheit)\
- Local **caching** for offline access\
\
}