# LBTATools

[![CI Status](https://img.shields.io/travis/Brian Voong/LBTATools.svg?style=flat)](https://travis-ci.org/Brian Voong/LBTATools)
[![Version](https://img.shields.io/cocoapods/v/LBTATools.svg?style=flat)](https://cocoapods.org/pods/LBTATools)
[![License](https://img.shields.io/cocoapods/l/LBTATools.svg?style=flat)](https://cocoapods.org/pods/LBTATools)
[![Platform](https://img.shields.io/cocoapods/p/LBTATools.svg?style=flat)](https://cocoapods.org/pods/LBTATools)

## Description
Do you suffer from ugly layout code and boring UICollectionViewController boilerplate code?  Yes, we've all been there. I'm not the only one that has written view setup functions that are so monstrous that it feels like a **beast from hell**.  

Now, there is a solution to this problem: **LBTATools**.

There are two main problems I want to tackle here:

1. Use UIStackView to layout everything, but reduce overall code.
2. Create quick vertical and horizontal lists, but skip the boring cell registration, numItemsForSection, cellForItemAt code.

Below are solutions that I use for various client work.

### Stack vertically and horizontally
Layouts can usually be broken down into some combination of horizontal and vertical **UIStackViews**. The following are a few examples of how to use stack and hstack to get her done:

##### Example 1: Simple Vertical Layout
![Example Layout 1](https://letsbuildthatapp-videos.s3-us-west-2.amazonaws.com/9f7a415e-c521-422a-a9c4-15f4597e20ac)

```swift
stack(imageView, nameLabel)
```

##### Example 2: Horizontal then vertical with center alignment
![Example Layout 2](https://letsbuildthatapp-videos.s3-us-west-2.amazonaws.com/7945ce8a-e627-4753-b574-1d266fa10589)

```swift
hstack(imageView,
       stack(nameLabel, messageLabel, spacing: 4),
       spacing: 16, alignment: .center)
```


##### Example 3: Stack with layoutMargins
![Example Layout 3](https://letsbuildthatapp-videos.s3-us-west-2.amazonaws.com/a4c78c29-13af-4cd7-8cfe-0f963b906a0e)

```swift
stack(imageView,
      stack(titleLabel, 
      		descriptionLabel, 
      		UIView(), 
      		exploreLabel, spacing: 16)).withMargins(.allSides(16)
```


## Installation

[CocoaPods](https://cocoapods.org) is an easy to use dependency manager . To install LBTATools simply add the following line to your Podfile:

```ruby
pod 'LBTATools'
```

## Author

Brian Voong, admin@letsbuildthatapp.com

## License

LBTATools is available under the MIT license. See the LICENSE file for more info.
