//
//  HomeHeaderCell.swift
//  mobillium_case
//
//  Created by Sercan KAYA on 12.01.2022.
//

import UIKit

public class HomeHeaderCell: UICollectionViewCell, ReusableView {
    
    
    private let headerCollectionView : UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        layout.scrollDirection = .horizontal
        collectionView.isPagingEnabled = true
        collectionView.backgroundColor = .clear
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.register(HomeHeaderSliderCell.self, forCellWithReuseIdentifier: HomeHeaderSliderCell.homeSliderCellID)
        return collectionView
    }()
    private let pageControl : UIPageControl = {
        let pageControl = UIPageControl()
        pageControl.tintColor = .gray
        pageControl.currentPageIndicatorTintColor = .white
        pageControl.translatesAutoresizingMaskIntoConstraints = false
        return pageControl
    }()
    
    weak var viewModel: HomeHeaderCellProtocol?
     static let cellID = "homeHeaderCell"
    private var timer : Timer?
    private var currentIndex = 0
    override init(frame: CGRect) {
        super.init(frame: frame)
       
        addSubView()
        configureContents()
        startTime()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        addSubView()
        configureContents()
        startTime()
    }
    
    private func configureContents() {
        self.headerCollectionView.delegate = self
        self.headerCollectionView.dataSource = self
        self.pageControl.numberOfPages = viewModel?.homeHeaderCellItems.count ?? 0
    }
    
    public func set(viewModel: HomeHeaderCellProtocol) {
        self.viewModel = viewModel
        
        configureContents()
        headerCollectionView.reloadData()
    }
    
}

extension HomeHeaderCell {
    private func addSubView(){
       
  addHeaderCollectionView()
        addPageControl()
    }
    
    private func addHeaderCollectionView() {
        self.contentView.addSubview(headerCollectionView)
        NSLayoutConstraint.activate([
            self.headerCollectionView.topAnchor.constraint(equalTo: contentView.topAnchor),
            self.headerCollectionView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            self.headerCollectionView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            self.headerCollectionView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
        ])
    }
    private func addPageControl() {
        self.contentView.addSubview(pageControl)
        NSLayoutConstraint.activate([
            self.pageControl.leadingAnchor.constraint(equalTo: contentView.leadingAnchor,constant: 8),
            self.pageControl.trailingAnchor.constraint(equalTo: contentView.trailingAnchor,constant: -8),
            self.pageControl.bottomAnchor.constraint(equalTo: contentView.bottomAnchor,constant: -3),
        ])
        
    }
}

extension HomeHeaderCell : UICollectionViewDelegate {
  
    public func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        self.pageControl.currentPage = indexPath.row

    }
    
}
extension HomeHeaderCell : UICollectionViewDataSource {
    
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel?.numberOfItems() ?? 0
    }
    
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell : HomeHeaderSliderCell = collectionView.dequeueReusableCell(withReuseIdentifier: HomeHeaderSliderCell.homeSliderCellID, for: indexPath) as! HomeHeaderSliderCell
        if  let cellItem = viewModel?.cellItemAt(indexPath: indexPath) {
            
            cell.set(viewModel: cellItem)
        }
        
        return cell
    }
    public func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    }
    
    
}
extension HomeHeaderCell : UICollectionViewDelegateFlowLayout {
    public func collectionView( _ collectionView: UICollectionView,
                            layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
            return .zero
        }

    public func collectionView( _ collectionView: UICollectionView,
                            layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return  .zero
        }

    public func collectionView(_ collectionView: UICollectionView,
                            layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
            return .zero
        }
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: collectionView.frame.width, height: collectionView.frame.height)
    }
   
}

extension HomeHeaderCell{
    
    private func startTime(){
        self.timer = Timer.scheduledTimer(timeInterval: 2.5, target: self, selector: #selector(autoSliderCell), userInfo: nil, repeats: true)
    }
    @objc func autoSliderCell(){
        if currentIndex < (viewModel?.homeHeaderCellItems.count ?? 0) - 1 {
            self.currentIndex += 1

        }else{
            currentIndex = 0
        }
        self.headerCollectionView.scrollToItem(at: IndexPath(item: currentIndex, section: 0), at: .centeredHorizontally, animated: true)

    }
}
