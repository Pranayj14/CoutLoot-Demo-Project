//
//  UserDetailsViewController.swift
//  CoutLoot Demo Project
//
//  Created by Pranay Joshi on 26/07/20.
//  Copyright © 2020 Pranay Joshi. All rights reserved.
//

import UIKit

class UserDetailsViewController: UIViewController {
    var userDetailsViewModel = UserDetailViewModel()
   
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
    @IBOutlet weak var followersView: UIView!
    @IBOutlet weak var followingView: UIView!
    @IBOutlet weak var publicReposView: UIView!
    @IBOutlet weak var publicGistsView: UIView!
    @IBOutlet weak var about: UIView!
    
    var githubUserName: String?
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Profile"
        userDetailsViewModel.getUserDetails(userName: githubUserName ?? "") { (response) in
            let userImageLink =  self.userDetailsViewModel.userDetails?["avatar_url"] as? String ?? "".replacingOccurrences(of: " ", with: "%20", options: .literal, range: nil)
            self.userImage.imageFromURL(urlString: userImageLink)
            self.name.text = self.userDetailsViewModel.userDetails?["name"] as? String ?? ""
            self.userName.text = self.userDetailsViewModel.userDetails?["login"] as? String ?? ""
            self.userLocation.text = self.userDetailsViewModel.userDetails?["location"] as? String ?? ""
            self.lastUpdatedProfile.text = "Updated on " + self.userDetailsViewModel.dateAndTimeFormat(dateTimeofArticle: self.userDetailsViewModel.userDetails?["updated_at"] as? String ?? "")
            self.userBio.text = self.userDetailsViewModel.userDetails?["bio"] as? String ?? "No Information available. Please fill up your bio."
            self.userFollowers.text = String(self.userDetailsViewModel.userDetails?["followers"] as? Int ?? 0)
            self.userFollowing.text = String(self.userDetailsViewModel.userDetails?["following"] as? Int ?? 0)
            self.publicGists.text = String(self.userDetailsViewModel.userDetails?["public_gists"] as? Int ?? 0)
            self.publicRepos.text = String(self.userDetailsViewModel.userDetails?["public_repos"] as? Int ?? 0)
        }
    }
    
    @IBAction func shareUserProfile(_ sender: Any) {
        let ac = UIActivityViewController(activityItems: ["Checkout my profile on this wonderful Coutloot demo project app created by Pranay Joshi.",name.text ?? "",self.userDetailsViewModel.userDetails?["html_url"] as? String ?? ""] , applicationActivities: nil)
        present(ac, animated: true)
    }
}
