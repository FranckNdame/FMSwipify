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
    
    override var sectionsTitle: [String] { return  ["One", "Two", "Three"] }
    
    override var cellSource: CellSource { return .nib }
    override var cellSize: CGSize { return CGSize(width: collectionView.frame.width, height: 70)}
    
    override var data: [[Post]] { return
        [[Post(title: "Hello", subTitle: "World"), Post(title: "HAHA", subTitle: "YOYO"), Post(title: "Test", subTitle: "ing")],
         [Post(title: "My name", subTitle: "is franck")],
         [Post(title: "123", subTitle: "456"), Post(title: "0976", subTitle: "122")]
        ]
    }
    
    override func didSelectItemAt(section: Int, item: Int) {
        print(data[section][item])
    }
    
}

