<p align="center">
  <img src='https://letsbuildthatapp-videos.s3-us-west-2.amazonaws.com/242ca77a-8ebc-4b06-ac96-52ca3f9546c8' />
</p>

<!---
[![CI Status](https://img.shields.io/travis/Brian Voong/LBTATools.svg?style=flat)](https://travis-ci.org/Brian Voong/LBTATools) -->

[![Version](https://img.shields.io/cocoapods/v/LBTATools.svg?style=flat)](https://cocoapods.org/pods/LBTATools)
[![License](https://img.shields.io/cocoapods/l/LBTATools.svg?style=flat)](https://cocoapods.org/pods/LBTATools)
[![Platform](https://img.shields.io/cocoapods/p/LBTATools.svg?style=flat)](https://cocoapods.org/pods/LBTATools)

## The cure for boring UI code
Do you suffer from ugly layout code and boring UICollectionViewController boilerplate code?  Yes, we've all been there. I'm not the only one that has written monstrous view setup functions that look like **beasts from hell**.  

Now, there is a solution to this problem: **LBTATools**.

There are 3 main issues I want to tackle with this library:

1. Use UIStackView to layout everything in a single line.
2. Create quick vertical and horizontal lists, but skip the boring cell registration, numItemsForSection, cellForItemAt code.
3. Generate a UILabel, UIButton, UIView, etc.. with one line of code.

This library contains extensions and classes that speed up development for my client work.  Hopefully, you can take advantage of some of these techniques.

### 1. Stack vertically and horizontally
Layouts can usually be broken down into some combination of horizontal and vertical **UIStackViews**. The following examples illustrate usage of **stack** and **hstack** for common layout patterns.

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
// The key is to use stackView.alignment = .center   
```


##### Example 3: Embedded stacking with layoutMargins.   


![Example Layout 3](https://letsbuildthatapp-videos.s3-us-west-2.amazonaws.com/a4c78c29-13af-4cd7-8cfe-0f963b906a0e)

```swift
stack(imageView,
      stack(titleLabel, 
      	    descriptionLabel, 
      	    UIView(), 
      	    exploreLabel, spacing: 16)).withMargins(.allSides(16)
// Using stackView.layoutMargins allows for easy padding manipulation
```

<br/>  

### 2. Fast and Easy ListController  

Writing iOS apps will almost always involve lists, lots and lots of lists.  Most of these will be vertical but horizontal ones are quite common too.  **Only works for single cell type lists**.

**Tinder Messages List Example**  

![Tinder Messages List](https://letsbuildthatapp-videos.s3-us-west-2.amazonaws.com/2d0827c2-cf40-4faa-8300-1b3d37d390db)

<br>


Using LBTAListController, you can build this common pattern with just a few lines. First, let's simplify the view into one vertical list and a header that contains a horizontal list:  
<br/> 

![Simplified List Header View](https://letsbuildthatapp-videos.s3-us-west-2.amazonaws.com/29334d01-7880-4274-a45d-59d0d37ac472)

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
        UIColor> {
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

### 3. One line UI elements
One major issue with creating UI elements is the amount of properties we have to set during the setup phase.  Here's a very common, and ugly, chunk of code that we want to avoid:

```swift
let nameLabel: UILabel = {
    let label = UILabel()
    label.text = "Name"
    label.textColor = .black
    label.textAlignment = .center
    label.font = .boldSystemFont(ofSize: 16)
    label.numberOfLines = 2
    return label
}()
```

In total, this is 9 lines of code and gets out of control when creating multiple labels, buttons, etc.  So instead, let's make this simple and elegant with one line:

```swift   
let nameLabel = UILabel(text: "Name", font: .boldSystemFont(ofSize: 16), textColor: .black, 
	textAlignment: .center, numberOfLines: 2)
```

All of the above parameters are optional, this means you can also use:

```swift   
let nameLabel = UILabel(text: "Name", numberOfLines: 2)
```

Creating UIButtons also fall into this category of **code from hell**, so let's make it easy with another one-liner:

```swift   
let nextButton = UIButton(title: "Next", titleColor: .white, font: .boldSystemFont(ofSize: 18), 
	backgroundColor: .white, target: self, action: #selector(handleNext))
```

## Video Tutorials
Although this library is very easy to use, I recognize that a lot of you want some visual examples so below are some video tutorials:

[Using stack and hstack](https://youtu.be/cpZzWZEKTKE)



## Installation - Cocoapods

[CocoaPods](https://cocoapods.org) is an easy to use dependency manager . To install LBTATools, simply add the following line to your Podfile:

```ruby
pod 'LBTATools'
```
No, I don't see myself writing this for SPM or any other system.

## Author

Brian Voong  [@buildthatapp](https://twitter.com/buildthatapp)  [YouTube](https://www.youtube.com/letsbuildthatapp)

## License

LBTATools is available under the MIT license. See the LICENSE file for more info.
