# FMSwipify

[![CI Status](https://img.shields.io/travis/FranckNdame/FMSwipify.svg?style=flat)](https://travis-ci.org/FranckNdame/FMSwipify)
[![Version](https://img.shields.io/cocoapods/v/FMSwipify.svg?style=flat)](https://cocoapods.org/pods/FMSwipify)
[![License](https://img.shields.io/cocoapods/l/FMSwipify.svg?style=flat)](https://cocoapods.org/pods/FMSwipify)
[![Platform](https://img.shields.io/cocoapods/p/FMSwipify.svg?style=flat)](https://cocoapods.org/pods/FMSwipify)

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Usage
- Controller

```swift
import FMSwipify

class ViewController: SwipifyController<YourCell, YourModel> {

    override var sectionsTitle: [String] { return  ["One", "Two", "Three"] }

    // .nib or .code
    override var cellSource: CellSource { return .nib }
    override var cellSize: CGSize { return CGSize(width: collectionView.frame.width, height: 70)}

    override var data: [[YourModel]] { return
        [[YourModel(title: "Hello", subTitle: "World"), YourModel(title: "HAHA", subTitle: "YOYO"), YourModel(title: "Test", subTitle: "ing")],
        [YourModel(title: "My name", subTitle: "is franck")],
        [YourModel(title: "123", subTitle: "456"), YourModel(title: "0976", subTitle: "122")]
        ]
    }

    // Prints the selected item
    override func didSelectItemAt(section: Int, item: Int) {
        print(data[section][item])
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
struct Your Model {
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

## License

FMSwipify is available under the MIT license. See the LICENSE file for more info.
# FMSwipify
