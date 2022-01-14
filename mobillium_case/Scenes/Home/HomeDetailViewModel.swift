//
//  HomeDetailViewModel.swift
//  mobillium_case
//
//  Created by Sercan KAYA on 13.01.2022.
//

import Foundation
import DataSource

protocol HomeDetailViewDataSource {
    var title : String? {get}
    var id : Int? {get}
    var subTitle : String? {get}
    var image : String? {get}
    var date: String? {get}
    var rateCount: Int? {get}
    var rate: Double? {get}

}

protocol HomeDetailViewEventSource {
    var reloadDetailData: VoidClosure? { get set }


}

protocol HomeDetailViewProtocol: HomeDetailViewDataSource, HomeDetailViewEventSource {

}

final class HomeDetailViewModel: BaseViewModel<HomeDetailRouter>, HomeDetailViewProtocol {

    
  
    
    
    var reloadDetailData: VoidClosure?
    
    
    var id: Int?
    var title: String?
    var subTitle: String?
    var image: String?
    var date: String?
    var rate: Double?
    var rateCount: Int?


    init(id: Int?,router: HomeDetailRouter) {
        self.id = id
        super.init(router: router)
    }
    
    private func setData(detailModel: MovieDetail) {
        self.title = detailModel.title
        self.date = detailModel.releaseDate
        self.image =  detailModel.posterPath
        self.rate = detailModel.voteAverage
        self.subTitle = detailModel.overview
        self.rateCount = detailModel.voteCount
    }
    
}


extension HomeDetailViewModel {
    func getMovieDetail() {
        let request = MoviesDetailRequest(moviesId: id ?? 0)
        dataProvider.request(for: request) {[weak self] result in
            guard let self = self  else {return}
            switch result {
            case .success(let response):
                guard let response = response else {return}
                self.setData(detailModel: response)
                self.reloadDetailData?()
            case .failure(let error):
                print(error)
            }
        }
    }
}
