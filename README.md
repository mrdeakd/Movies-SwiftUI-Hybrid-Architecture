# Movies-SwiftUI-Hybrid-Architecture

Hi! This is an interview example application for browsing the most popular movies on iOS that displays a list of the most popular movies, as well as some basic details about them that you can reach by tapping them on the listing screen.

There are two main versions

## 1.0.1

 - SwiftUI navigation
 - Async await and Combine calls are both ready to use
 - Initial Unit testing on the ViewModels
 - NetworkingLayer, DataLayer for networking management
 - Bugfixes
 - Initial Error handling
 - Loading indicator for better UX experience
 - Refactoring on every layer

New ideas for the future:

 - Some sort of SwiftUI navigation could be used like FlowStack to have a manageable navigation solution
 - Paging as the Backend API call supports paging on the most popular movies.
 - Generate networking layer using Open API.

## 2.0.0

*Pretty much the same as 1.** versions, but I will add the differences here.

 - Hibrid UIKit-SwiftUI architecture

## Technology stacks 
Application:
 - Swift
 - SwiftUI
 - UIKit
 - MVVM
 - Hibrid SwiftUI-UIKit
 - Async await / Combine
 - URLSession
 - Coordinator Pattern
 
Development:
 - Github Gitflow
 - Gem
 - CI/CD Gitlab actions
 - SwiftLint
 - SwiftGen
 - Sourcery
 - Fastlane
 - Own shell scripts
 - Cocoapods
 - App simulator build for fast sharing

The workspace uses Gem as a dependency. You can find the Gemfile in the main directory. It helps managing dependencies with the exact version that I want to specify, so we can easily build our application is a fresh, clean environment.

The first step is to install Ruby on your computer. You can do that by using **Homebrew** on a Mac.  

> brew install ruby

To install dependencies with Ruby, please use the command in the main directory

> bundle install

After that we can install pod dependencies using bundle

> bundle exec pod install

The project has Github actions CI/CD solution for building the app and running the tests. The Workflow is defined in the **swift.yml** file.

It uses Fastlane for testing purposes and for the simulator builds. The simulator build is an own script.

You can start these pipelines using the following commands.

For testing:

> fastlane test

For simulator builds that you can find in a prepared zip file. You just need to get it from there and place it inside the simulator.

> fastlane build_app_simulator

The app has a proper guideline using prepared rules to keep the code as clean as possible with **SwiftLint**. Yaml files help defining the rules.

**Sourcery** helps generating the mocks using the basic **AutoMockable** stencil generator.

**Swiftgen** will generate the images, texts and colors for every resource in an efficient way using **Swift** files for type safety on every build.

The code repository is available on **Github**. The app has tags on the different version. I used the **CI/CD job** for prechecks. Without successful pipelines the code couldn't be merged to development. 

I choosed **Merging** instead of **Rebasing**, because I developed it by myself so it was not really necessary to choose one instead of another. 

I did create **pull request**, but since it was just me there was noone else to **review my code**, so I did it myself.

**Gitflow** gives a decent way to handle branches and features, bugs, fixes so I used it. I had a main branch with a development and feature, bug branches. Every feature branch was merged into the development and when I released the 1.0.1 on merging it to the main branch. Currently I have the 2.0.0 version on the development. I also had a hotfix on the main branch as it should happen there.

I have a **Trello Board** where I had my tasks that I was working on. 
[Trello board](https://trello.com/invite/b/4NHizS4I/ATTI4eb3c464bd4964d7dd48250ce5c6d2a337FAA1DE/movies-app)
