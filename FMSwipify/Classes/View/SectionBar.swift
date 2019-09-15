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


@available(iOS 8.2, *)
public class SectionBar: UIView {
    
    let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 0
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.backgroundColor = .clear
        return cv
    }()
    
    let bar: UIView = {
        let view = UIView()
        view.backgroundColor = .green
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    //MARK: - Sections
    var titles: [String]?
    var titleFont: UIFont = .systemFont(ofSize: 15, weight: .bold)
    var icons: [UIImage]?
    var iconSize: CGSize = .init(width: 25, height: 25)
    
    
    var selectedColor: UIColor = .black
    var unselectedColor: UIColor = .lightGray
    var selectorColor: UIColor = .black
//    var selectorType: SelectorType = .bar
    var dataCount: Int = 0
    
    var bgColor: UIColor! {
        didSet {
            backgroundColor = bgColor
        }
    }
    
    var selectorType: SelectorType? {
        didSet {
            
            if #available(iOS 9.0, *) {
                setupHorizontalBar()
            }
            
        }
    }
    
    
    
    weak var delegate: SectionBarDelegate?
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(bar)
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
    var widthAnchorCst: NSLayoutConstraint?
    @available(iOS 9.0, *)
    fileprivate func setupHorizontalBar() {
        layoutSubviews()
        let x: CGFloat = CGFloat(dataCount)
        
        
        switch selectorType! {
        case .bar:
            bar.heightAnchor.constraint(equalToConstant: 4).isActive = true
            bar.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
            leftAnchorCst = bar.leadingAnchor.constraint(equalTo: leadingAnchor)
            leftAnchorCst?.isActive = true
            
            if titles!.count > 0 {
                let size: CGSize = titles![0].size(withAttributes: [NSAttributedString.Key.font: titleFont])
                var cvWidth = collectionView.frame.width
                titles!.forEach {
                    let size: CGSize = $0.size(withAttributes: [NSAttributedString.Key.font: titleFont])
                    cvWidth -= size.width
                }
                
                let width = size.width + (cvWidth/x)
                widthAnchorCst = bar.widthAnchor.constraint(equalToConstant: width)
            } else {
                widthAnchorCst = bar.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 1 / (x > 4 ? 4 : x))
            }
            
            widthAnchorCst?.isActive = true
            
            
        case .bubble:
//            layoutSubviews()
            bar.anchor(top: topAnchor, bottom: bottomAnchor, padding: .init(top: 8, left: 0, bottom: 8, right: 0), size: .zero)
            bar.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
            leftAnchorCst = bar.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8)
            leftAnchorCst?.isActive = true
            
            if titles!.count > 0 {
                let size: CGSize = titles![0].size(withAttributes: [NSAttributedString.Key.font: titleFont])
                var cvWidth = collectionView.frame.width
                titles!.forEach {
                    let size: CGSize = $0.size(withAttributes: [NSAttributedString.Key.font: titleFont])
                    cvWidth -= size.width
                }
                
                let width = size.width + (cvWidth/x)
                widthAnchorCst = bar.widthAnchor.constraint(equalToConstant: width - 16)
            } else {
                let width = collectionView.frame.width * (1 / (x > 4 ? 4 : x))
                widthAnchorCst = bar.widthAnchor.constraint(equalToConstant: width - 16)
            }
            bar.layer.cornerRadius = 17
            widthAnchorCst?.isActive = true

            
        }
        
    }
    
    
    
}

