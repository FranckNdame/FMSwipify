//
//  SectionBarCell.swift
//  FMSwipify
//
//  Created by Franck-Stephane Ndame Mpouli on 12/09/2019.
//

import UIKit

public class SectionBarCell: UICollectionViewCell {
    
    let titleLabel: UILabel = {
        let title = UILabel()
        title.textAlignment = .center
        title.font = UIFont.systemFont(ofSize: 14)
        title.alpha = 0.49
        title.textColor = UIColor.black
        
        return title
    }()
    
    let bar: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(white: 1, alpha: 1)
        view.alpha = 0
        view.layer.cornerRadius = 1.5
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        if #available(iOS 9.0, *) {
            titleLabel.anchor(superView: self, top: topAnchor, leading: leadingAnchor, bottom: bottomAnchor, trailing: trailingAnchor)
            bar.anchor(superView: self, top: nil, leading: nil, bottom: bottomAnchor, trailing: nil, padding: UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0), size: CGSize(width: 80, height: 4))
        }
        if #available(iOS 9.0, *) {
            
        }
        
        if #available(iOS 9.0, *) {
            bar.centerXAnchor.constraint(equalTo: centerXAnchor, constant: 0).isActive = true
        } else {
            // Fallback on earlier versions
        }
        
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    override public var isSelected: Bool {
        didSet {
            if isSelected == true {
                UIView.animate(withDuration: 1) {
                    self.bar.alpha = 1
                    self.titleLabel.font = UIFont.boldSystemFont(ofSize: 14)
                    self.titleLabel.alpha = 1
                }
                
            } else {
                UIView.animate(withDuration: 0.5) {
                    self.bar.alpha = 0
                    self.titleLabel.font = UIFont.systemFont(ofSize: 14)
                    self.titleLabel.alpha = 0.49
                }
            }
            
        }
    }
    
}
