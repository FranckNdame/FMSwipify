//
//  SectionBarCell.swift
//  FMSwipify
//
//  Created by Franck-Stephane Ndame Mpouli on 12/09/2019.
//

import UIKit

@available(iOS 9.0, *)
public class SectionBarCell: UICollectionViewCell {
    
    let titleLabel: UILabel = {
        let title = UILabel()
        title.textAlignment = .center
        return title
    }()
    
    let iconImageView: UIImageView = {
        let iconIV = UIImageView()
        iconIV.contentMode = .scaleAspectFit
        iconIV.clipsToBounds = true
        return iconIV
    }()
    
    
    
    var selectedColor: UIColor = .black
    var iconSize: CGSize = .init(width: 25, height: 25)
    var unselectedColor: UIColor = .lightGray
    let stack = UIStackView()

    override init(frame: CGRect) {
        super.init(frame: frame)
//        backgroundColor = .blue
            addSubview(stack)
        
        
            stack.axis = .horizontal
            stack.spacing = 8
            stack.distribution = .fillProportionally
            stack.alignment = .center
            stack.centerInSuperview()
    
        
        
        
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

    
    @available(iOS 9.0, *)
    func setupIcon() {
        iconImageView.widthAnchor.constraint(equalToConstant: iconSize.width).isActive = true
        iconImageView.heightAnchor.constraint(equalToConstant: iconSize.height).isActive = true
        stack.addArrangedSubview(iconImageView)

    }

    
    func addLabelToStack() {
        stack.addArrangedSubview(titleLabel)
    }
    
    override public var isSelected: Bool {
        didSet {
            if isSelected == true {
                UIView.animate(withDuration: 0.5) {
                    self.titleLabel.textColor = self.selectedColor
                    self.iconImageView.tintColor = self.selectedColor
                }
                
            } else {
                UIView.animate(withDuration: 0.1) {
                    self.titleLabel.textColor = self.unselectedColor
                    self.iconImageView.tintColor = self.unselectedColor
                }
            }
            
        }
    }
    
}
