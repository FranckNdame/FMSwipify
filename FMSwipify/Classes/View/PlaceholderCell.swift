//
//  PlaceholderCell.swift
//  FMSwipify
//
//  Created by Ahmad Karkouti on 04/11/2019.
//

import UIKit

public struct Content {
    var image: UIImage
    var attributes: NSAttributedString
}

@available(iOS 9.0, *)
open class PlaceholderCell: UICollectionViewCell {
    
    var content: Content? {
        didSet {
            guard let content = content else { return }
            imageView.image = content.image
            titleLabel.attributedText = content.attributes
        }
    }
    
    let imageView: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    var titleLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        return label
    }()
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        let stackView = UIStackView(arrangedSubviews: [imageView, titleLabel])
        stackView.alignment = .center
        stackView.distribution = .fillProportionally
        stackView.axis = .vertical
        stackView.spacing = 30
        stackView.anchor(superView: self, leading: leadingAnchor, trailing: trailingAnchor, padding: .init(top: 0, left: 32, bottom: 0, right: 32))
        stackView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        stackView.centerYAnchor.constraint(equalTo: centerYAnchor, constant: -120).isActive = true
    }
    
    required public init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

