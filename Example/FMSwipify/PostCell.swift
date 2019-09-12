//
//  PostCell.swift
//  FMSwipify_Example
//
//  Created by Franck-Stephane Ndame Mpouli on 12/09/2019.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import Foundation
import FMSwipify

class PostCell: SwipifyBaseCell<Post> {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subTitleLabel: UILabel!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        guard let post = item else {return}
        titleLabel.text = post.title
        subTitleLabel.text = post.subTitle
    }
    
}


struct Post {
    let title: String
    let subTitle: String
}


