//
//  HomeScreenRoute.swift
//  mobillium_case
//
//  Created by Sercan KAYA on 12.01.2022.
//

protocol HomeScreenRoute {
    func pushHomeScreen()
}

extension HomeScreenRoute where Self: RouterProtocol {
    
    func pushHomeScreen() {
        let router = HomeScreenRouter()
        let viewModel = HomeScreenViewModel(router: router)
        let viewController = HomeScreenViewController(viewModel: viewModel)
        
        let transition = PlaceOnWindowTransition()
        router.viewController = viewController
        router.openTransition = transition
        
        open(viewController, transition: transition)
    }
}
