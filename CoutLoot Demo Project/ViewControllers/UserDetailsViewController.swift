//
//  UserDetailsViewController.swift
//  CoutLoot Demo Project
//
//  Created by Saumya Verma on 26/07/20.
//  Copyright © 2020 Pranay Joshi. All rights reserved.
//

import UIKit

class UserDetailsViewController: UIViewController {
    var userDetailsViewModel = UserDetailViewModel()
    @IBOutlet weak var userStatsStack1: UIStackView!
    @IBOutlet weak var userStatsStack2: UIStackView!
    @IBOutlet weak var userImage: UIImageView!
    @IBOutlet weak var userBio: UILabel!
    @IBOutlet weak var lastUpdatedProfile: UILabel!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var userLocation: UILabel!
    @IBOutlet weak var userFollowers: UILabel!
    @IBOutlet weak var userFollowing: UILabel!
    @IBOutlet weak var publicRepos: UILabel!
    @IBOutlet weak var publicGists: UILabel!
    
    var githubUserName: String?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        userDetailsViewModel.getUserDetails(userName: githubUserName ?? "") { (response) in
            self.name.text = self.userDetailsViewModel.userDetails?["name"] as? String ?? ""
            self.userName.text = self.userDetailsViewModel.userDetails?["login"] as? String ?? ""
            self.userLocation.text = self.userDetailsViewModel.userDetails?["location"] as? String ?? ""
            self.lastUpdatedProfile.text = "Updated on " + self.userDetailsViewModel.dateAndTimeFormat(dateTimeofArticle: self.userDetailsViewModel.userDetails?["updated_at"] as? String ?? "")
            self.userBio.text = self.userDetailsViewModel.userDetails?["bio"] as? String ?? "No Information available. Please fill up your bio."
        }
    }
    
    @IBAction func shareUserProfile(_ sender: Any) {
        
    }
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}
