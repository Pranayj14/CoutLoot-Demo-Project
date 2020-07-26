//
//  ViewController.swift
//  CoutLoot Demo Project
//
//  Created by Saumya Verma on 23/07/20.
//  Copyright © 2020 Pranay Joshi. All rights reserved.
//

import UIKit

class UserViewController: UIViewController, UITextFieldDelegate {
    let viewModel = HomeViewModel()
    var pageNo = 1
    var loadMore = false
    var searchString: String?
    @IBOutlet weak var usersSearchTextfield: UITextField!
    @IBOutlet weak var usersTabelView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Search Users"
        self.usersSearchTextfield.delegate = self
        let usersNib = UINib(nibName: "UserTableViewCell", bundle: nil)
        self.usersTabelView.register(usersNib, forCellReuseIdentifier: "UserTableViewCell")
    }
    
    
    @IBAction func searchUser(_ sender: Any) {
        if(usersSearchTextfield.text?.count ?? 0 == 0){
            viewModel.user.removeAll()
            self.usersTabelView.reloadData()
        }
    }
    
    func getUserData() {
        viewModel.getUsers(pageNo: pageNo, searchName: searchString ?? "") { [weak self] (response) in
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
            print("please enter some character")
        }
        return true
    }
    deinit {
        print("lets hope for the best!!")
    }
}
