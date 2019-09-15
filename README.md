# FMSwipify

[![CI Status](https://img.shields.io/travis/FranckNdame/FMSwipify.svg?style=flat)](https://travis-ci.org/FranckNdame/FMSwipify)
[![Version](https://img.shields.io/cocoapods/v/FMSwipify.svg?style=flat)](https://cocoapods.org/pods/FMSwipify)
[![License](https://img.shields.io/cocoapods/l/FMSwipify.svg?style=flat)](https://cocoapods.org/pods/FMSwipify)
[![Platform](https://img.shields.io/cocoapods/p/FMSwipify.svg?style=flat)](https://cocoapods.org/pods/FMSwipify)

## Overview

![](dummytube.gif) &nbsp ![](twtr.gif)

<img src="twtr.gif" alt="Kitten" />

## Usage
- Controller

```swift
import UIKit
import FMSwipify

class ViewController: SwipifyController<YourCell, YourModel> {

    override var cellSource: CellSource { return .nib }
    override var cellSize: CGSize { return CGSize(width: collectionView.frame.width, height: 350)}
    override var data: [[Post]] { return DataStore.store.posts }

    let config = Config(
        sectionTitleFont: .systemFont(ofSize: 16, weight: .medium),
        sectionsIcon: DataStore.store.icons,
        sectionIconSize: .init(width: 30, height: 30),
        sectionsBackgroundColor: .red,
        sectionsSelectedColor: .white,
        sectionsUnselectedColor: UIColor(white: 0, alpha: 0.6),
        sectionsSelectorColor: .white,
        sectionSelectorType: .bar
    )

    override func viewDidLoad() {
        super.viewDidLoad()
        setConfig(config)
    }
}
```
- Cell

```swift
import FMSwipify

class YourCell: SwipifyBaseCell<YourModel> {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subTitleLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        guard let yourModel = item else {return}
        titleLabel.text = yourModel.title
        subTitleLabel.text = yourModel.subTitle
    }

}
```

- Model
```swift
struct YourModel {
    let title: String
    let subTitle: String
}
```


## Requirements
Swift 4.0+ and iOS 9.0+ 
## Installation

FMSwipify is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'FMSwipify'
```

## Author

FranckNdame, franck.mpouli@yahoo.com

## Contributing
Forks, patches and other feedback are welcome.

## Development
This library is still in early development, more features and ideas are currently being engineered.

## License

FMSwipify is available under the MIT license. See the LICENSE file for more info.
# FMSwipify
