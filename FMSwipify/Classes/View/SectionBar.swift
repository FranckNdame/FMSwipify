//
//  SectionBar.swift
//  FMSwipify
//
//  Created by Franck-Stephane Ndame Mpouli on 12/09/2019.
//

import UIKit

public protocol SectionBarDelegate: class {
    func didSelectMenuOptionAt(indexPath: IndexPath)
}


public class SectionBar: UIView {
    
    let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 0
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        return cv
    }()
    
    let bar: UIView = {
        let view = UIView()
        view.backgroundColor = .green
        return view
    }()
    
    //MARK: - Sections
    var titles: [String]?
    var icons: [UIImage]?
    
    var iconPosition: IconPosition?
    var selectedColor: UIColor = .black
    var unselectedColor: UIColor = .lightGray
    var selectorColor: UIColor = .black
    var selectorType: SelectorType = .bar
    var dataCount: Int = 0
    
    var bgColor: UIColor! {
        didSet {
            collectionView.backgroundColor = bgColor
        }
    }
    
    var barType: SectionBarType? {
        didSet {
            if #available(iOS 9.0, *) {
                if barType == .fixed { setupHorizontalBar() 
            }
            }
        }
    }
    
    
    
    weak var delegate: SectionBarDelegate?
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        collectionView.isPagingEnabled = false
        if #available(iOS 9.0, *) {
            setupCollectionView()
            
        }
        
        
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func setupSelectedIndex() {
        let selectedIndex = IndexPath(item: 0, section: 0)
        collectionView.selectItem(at: selectedIndex, animated: true, scrollPosition: .centeredHorizontally)
    }
    
    
    
    
    @available(iOS 9.0, *)
    fileprivate func setupCollectionView() {
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.anchor(superView: self, top: topAnchor, leading: leadingAnchor, bottom: bottomAnchor, trailing: trailingAnchor, padding: .zero)
        collectionView.register(SectionBarCell.self, forCellWithReuseIdentifier: "Cell")
        collectionView.showsHorizontalScrollIndicator = false
        
    }
    
    var leftAnchorCst: NSLayoutConstraint?
    @available(iOS 9.0, *)
    fileprivate func setupHorizontalBar() {
        bar.anchor(superView: self, bottom: bottomAnchor, size: .init(width: 0, height: 4))
        leftAnchorCst = bar.leadingAnchor.constraint(equalTo: leadingAnchor)
        leftAnchorCst?.isActive = true
        bar.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 1/4).isActive = true
        
    }
    
    
    
}

extension SectionBar: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let height = collectionView.frame.height
        
        if barType == .fixed {
            let x: CGFloat = CGFloat(dataCount)
            let width = (collectionView.frame.width / x)
            return CGSize(width: width, height: height)
        } else {
            let maxX: CGFloat = 3
            let x: CGFloat = CGFloat(dataCount)
            let width = (collectionView.frame.width / (x > maxX ? maxX : x)) - 2
            return CGSize(width: width, height: height)
        }
        
        
        
    }
    
    
    
    
    
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataCount
    }
    
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if #available(iOS 9.0, *) {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! SectionBarCell
            
            
            cell.selectedColor = self.selectedColor
            cell.unselectedColor = self.unselectedColor
            cell.selector.backgroundColor = self.selectorColor
            cell.selectorType = self.selectorType
            cell.barType = self.barType
            
            if icons?.count == titles?.count || icons?.count ?? 0 > 0 {
                cell.iconImageView.image = icons![indexPath.item]
                cell.iconImageView.tintColor = cell.isSelected ? selectedColor : unselectedColor
                cell.setupIcon()
            }
            
            if titles?.count ?? 0 > 0 {
                cell.titleLabel.text = self.titles![indexPath.item]
                cell.titleLabel.textColor = cell.isSelected ? selectedColor : unselectedColor
                cell.addLabelToStack()
            }
            
            
            return cell
            
        } else {
            // Fallback on earlier versions
            return UICollectionViewCell()
        }
        
    }
    
    public func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        if #available(iOS 10.0, *) {
            let impact = UIImpactFeedbackGenerator()
            impact.impactOccurred()
        } else {
            // Fallback on earlier versions
        }
        
        collectionView.selectItem(at: indexPath, animated: true, scrollPosition: .centeredHorizontally)
        delegate?.didSelectMenuOptionAt(indexPath: indexPath)
    
        
    }
    
    
}


