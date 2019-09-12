//
//  SwipifyController.swift
//  FMSwipify
//
//  Created by Franck-Stephane Ndame Mpouli on 12/09/2019.
//

import UIKit

public enum CellSource {
    case nib, code
}

private let reuseidentifier = "contentCell"
open class SwipifyController<T: SwipifyBaseCell<Y>, Y>: UIViewController, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource, SectionBarDelegate, SwipifyCellDelegate {
    
    lazy open var sectionBar: SectionBar = {
        let sb = SectionBar()
        sb.delegate = self
        return sb
    }()
    
    open var cellSource: CellSource { return .nib }
    open var cellSize: CGSize { return .zero }
    public let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 0
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.contentInset.top = 5
        cv.scrollIndicatorInsets.top = 5
        cv.isPagingEnabled = true
        return cv
    }()
    
    open var sectionsTitle: [String] { return [] }
    open var data: [[Y]] {return [[Y]]()}
    
    

    override open func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        collectionView.dataSource = self
        collectionView.delegate = self
        sectionBar.menuArray = sectionsTitle
        collectionView.showsHorizontalScrollIndicator = false
        
        collectionView.register(SwipifyCell<Y, T>.self, forCellWithReuseIdentifier: reuseidentifier)
        
        if #available(iOS 11.0, *) {
            sectionBar.anchor(superView: self.view, top: view.safeAreaLayoutGuide.topAnchor, leading: view.leadingAnchor, trailing: view.trailingAnchor, size: .init(width: 0, height: 50))
        } else {
            // Fallback on earlier versions
        }
        if #available(iOS 9.0, *) {
            collectionView.anchor(superView: view, top: sectionBar.bottomAnchor, leading: view.leadingAnchor, bottom: view.bottomAnchor, trailing: view.trailingAnchor)
        } else {
            // Fallback on earlier versions
        }
    }
    
    
    
    //MARK: - UICollectionViewDelegateFlowLayout, UICollectionViewDataSource
    open func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return sectionBar.menuArray?.count ?? 0
    }
    
    open func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseidentifier, for: indexPath) as!
            SwipifyCell<Y, T>
        cell.items = data[indexPath.item]
        cell.cellSource = cellSource
        cell.cellSize = cellSize
        cell.section = indexPath.item
        cell.delegate = self
        return cell
    }
    
    open func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.bounds.size.width, height: collectionView.bounds.size.height)
    }
    
    override open func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
    }
    
    
    //MARK: - SectionBarDelegate
    
    // Delegate to scroll when user scroll's the menuBar
    open func didSelectMenuOptionAt(indexPath: IndexPath) {
        scrollTo(menuIndex: indexPath.item)
    }
    
    // Scroll to the top of the collection view when you swipe the menuBar
    func scrollTo(menuIndex index: Int) {
        let indexPath = IndexPath(item: index, section: 0)
        collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
    }
    
    open func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        let index = Int(targetContentOffset.pointee.x / view.frame.width)
        let indexPath = IndexPath(item: index, section: 0)
        
        sectionBar.collectionView.selectItem(at: indexPath, animated: true, scrollPosition: .centeredHorizontally)
        if #available(iOS 10.0, *) {
            let impact = UIImpactFeedbackGenerator()
            impact.impactOccurred()
        }
        
        
        
    }
    
    //MARK:- SwiftifyCell Delegate
    open func didSelectItemAt(section: Int, item: Int) {
        // Your implementation
    }
    
}


