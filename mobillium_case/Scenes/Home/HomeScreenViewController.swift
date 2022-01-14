//
//  HomeScreenViewController.swift
//  mobillium_case
//
//  Created by Sercan KAYA on 12.01.2022.
//

import UIKit

final class HomeScreenViewController: BaseViewController<HomeScreenViewModel> {
    

    private let collectionView : UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        layout.scrollDirection = .vertical
        collectionView.backgroundColor = .clear
        collectionView.showsVerticalScrollIndicator = false
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.alwaysBounceVertical = true
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.register(HomeHeaderCell.self, forCellWithReuseIdentifier: HomeHeaderCell.cellID)
        collectionView.register(HomeBodyCell.self, forCellWithReuseIdentifier: HomeBodyCell.cellID)
        return collectionView
    }()
    private let refReshIndıcator : UIRefreshControl = {
        let refreshControl = UIRefreshControl()
        refreshControl.tintColor = .gray
        refreshControl.addTarget(self, action: #selector(refreshData), for: .valueChanged)
        refreshControl.translatesAutoresizingMaskIntoConstraints = false
        return refreshControl
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addSubView()
        configrueContents()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        viewModel.getMoviesNowPlaying()
        viewModel.getMoviesUpcoming(page: 1)
    }
}
extension HomeScreenViewController {
    private func configrueContents(){
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
        self.viewModel.reloadData = { [weak self] in
            guard let self = self else { return }
            self.collectionView.reloadData()
        }
        viewModel.endRefreshing = { [weak self] in
            guard let self = self else { return }
                self.refReshIndıcator.endRefreshing()
            
        }
        viewModel.showLoadingData = { [weak self] in
            guard let self = self else { return }
                self.refReshIndıcator.beginRefreshing()
            
        }
    }
    
    private func addSubView(){
        addCollectionView()
     
    }
    private func addCollectionView(){
        self.view.addSubview(collectionView)
        NSLayoutConstraint.activate([
            self.collectionView.topAnchor.constraint(equalTo: view.topAnchor),
            self.collectionView.leftAnchor.constraint(equalTo: view.leftAnchor),
            self.collectionView.rightAnchor.constraint(equalTo: view.rightAnchor),
            self.collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
       collectionView.contentInset.top = -getStatusBarHeight()
        collectionView.refreshControl = refReshIndıcator
        
        
        
    }
 
}


extension HomeScreenViewController {
    func getStatusBarHeight() -> CGFloat {
       var statusBarHeight: CGFloat = 0
       if #available(iOS 13.0, *) {
           let window = UIApplication.shared.windows.filter {$0.isKeyWindow}.first
           statusBarHeight = window?.windowScene?.statusBarManager?.statusBarFrame.height ?? 0
       } else {
           statusBarHeight = UIApplication.shared.statusBarFrame.height
       }
       return statusBarHeight
   }
    
    @objc func refreshData() {
        viewModel.getMoviesUpcoming(page: 1)
        viewModel.getMoviesNowPlaying()
    }

}

extension HomeScreenViewController : UICollectionViewDelegate{
 
}

extension HomeScreenViewController : UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.numberOfItems(section: section)
    }
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if (indexPath.section == 0){
            let cell : HomeHeaderCell = collectionView.dequeueReusableCell(withReuseIdentifier: HomeHeaderCell.cellID, for: indexPath) as! HomeHeaderCell
            if let item = viewModel.headerCell {
                cell.set(viewModel: item)
            }

            return cell
        }else {
            let cell : HomeBodyCell = collectionView.dequeueReusableCell(withReuseIdentifier: HomeBodyCell.cellID, for: indexPath) as! HomeBodyCell
            if let cellViewModel = viewModel.homeBodyCell {
                cell.set(viewModel: cellViewModel[indexPath.row])
            }
            
            return cell
        }
        
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
       viewModel.didSelectRecipe(at: indexPath)
    }
 

}

extension HomeScreenViewController : UICollectionViewDelegateFlowLayout {
    func collectionView( _ collectionView: UICollectionView,
                            layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
            return .zero
        }

    func collectionView( _ collectionView: UICollectionView,
                            layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
           return .zero
        }

        func collectionView(_ collectionView: UICollectionView,
                            layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
            return .zero
        }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
        if (section == 0){
            return .zero
        }else {
                if self.viewModel.isLoading {
                           return CGSize.zero
                       } else {
                           return CGSize(width: collectionView.bounds.size.width, height: 55)
                       }
        }
        
        
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        viewModel.reloadMoreData(at: indexPath)
      
        
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if (indexPath.section == 0 ) {
            return .init(width: collectionView.frame.width, height: 256)
        }else{
            return .init(width: collectionView.frame.width, height: collectionView.frame.width - 256 )
        }
    }
}
