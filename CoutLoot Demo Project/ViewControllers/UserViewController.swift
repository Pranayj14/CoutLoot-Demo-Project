//
//  ViewController.swift
//  CoutLoot Demo Project
//
//  Created by Pranay Joshi on 23/07/20.
//  Copyright © 2020 Pranay Joshi. All rights reserved.
//

import UIKit

class UserViewController: UIViewController, UITextFieldDelegate {
    let viewModel = HomeViewModel()
    let spinner = UIActivityIndicatorView(style: .gray)
    var pageNo = 1
    var loadMore = false
    var searchString: String?
    
    @IBOutlet weak var searchImage: UIImageView!
    @IBOutlet weak var searchLabel: UILabel!
    @IBOutlet weak var usersSearchTextfield: UITextField!
    @IBOutlet weak var usersTabelView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Search Users"
        usersTabelView.isHidden = true
        self.usersSearchTextfield.delegate = self
        let usersNib = UINib(nibName: "UserTableViewCell", bundle: nil)
        self.usersTabelView.register(usersNib, forCellReuseIdentifier: "UserTableViewCell")
    }
    
    @IBAction func searchUser(_ sender: Any) {
        if(usersSearchTextfield.text?.count ?? 0 == 0){
            viewModel.user.removeAll()
            searchLabel.isHidden = false
            searchImage.isHidden = false
            usersTabelView.isHidden = true
            self.usersTabelView.reloadData()
        }
    }
    
    func getUserData() {
        viewModel.getUsers(pageNo: pageNo, searchName: searchString ?? "") { [weak self] (response) in
            self?.searchLabel.isHidden = true
            self?.searchImage.isHidden = true
            self?.usersTabelView.isHidden = false
            self?.usersTabelView.reloadData()
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        pageNo = 1
        if(usersSearchTextfield.text?.count ?? 0 >= 1){
            searchString = usersSearchTextfield.text
            getUserData()
        }else {
            spinner.isHidden = true
            print("please enter some character")
        }
        return true
    }
}
