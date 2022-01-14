//
//  RequestProtocol.swift
//  DataSource
//
//  Created by Sercan KAYA on 10.01.2022.
//

import Foundation
public protocol RequestProtocol {
    var path: String { get }
    var method: RequestMethod { get }
    var parameters: RequestParameters { get }
    var headers: RequestHeaders { get }
    var encoding: RequestEncoding { get }
    var url: String { get }

}
