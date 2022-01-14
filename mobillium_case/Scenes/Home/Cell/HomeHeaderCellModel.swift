//
//  HomeHeaderCellModel.swift
//  mobillium_case
//
//  Created by Sercan KAYA on 12.01.2022.
//

import Foundation

public protocol HomeHeaderCellDataSource: AnyObject {
    var homeHeaderCellItems : [HomeHeaderSliderCellProtocol] { get set }
    func cellItemAt(indexPath : IndexPath) -> HomeHeaderSliderCellProtocol
    func numberOfItems() -> Int
    
}

public protocol HomeHeaderCellEventSource: AnyObject {
    
}

public protocol HomeHeaderCellProtocol: HomeHeaderCellDataSource, HomeHeaderCellEventSource {

}

public final class HomeHeaderCellModel: HomeHeaderCellProtocol {

    
    
    public var homeHeaderCellItems: [HomeHeaderSliderCellProtocol] = []

    public func cellItemAt(indexPath: IndexPath) -> HomeHeaderSliderCellProtocol {
        return homeHeaderCellItems[indexPath.row]
    }
    
    public func numberOfItems() -> Int {
        return homeHeaderCellItems.count
    }
        
    
    public init(homeHeaderCell : [HomeHeaderSliderCellProtocol]){
        self.homeHeaderCellItems = homeHeaderCell
        
    }
}
