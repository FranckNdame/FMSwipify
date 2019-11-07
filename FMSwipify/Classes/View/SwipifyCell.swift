//
//  SwipifyCell.swift
//  FMSwipify
//
//  Created by Franck-Stephane Ndame Mpouli on 12/09/2019.
//

import UIKit

let placeholderIdentifier = "placeholder-cell"
public protocol SwipifyCellDelegate: class {
    func didSelectItemAt(section: Int, item: Int)
}
class SwipifyCell<U, T:SwipifyBaseCell<U>>: UICollectionViewCell, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    var items: [U]!
    private let reuseidentifier = "itemCell"
    var cellSource: CellSource = .nib
    var cellSize: CGSize = .zero
    var section = 0
    
    
    // Placeholder
    var placeholderAttributes: NSAttributedString = NSAttributedString()
    var placeholderImage: UIImage = UIImage()
    
    weak var delegate: SwipifyCellDelegate?
    
    open var innerMinInteritemSpacing: CGFloat = 0
    open var innerMinLineSpacing: CGFloat = 0
    
    lazy var innerCollectionView: UICollectionView = {
        let cv = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
        return cv
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        innerCollectionView.delegate = self
        innerCollectionView.dataSource = self
        self.clipsToBounds = false
        addSubview(innerCollectionView)
        if #available(iOS 9.0, *) {
            innerCollectionView.fillSuperview()
        } else {
            // Fallback on earlier versions
        }
        
        if cellSource == .code {
            innerCollectionView.register(T.self, forCellWithReuseIdentifier: reuseidentifier)
        } else {
            innerCollectionView.register(UINib(nibName: "\(T.self)", bundle: nil), forCellWithReuseIdentifier: reuseidentifier)
        }
        
        if #available(iOS 9.0, *) {
            innerCollectionView.register(PlaceholderCell.self, forCellWithReuseIdentifier: placeholderIdentifier)
        }
    }
    
    override func prepareForReuse() {
        innerCollectionView.reloadData()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    //MARK:- UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if items.count == 0 {
            if #available(iOS 9.0, *) {
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: placeholderIdentifier, for: indexPath) as! PlaceholderCell
                let content = Content(image: placeholderImage, attributes: placeholderAttributes )
                cell.content = content
                return cell
            } else {
                return UICollectionViewCell()
            }
        } else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseidentifier, for: indexPath) as! T
            cell.item = items[indexPath.item]
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count == 0 ? 1 : items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return items.count == 0 ? collectionView.frame.size : cellSize
    
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return innerMinLineSpacing
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return innerMinInteritemSpacing
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        delegate?.didSelectItemAt(section: section, item: indexPath.item)
    }
    
}

