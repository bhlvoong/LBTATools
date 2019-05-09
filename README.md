# LBTATools

[![CI Status](https://img.shields.io/travis/Brian Voong/LBTATools.svg?style=flat)](https://travis-ci.org/Brian Voong/LBTATools)
[![Version](https://img.shields.io/cocoapods/v/LBTATools.svg?style=flat)](https://cocoapods.org/pods/LBTATools)
[![License](https://img.shields.io/cocoapods/l/LBTATools.svg?style=flat)](https://cocoapods.org/pods/LBTATools)
[![Platform](https://img.shields.io/cocoapods/p/LBTATools.svg?style=flat)](https://cocoapods.org/pods/LBTATools)

## Description
Do you suffer from ugly layout code and boring UICollectionViewController boilerplate code?  Yes, we've all been there. I'm not the only one that has written view setup functions that are so monstrous that it feels like a **beast from hell**.  

Now, there is a solution to this problem: **LBTATools**.

There are 3 main problems I want to tackle here:

1. Use UIStackView to layout everything, but reduce overall code.
2. Create quick vertical and horizontal lists, but skip the boring cell registration, numItemsForSection, cellForItemAt code.
3. Generate a UILabel, UIButton, UIView, etc.. with one line of code.

Below are solutions that I use for various client work.

### 1. Stack vertically and horizontally
Layouts can usually be broken down into some combination of horizontal and vertical **UIStackViews**. The following examples illustrate usage of **stack** and **hstack**.

##### Example 1: Simple Vertical Layout
![Example Layout 1](https://letsbuildthatapp-videos.s3-us-west-2.amazonaws.com/3944b324-0a30-49d8-b5ef-f43b658ab826)

```swift
stack(imageView, nameLabel)
```

##### Example 2: Horizontal then vertical with center alignment
![Example Layout 2](https://letsbuildthatapp-videos.s3-us-west-2.amazonaws.com/fcdb248e-6137-40a9-bd0d-7a8552b2e77c)

```swift
hstack(imageView,
       stack(nameLabel, messageLabel, spacing: 4),
       spacing: 16, alignment: .center)
```


##### Example 3: Stack with layoutMargins.   


![Example Layout 3](https://letsbuildthatapp-videos.s3-us-west-2.amazonaws.com/a4c78c29-13af-4cd7-8cfe-0f963b906a0e)

```swift
stack(imageView,
      stack(titleLabel, 
      	    descriptionLabel, 
      	    UIView(), 
      	    exploreLabel, spacing: 16)).withMargins(.allSides(16)
```

<br/>  

### 2. Fast and Easy ListController  

Writing iOS apps will almost always involve lists, lots and lots of lists.  Most of these will be vertical but horizontal ones are quite common too.  

**Tinder Messages List Example**  

Using LBTAListController you can build out very common list patterns with just a few lines:  

![Tinder Messages List](https://letsbuildthatapp-videos.s3-us-west-2.amazonaws.com/2d0827c2-cf40-4faa-8300-1b3d37d390db)

<br>
This view simplifies into one vertical list and a header that contains a horizontal list:  
<br/> 

![Simple Header List](https://letsbuildthatapp-videos.s3-us-west-2.amazonaws.com/f2fe6e0a-ce65-4e25-903b-78fd6c77a337)

Building this list is very easy now:  

```swift
class GreenCell: LBTAListCell<UIColor> {
    override var item: UIColor! { didSet { backgroundColor = item }}
}

class SimpleListController: LBTAListController<GreenCell, UIColor, SimpleHeader> {
    override func viewDidLoad() {
        super.viewDidLoad()
        items = [.green, .green, .green, .green]
    }
    // sizing methods
}
```
The header also contains a ListController component:

```swift
class SimpleHeader: UICollectionReusableView {
    
    class BlueCell: LBTAListCell<UIColor> {
        override var item: UIColor! { didSet { backgroundColor = item }}
    }
    class HeaderHorizontalController: LBTAListController<BlueCell,
        UIColor, UICollectionReusableView> {
        override func viewDidLoad() {
            super.viewDidLoad()
            items = [.blue, .blue, .blue, .blue]
        }
    }
    
    let blueCellsHorizontalController = HeaderHorizontalController(scrollDirection: .horizontal)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        stack(blueCellsHorizontalController.view)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError()
    }
}
```

Run the example project in this repository to see the code in its entirety.  LBTAListController uses the power of Generics to handle dynamics cell and header classes.

## Installation - Cocoapods

[CocoaPods](https://cocoapods.org) is an easy to use dependency manager . To install LBTATools simply add the following line to your Podfile:

```ruby
pod 'LBTATools'
```
No, I don't see myself writing this for SPM or any other package manager.

## Author

Brian Voong  
Email: admin@letsbuildthatapp.com  
[Twitter](https://twitter.com/buildthatapp) [YouTube](https://www.youtube.com/letsbuildthatapp)

## License

LBTATools is available under the MIT license. See the LICENSE file for more info.
