//
//  HomeScreenViewModel.swift
//  mobillium_case
//
//  Created by Sercan KAYA on 12.01.2022.
//

import Foundation
import DataSource
import UIComponents


protocol HomeScreenViewDataSource {
    
    var headerCell : HomeHeaderCellProtocol? {get}
    var homeBodyCell: [HomeBodyCellProtocol]? {get set}
}

protocol HomeScreenViewEventSource {
    var reloadData: (() -> Void)? {get set}
    var showLoadingData: (() -> Void)? {get set}
    var endRefreshing: (() -> Void)? {get set}
}

protocol HomeScreenViewProtocol: HomeScreenViewDataSource, HomeScreenViewEventSource {
    func didSelectRecipe(at indexPath: IndexPath)
    func reloadMoreData()
    var isLoading: Bool {get set}
    var currentPage : Int {get set}
    
    
}

final class HomeScreenViewModel: BaseViewModel<HomeScreenRouter>, HomeScreenViewProtocol {
    var currentPage: Int = 1
    
    var isLoading: Bool = false
    
    
    
    
    func reloadMoreData() {
        if !self.isLoading {
                   self.isLoading = true
                   DispatchQueue.global().async {
                       // Fake background loading task for 2 seconds
                       sleep(2)
                       if self.homeBodyCell?.isEmpty == false {
                           self.currentPage += 1
                           self.getMoviesUpcoming(page: self.currentPage)

                       }else{
                           self.currentPage = 1
                           self.getMoviesUpcoming(page: self.currentPage)
                       }
                       DispatchQueue.main.async {
                           self.isLoading = false
                       }
                   }
               }

    }
    
    func didSelectRecipe(at indexPath: IndexPath) {
        let cellItem = homeBodyCell?[indexPath.row].id ?? 0
        router.pushHomeDetail(id: cellItem)
    }
    var showLoadingData: (() -> Void)?
    var endRefreshing: (() -> Void)?
    var reloadData: (() -> Void)?
    var headerCell: HomeHeaderCellProtocol?
    var homeBodyCell: [HomeBodyCellProtocol]?
    func numberOfItems(section: Int) -> Int{
        
        if (section == 0){
            return 1
        }else {
        return homeBodyCell?.count ?? 0
        }
    }
    
    init(router: HomeScreenRouter) {
        super.init(router: router)
    }
}


extension HomeScreenViewModel {
    func getMoviesNowPlaying(){
        let request = MoviesNowPlayingRequest()
        dataProvider.request(for: request) {[weak self] result in
            guard let self = self else {return}
            switch result {
            case .success(let response):
                guard let array = response?.results?.map({ model in
                    return HomeHeaderSliderCellModel(title: model.title, subTitle: model.overview, image: URL(string:"https://image.tmdb.org/t/p/original" + (model.poster_path ?? "")), totalPagesIndıcator: response?.results?.count) // çünkü hiçbir proprtyl atmamaışsın knk
                }) else { return }
                self.headerCell = HomeHeaderCellModel(homeHeaderCell: array)
                self.endRefreshing?()
                self.reloadData?()
            case .failure(let error):
                self.endRefreshing?()
                    print(error)
            }
        }
    }
    
    
    func getMoviesUpcoming(page: Int?){
        let request = MoviesUpcomingRequest(page: page ?? 1)
        dataProvider.request(for: request) {[weak self] result in
            guard let self = self else {return}
            switch result {
            case .success(let response):
                guard let array = response?.results?.map({ model in
                    return HomeBodyCellModel(page: response?.page, id: model.id,title: model.title ,subTitle: model.overview, image: URL(string:"https://image.tmdb.org/t/p/original" + (model.poster_path ?? "")), dateLabel: model.releaseDate)
                }) else {return}
                self.homeBodyCell = array
                self.endRefreshing?()
                self.reloadData?()
            
            case .failure(let error) :
                self.endRefreshing?()
                
                print(error)
            }
        }
    }
    
}

