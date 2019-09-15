//
//  PtrestController.swift
//  FMSwipify_Example
//
//  Created by Franck-Stephane Ndame Mpouli on 15/09/2019.
//  Copyright © 2019 CocoaPods. All rights reserved.
//
import UIKit
import FMSwipify

class PtrestController: SwipifyController<PostCell, Post> {
    override var cellSource: CellSource { return .nib }
    override var cellSize: CGSize { return CGSize(width: collectionView.frame.width, height: 350)}
    override var data: [[Post]] { return DataStore.store.ptrstposts }
    
    let config = Config(
        sectionsTitle: ["All", "Trending", "Art", "Food", "Home", "Men's style", "DIY", "Travel", " Humour", "Eductation"],
        sectionTitleFont: .systemFont(ofSize: 13, weight: .bold),
        sectionsBackgroundColor: .white,
        sectionsSelectedColor: .darkGray,
        sectionsUnselectedColor: .lightGray,
        sectionsSelectorColor: #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 0.3500907401),
        sectionSelectorType: .bubble
    )
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setConfig(config)
        
    }
}
