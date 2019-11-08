//
//  ViewController.swift
//  FMSwipify
//
//  Created by FranckNdame on 09/12/2019.
//  Copyright (c) 2019 FranckNdame. All rights reserved.
//

import UIKit
import FMSwipify

class ViewController: SwipifyController<PostCell, Post> {
    
    override var cellSource: CellSource { return .nib }
    override var cellSize: CGSize { return CGSize(width: collectionView.frame.width, height: 350)}
    override var data: [[Post]] { return DataStore.store.posts }
    
    
    lazy var config = Config(
        sectionTitleFont: .systemFont(ofSize: 16, weight: .medium),
        sectionsIcon: DataStore.store.icons,
        sectionIconSize: .init(width: 30, height: 30),
        sectionsBackgroundColor: .red,
        sectionsSelectedColor: .white,
        sectionsUnselectedColor: UIColor(white: 0, alpha: 0.6),
        sectionsSelectorColor: .white,
        sectionSelectorType: .bar,
        placeholderImage: #imageLiteral(resourceName: "open-box"),
        innerColletionBackground: UIColor.gray,
        innerMinLineSpacing: 16
    )


//   topAnchorCst
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.backgroundColor = .clear
        let paragraphStyle: NSMutableParagraphStyle = NSMutableParagraphStyle()
        paragraphStyle.alignment = NSTextAlignment.center
        let attributes = NSMutableAttributedString(string: "No New Requests!", attributes: [.font: UIFont.systemFont(ofSize: 16, weight: .semibold), .foregroundColor: UIColor.lightGray, .paragraphStyle: paragraphStyle])
        
        config.placeholderAttributes = attributes
        setConfig(config)
        
        
    }
    
}

