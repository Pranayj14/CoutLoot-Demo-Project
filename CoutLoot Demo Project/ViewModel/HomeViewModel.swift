//
//  HomeViewModel.swift
//  CoutLoot Demo Project
//
//  Created by Pranay Joshi on 24/07/20.
//  Copyright © 2020 Pranay Joshi. All rights reserved.
//

import Foundation
import Alamofire
class HomeViewModel{
    var user : [AnyObject] = []
    var postArray : [String:Any] = [:]
    var totalCount = Int()
    // MARK: - func to get githubusers data by calling service class function.
    func getUsers(pageNo:Int,searchName:String, completion: @escaping (String) -> ()){
        postArray = ["q": searchName, "page": pageNo]
        Service.init().getApiResponsePostMethod(apiUrl: "https://api.github.com/search/users", method: .get, postArray: postArray) { [weak self] (json, response, error) in
            guard let json = json, error == nil else {
                completion("failure")
                return
            }
            if pageNo <= 1 {
                self?.user.removeAll()
            }
            if let totalCount: Int = json["total_count"] as? Int {
                if let users:[AnyObject] = json["items"] as? [AnyObject] {
                    self?.user += users
                    self?.totalCount = totalCount
                }
            }
            completion("success")
        }
    }
}
