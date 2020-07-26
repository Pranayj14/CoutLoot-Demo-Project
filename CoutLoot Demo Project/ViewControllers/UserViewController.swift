//
//  ViewController.swift
//  CoutLoot Demo Project
//
//  Created by Pranay Joshi on 23/07/20.
//  Copyright © 2020 Pranay Joshi. All rights reserved.
//

import UIKit

class UserViewController: UIViewController, UITextFieldDelegate {
    // MARK: - Declaration of variables and outlets.
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
    
    // MARK: - Textfield action to remove objects from array and show search image and search label.
    @IBAction func searchUser(_ sender: Any) {
        if(usersSearchTextfield.text?.count ?? 0 == 0){
            viewModel.user.removeAll()
            searchLabel.isHidden = false
            searchImage.isHidden = false
            usersTabelView.isHidden = true
            self.usersTabelView.reloadData()
        }
    }
    
    // MARK: - function to get githubusers data
    func getUserData() {
        viewModel.getUsers(pageNo: pageNo, searchName: searchString ?? "") { (response) in
            if(response == "success"){
                self.searchLabel.isHidden = true
                self.searchImage.isHidden = true
                self.usersTabelView.isHidden = false
                self.spinner.isHidden = true
                self.usersTabelView.reloadData()
            }else{
                DispatchQueue.main.async {
                    let alert = UIAlertController(title: "", message: "Check your internet connection or contact the Administrator.", preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { (UIAlertAction) in
                        
                    }))
                    self.present(alert, animated: false, completion: nil)
                }
            }
        }
    }
    
    // MARK: - function todismiss the keyboard
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        pageNo = 1
        if(usersSearchTextfield.text?.count ?? 0 >= 1){
            searchString = usersSearchTextfield.text
            getUserData()
        }else {
            spinner.isHidden = true
            DispatchQueue.main.async {
                let alert = UIAlertController(title: "", message: "Please enter something!!", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { (UIAlertAction) in
                    
                }))
                self.present(alert, animated: false, completion: nil)
            }
        }
        return true
    }
}
