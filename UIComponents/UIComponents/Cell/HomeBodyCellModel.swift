//
//  HomeBodyCellModel.swift
//  mobillium_case
//
//  Created by Sercan KAYA on 12.01.2022.
//

import Foundation



public protocol HomeBodyCellDataSource: AnyObject {
    var title : String? {get}
    var subTitle : String? {get}
    var id : Int? {get set}
    var image : URL? {get}
    var page : Int? {get}
    var dateLabel : String? {get}
}

public protocol HomeBodyCellEventSource: AnyObject {
    
}

public protocol HomeBodyCellProtocol: HomeBodyCellDataSource, HomeBodyCellEventSource {
    
}

public final class HomeBodyCellModel: HomeBodyCellProtocol {
    public var page: Int?
    
    public var id: Int?
    public var title: String?
    public var subTitle: String?
    public var image: URL?
    public var dateLabel: String?
    
    
    public init(page: Int? = nil,id: Int? = nil, title: String? = nil, subTitle: String? = nil, image: URL? = nil, dateLabel: String? = nil) {
        self.id = id
        self.page = page
        self.title = title
        self.subTitle = subTitle
        self.image = image
        self.dateLabel = dateLabel
    }
    

    
    
}
