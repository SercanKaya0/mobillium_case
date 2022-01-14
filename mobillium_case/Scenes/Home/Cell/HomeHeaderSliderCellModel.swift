//
//  HomeHeaderSliderCellModel.swift
//  mobillium_case
//
//  Created by Sercan KAYA on 12.01.2022.
//

import Foundation

public protocol HomeHeaderSliderCellDataSource: AnyObject {
    var title : String? {get}
    var subTitle : String? {get}
    var id : Int? {get set}
    var image : URL? {get}
    var totalPagesIndıcator : Int? {get set}
    var currentPageIndıcator : Int? {get set}
}

public protocol HomeHeaderSliderCellEventSource: AnyObject {
    
}

public protocol HomeHeaderSliderCellProtocol: HomeHeaderSliderCellDataSource, HomeHeaderSliderCellEventSource {
    
}

public final class HomeHeaderSliderCellModel: HomeHeaderSliderCellProtocol {
    public var id: Int?
    
    public var currentPageIndıcator: Int?
    
    public var totalPagesIndıcator: Int?
    
    
    
    
    public var title: String?
    
    public var subTitle: String?
    
    public var image: URL?
    
    public init(id:Int? = nil,title: String? = nil, subTitle: String? = nil, image: URL? = nil,totalPagesIndıcator: Int? = nil,currentPageIndıcator: Int? = nil) {
        self.title = title
        self.id = id
        self.currentPageIndıcator = currentPageIndıcator
        self.totalPagesIndıcator = totalPagesIndıcator
        self.subTitle = subTitle
        self.image = image
    }
    
    
}
