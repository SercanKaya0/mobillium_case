//
//  BaseResponse.swift
//  DataSource
//
//  Created by Sercan KAYA on 10.01.2022.
//

import Foundation
public struct BaseResponse<T:Decodable>:Decodable {
    public var data : T
}
