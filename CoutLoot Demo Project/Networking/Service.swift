//
//  Service.swift
//  CoutLoot Demo Project
//
//  Created by Pranay Joshi on 24/07/20.
//  Copyright © 2020 Pranay Joshi. All rights reserved.
//

import Foundation
import Alamofire

class Service {
    typealias JSON = NSDictionary
    typealias JSONHandler = (JSON?, HTTPURLResponse?, Error?) -> Void
    
    //MARK: api call to get post api response
    func getApiResponsePostMethod(apiUrl: String, method: HTTPMethod, postArray: [String: Any], completion: @escaping JSONHandler){
        DispatchQueue.main.async {
            AF.request(apiUrl, method: method, parameters: postArray).responseJSON { response in
                switch response.result{
                case .success:
                    if let jsonArray: NSDictionary = response.value as? NSDictionary{
                        let JSON = jsonArray
                        completion(JSON,response.response,response.error)
                    }
                case .failure:
                    completion(nil,response.response,response.error)
                }
                
            }
        }
    }
}
