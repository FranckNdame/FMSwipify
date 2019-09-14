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
    
    let selector: UIView = {
        let view = UIView()
        view.alpha = 0
        view.layer.cornerRadius = view.bounds.height / 2
        return view
    }()
    
    let iconImageView: UIImageView = {
        let iconIV = UIImageView()
        iconIV.contentMode = .scaleAspectFit
        iconIV.clipsToBounds = true
        return iconIV
    }()
    
    var selectorType: SelectorType? {
        didSet { setupSelector() }
    }
    
    
    var barType: SectionBarType? {
        didSet {
            selector.isHidden = barType == .fixed
        }
    }
    var selectedColor: UIColor = .black
    var iconSize: CGSize = .init(width: 25, height: 25)
    var unselectedColor: UIColor = .lightGray
    let stack = UIStackView()

    override init(frame: CGRect) {
        super.init(frame: frame)
        
            addSubview(selector)
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
    
    func setupSelector() {
        
            switch selectorType! {
                case .bar:
                    selector.anchor(top: nil, leading: leadingAnchor, bottom: bottomAnchor, trailing: trailingAnchor, size: CGSize(width: 0, height: 4))
                
                case .bubble:
                    selector.anchor(top: topAnchor, leading: leadingAnchor, bottom: bottomAnchor, trailing: trailingAnchor, padding: .init(top: 8, left: 8, bottom: 8, right: 8), size: .zero)
                
                case .dot:
                    selector.anchor(top: nil, leading: nil, bottom: bottomAnchor, trailing: nil, size: CGSize(width: 6, height: 6))
                    selector.centerXAnchor.constraint(equalTo: centerXAnchor, constant: 0).isActive = true
            }
        
        
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
                    self.selector.alpha = 1
                    self.titleLabel.font = UIFont.boldSystemFont(ofSize: 14)
                    self.titleLabel.textColor = self.selectedColor
                    self.iconImageView.tintColor = self.selectedColor
                }
                
            } else {
                UIView.animate(withDuration: 0.1) {
                    self.selector.alpha = 0
                    self.titleLabel.font = UIFont.systemFont(ofSize: 14)
                    self.titleLabel.textColor = self.unselectedColor
                    self.iconImageView.tintColor = self.unselectedColor
                }
            }
            
        }
    }
    
}