@available(iOS 8.2, *)
extension SectionBar: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let height = collectionView.frame.height
        let maxX: CGFloat = 4
        
        switch titles!.count {
        case 0:
            let x: CGFloat = CGFloat(dataCount)
            let width = (collectionView.frame.width / (x > maxX ? maxX : x))
            return CGSize(width: width, height: height)
        case 1...4:
            var cvWidth = collectionView.frame.width
            let size: CGSize = titles![indexPath.row].size(withAttributes: [NSAttributedString.Key.font: titleFont])
            titles!.forEach {
                let size: CGSize = $0.size(withAttributes: [NSAttributedString.Key.font: titleFont])
                cvWidth -= size.width
            }
            
            let x: CGFloat = CGFloat(dataCount)
            let width = size.width + (cvWidth/x)
            return CGSize(width: width, height: height)
            
        default:
            let size: CGSize = titles![indexPath.row].size(withAttributes: [NSAttributedString.Key.font: titleFont])
            return CGSize(width: size.width + 32, height: height)
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
            if let icons = icons, let titles = titles {
                if icons.count > 0 {
                    cell.iconImageView.image = icons[indexPath.item]
                    cell.iconImageView.tintColor = cell.isSelected ? selectedColor : unselectedColor
                    cell.iconSize = self.iconSize
                    cell.setupIcon()
                }
                
                if titles.count > 0 {
                    cell.titleLabel.text = titles[indexPath.item]
                    cell.titleLabel.textColor = cell.isSelected ? selectedColor : unselectedColor
                    cell.titleLabel.font = self.titleFont
                    cell.addLabelToStack()
                }
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
        }
        self.collectionView.selectItem(at: indexPath, animated: true, scrollPosition: .centeredHorizontally)
        
        switch titles!.count {
            case 0: iconScrollTo(indexPath)
            case 1...4: scrollTo(indexPath)
            default: dynamicScrollTo(indexPath)
        }
        
        delegate?.didSelectMenuOptionAt(indexPath: indexPath)
        
        
    }
    
    func iconScrollTo(_ indexPath: IndexPath) {
        
        if dataCount <= 4 {
            let cell = collectionView.cellForItem(at: indexPath)
            let cellFrameInSuperview = collectionView.convert(cell!.frame, to: collectionView.superview)
            leftAnchorCst?.constant = cellFrameInSuperview.origin.x + (selectorType! == .bubble ? 8 : 0)
            UIView.animate(withDuration: 0.65, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
                self.layoutIfNeeded()
            }, completion: nil)

        } else {
            UIView.animate(withDuration: 0.3, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseIn, animations: {
                self.widthAnchorCst?.constant += 1
                
                self.layoutIfNeeded()
                
            }, completion: { (_) in
                
                
                let cell = self.collectionView.cellForItem(at: indexPath)
                let cellFrameInSuperview = self.collectionView.convert(cell!.frame, to: self.collectionView.superview)
                self.leftAnchorCst?.constant = cellFrameInSuperview.origin.x + (self.selectorType! == .bubble ? 8 : 0)
                
                UIView.animate(withDuration: 0.6, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
                    self.widthAnchorCst?.constant -= 1
                    self.layoutIfNeeded()
                }, completion: nil)
            })

        }
        
        
        
        
        
    }
    
    func scrollTo(_ indexPath: IndexPath) {
        guard let titles = titles else { return }
        guard titles.count > 0 else { return }
        let size: CGSize = titles[indexPath.row].size(withAttributes: [NSAttributedString.Key.font: titleFont])
        var cvWidth = collectionView.frame.width
        titles.forEach {
            let size: CGSize = $0.size(withAttributes: [NSAttributedString.Key.font: titleFont])
            cvWidth -= size.width
        }
        
        let x: CGFloat = CGFloat(dataCount)
        let width = size.width + (cvWidth/x)
        let cell = collectionView.cellForItem(at: indexPath)
        let cellFrameInSuperview = collectionView.convert(cell!.frame, to: collectionView.superview)
        widthAnchorCst?.constant = width - (self.selectorType! == .bubble ? 16 : 0)
        leftAnchorCst?.constant = cellFrameInSuperview.origin.x + (self.selectorType! == .bubble ? 8 : 0)
        
        
        UIView.animate(withDuration: 0.65, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
            self.layoutIfNeeded()
        }, completion: nil)
    }
    
    func dynamicScrollTo(_ indexPath: IndexPath) {
        
        let size: CGSize = titles![indexPath.row].size(withAttributes: [NSAttributedString.Key.font: titleFont])
        var cvWidth = collectionView.frame.width
        titles!.forEach {
            let size: CGSize = $0.size(withAttributes: [NSAttributedString.Key.font: titleFont])
            cvWidth -= size.width
        }
        
        let x: CGFloat = CGFloat(dataCount)
        
        UIView.animate(withDuration: 0.25, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseIn, animations: {
            self.widthAnchorCst?.constant = size.width + 32 - (self.selectorType! == .bubble ? 16 : 0)
            self.layoutIfNeeded()
            
        }, completion: { (_) in
            
            
            let cell = self.collectionView.cellForItem(at: indexPath)
            let cellFrameInSuperview = self.collectionView.convert(cell!.frame, to: self.collectionView.superview)
            self.leftAnchorCst?.constant = cellFrameInSuperview.origin.x + (self.selectorType! == .bubble ? 8 : 0)
            
            UIView.animate(withDuration: 0.65, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
                self.layoutIfNeeded()
            }, completion: nil)
        })
    }
    
    
}


