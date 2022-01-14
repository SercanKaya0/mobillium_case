//
//  File.swift
//  public_apis
//
//  Created by Sercan KAYA on 10.01.2022.
//

import Foundation
import Alamofire


final class ApiLogger : EventMonitor {
   static let shared = ApiLogger()

    let queue = DispatchQueue(label: "publicapis.public-apis")
   
   func request(_ request: Request, didCreateURLRequest urlRequest: URLRequest) {
      print("🌎---> Request Created <---🌎")
      print(request.description)

   }
   
   func requestDidFinish(_ request: Request) {
      print("🌎---> Request Finish <---🌎")
      print(request.description)
   }
   
   func request<Value>(_ request: DataRequest, didParseResponse response: DataResponse<Value?, AFError>) {
      print("🌎---> Request JSONResponse <---🌎")
      if let data = response.data, let json = String(data: data, encoding: .utf8) {
         print(json)
      }

   }
}
