//
//  SwipifyCell.swift
//  FMSwipify
//
//  Created by Franck-Stephane Ndame Mpouli on 12/09/2019.
//

import UIKit

public protocol SwipifyCellDelegate: class {
    func didSelectItemAt(section: Int, item: Int)
}
class SwipifyCell<U, T:SwipifyBaseCell<U>>: UICollectionViewCell, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    var items: [U]!
    private let reuseidentifier = "itemCell"
    var cellSource: CellSource = .nib
    var cellSize: CGSize = .zero
    var section = 0
    
    weak var delegate: SwipifyCellDelegate?
    
    let innerCollectionView: UICollectionView = {
        let cv = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
        cv.backgroundColor = .white
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
    }
    
    override func prepareForReuse() {
        innerCollectionView.reloadData()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    //MARK:- UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseidentifier, for: indexPath) as! T
        cell.item = items[indexPath.item]
        return cell
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return cellSize
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        delegate?.didSelectItemAt(section: section, item: indexPath.item)
    }
    
}

