//
//  HomeDetailRoute.swift
//  mobillium_case
//
//  Created by Sercan KAYA on 13.01.2022.
//

protocol HomeDetailRoute {
    func pushHomeDetail(id: Int)
}

extension HomeDetailRoute where Self: RouterProtocol {
    
    func pushHomeDetail(id: Int) {
        let router = HomeDetailRouter()
        let viewModel = HomeDetailViewModel(id: id, router: router)
        let viewController = HomeDetailViewController(viewModel: viewModel)
        
        let transition = ModalTransition()
        router.viewController = viewController
        router.openTransition = transition
        
        open(viewController, transition: transition)
    }
}
