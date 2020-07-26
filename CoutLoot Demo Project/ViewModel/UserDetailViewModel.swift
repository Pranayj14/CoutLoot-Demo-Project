//
//  UserDetailModel.swift
//  CoutLoot Demo Project
//
//  Created by Saumya Verma on 26/07/20.
//  Copyright © 2020 Pranay Joshi. All rights reserved.
//

import Foundation

class UserDetailViewModel {
    var userDetails : NSDictionary?
    func getUserDetails(userName:String, completion: @escaping (String) -> ()){
        Service.init().getApiResponsePostMethod(apiUrl: "https://api.github.com/users/" + userName, method: .get, postArray: [:]) { [weak self] (json, response, error) in
            guard let json = json, error == nil else {
                completion("failure")
                return
            }
            self!.userDetails = json
            completion("success")
        }
    }
    func dateAndTimeFormat(dateTimeofArticle: String) -> String{
           let dateTime = dateTimeofArticle
           let dateFormatter = DateFormatter()
           let tempLocale = dateFormatter.locale // save locale temporarily
           dateFormatter.locale = Locale(identifier: "en_US_POSIX") // set locale to reliable US_POSIX
           dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss'Z'"
           let date = dateFormatter.date(from: dateTime)!
           dateFormatter.dateFormat = "MMM dd, yyyy"
           dateFormatter.locale = tempLocale // reset the locale
           let dateString = dateFormatter.string(from: date)
        print(dateString)
           return dateString
    }
}
