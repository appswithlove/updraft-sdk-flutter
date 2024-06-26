![Updraft: Mobile App Distribution](https://raw.githubusercontent.com/appswithlove/updraft-sdk-flutter/master/updraft.png)
[![GitHub license](https://img.shields.io/badge/license-MIT-lightgrey.svg)](https://raw.githubusercontent.com/appswithlove/updraft-sdk-flutter/master/LICENSE)
[![Twitter](https://img.shields.io/badge/twitter-@GetUpdraft-blue.svg?style=flat)](https://twitter.com/GetUpdraft)


# Updraft SDK

Updraft SDK for Flutter

Updraft is a super easy app delivery tool that allows you to simply and quickly distribute your app. It's super useful during beta-testing or if you want to deliver an app without going through the app store review processes. Your users get a link and are guided through the installation process with in a comprehensive web-app. Updraft works with Android and iOS apps and easily integrates with your IDE.
The SDK adds additional features to apps that are delivered with Updraft: Auto-update for your distributed apps and most importantly the collection of user feedback.

Updraft is built by App Agencies [Apps with love](https://appswithlove.com/) and [Moqod](https://moqod.com/). Learn more at [getupdraft.com](https://getupdraft.com/) or follow the latest news on [twitter](https://twitter.com/GetUpdraft).


## Installation

Add this line to your pubspec.yaml file:

```
updraft_sdk_flutter: ^0.0.1-dev2

```

## Setup

Initilaise SDK in main method of your app 

```
void main() async {
  await UpdraftSdk.init(
    UpdraftSettings("<YOUR-SDK-KEY>", "<YOUR-APP-KEY>"),
  );
  runApp(const MyApp());
}
```
### Parameters
- <b>YOUR-SDK-KEY</b>: Your sdk key obtained on [Updraft](https://getupdraft.com)
- <b>YOUR-APP-KEY</b>: You app key obtained on [Updraft](https://getupdraft.com)

## AutoUpdate
Auto Update functionality can be enabled/disabled on [getupdraft.com](https://getupdraft.com/) in your app edit menu.

AutoUpdate work by comparing the build number of the app installed on the user's device and the app uploaded on GetUpdraft.

A prompt is displayed to the user if his installed version is lower than the version on Updraft.
Thus, the build number must be incremented for each new build release to trigger the auto-update process.

Micro version comparison is supported, for example version 1.2.3.2018080**4** is greater than version 1.2.3.2018080**3**

## Feedback

Feedback functionality can be enabled/disabled on [getupdraft.com](https://getupdraft.com/) in your app edit menu.

A prompt is shown to the user to inform him of the change of state of the feedback functionality.

If enabled, the user is explained how he can give feedback.
User can take a screenshot to give a feedback.
