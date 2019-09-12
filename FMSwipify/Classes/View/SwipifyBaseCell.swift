//
//  SwipifyBaseCell.swift
//  FMSwipify
//
//  Created by Franck-Stephane Ndame Mpouli on 12/09/2019.
//

import UIKit

open class SwipifyBaseCell<P>: UICollectionViewCell {
    public var item: P? {
        didSet {
            awakeFromNib()
        }
    }
}
