![](Preview.gif)

# UIRating
A customizable rating View written in Swift.

![Supported Platforms](https://img.shields.io/cocoapods/p/I?color=blue)
[![Swift Version](https://img.shields.io/badge/language-swift%205.0-brightgreen.svg)](https://developer.apple.com/swift)
[![Pod Version](https://img.shields.io/cocoapods/v/UIRating.svg)](https://cocoapods.org/pods/UIRating)
[![Documentation](docs/badge.svg)](http://shadow-of-arman.github.io/UIRating/) 
![Travis Build](https://www.travis-ci.com/shadow-of-arman/UIRating.svg?token=weF1xTzfUenaV6bq2Q5P&branch=master)
[![GitHub license](https://img.shields.io/badge/license-MIT-important.svg)](https://github.com/shadow-of-arman/UIRating/blob/master/LICENSE)

### Features
- [x] Super easy and simple to implement.
- [x] Drag through to rate.
- [x] Allow half rating.
- [x] Customizable icons. 
- [x] Customizable option to rate from.

# Quick Start

`UIRating` is available for installation using the Cocoa dependency manager [CocoaPods](http://cocoapods.org/).  Alternatively, you can simply copy the `UIRating.swift` file into your Xcode project.

```ruby
# CocoaPods
pod "UIRating", "~> 1.0"
```
## Usage

The sample project in the example folder provides an example of how to integrate `UIRating`, otherwise you can follow these steps.

Create an instance of UIRating: 

``` Swift
 let ratingView = UIRating()
```
Give the desired constraints and set the delegate:

``` Swift
 self.ratingView.delegate = self
```
DONE! 

#### Customization


``` Swift
 self.stackView.emptyIcon = UIImage(named: "example")    //sets the icon for empty rating.
 self.stackView.halfFullIcon = UIImage(named: "example") //sets the icon for half a rating.
 self.stackView.fullIcon = UIImage(named: "example")     //sets the icon for a full rating.

 self.stackView.numberOfOptions = 7 //sets the number of rating options.
 
 self.stackView.allowHalfSelections = true //enables selecting half a rating.

 self.stackView.spacing = 10 //sets the spacing between each rating icon.
```

#### Delegate

```Swift
 extension ViewController: UIRatingDelegate {
    func currentRating(rating: Double) {
        print(rating)
    }
}

```

## Documentation
You can find [the docs here](http://shadow-of-arman.github.io/UIRating/). Documentation is generated with [jazzy](https://github.com/realm/jazzy) and hosted on [GitHub-Pages](https://pages.github.com).

## Community

- Found a bug? Open an [issue](https://github.com/shadow-of-arman/UIRating/issues).
- Feature idea? Open an [issue](https://github.com/shadow-of-arman/UIRating/issues).
- Want to contribute? Submit a [pull request](https://github.com/shadow-of-arman/UIRating/pulls).

## Resources

* [Swift Evolution](https://github.com/apple/swift-evolution)

## License

UIRating is available under the MIT license, see the [LICENSE](https://github.com/shadow-of-arman/UIRating/blob/master/LICENSE) file for more information.
