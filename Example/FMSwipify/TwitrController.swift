//
//  TwitrController.swift
//  FMSwipify_Example
//
//  Created by Franck-Stephane Ndame Mpouli on 15/09/2019.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import UIKit
import FMSwipify

class TwitrController: SwipifyController<PostCell, Post> {
    override var cellSource: CellSource { return .nib }
    override var cellSize: CGSize { return CGSize(width: collectionView.frame.width, height: 350)}
    override var data: [[Post]] { return DataStore.store.twtrposts }
    
    let config = Config(
        sectionsTitle: ["For you", "Trending", "News", "Sports", "Fun", "Entertainment"],
        sectionTitleFont: .systemFont(ofSize: 16, weight: .semibold),
        sectionsBackgroundColor: .white,
        sectionsSelectedColor: #colorLiteral(red: 0.1155131832, green: 0.6306006908, blue: 0.9472023845, alpha: 1),
        sectionsUnselectedColor: UIColor(white: 0, alpha: 0.6),
        sectionsSelectorColor: #colorLiteral(red: 0.1155131832, green: 0.6306006908, blue: 0.9472023845, alpha: 1),
        sectionSelectorType: .bar
    )
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setConfig(config)
        
    }
}
