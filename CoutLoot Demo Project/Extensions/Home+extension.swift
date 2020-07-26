//
//  Home.swift
//  CoutLoot Demo Project
//
//  Created by Saumya Verma on 25/07/20.
//  Copyright © 2020 Pranay Joshi. All rights reserved.
//

import Foundation
import UIKit

extension UserViewController: UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.user.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = usersTabelView.dequeueReusableCell(withIdentifier: "UserTableViewCell", for: indexPath) as! UserTableViewCell
        if let userImage: String = viewModel.user[indexPath.row]["avatar_url"] as? String{
            if let userName: String = viewModel.user[indexPath.row]["login"] as? String {
                let userImageLink = userImage.replacingOccurrences(of: " ", with: "%20", options: .literal, range: nil)
                cell.userName.text = userName
                cell.userImage.imageFromURL(urlString: userImageLink)
            }
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        let rotationTransform = CATransform3DTranslate(CATransform3DIdentity, 0, 50, 0)
        cell.layer.transform = rotationTransform
        cell.alpha = 0
        UIView.animate(withDuration: 0.75) {
            cell.layer.transform = CATransform3DIdentity
            cell.alpha = 1.0
        }
                let lastSectionIndex = usersTabelView.numberOfSections - 1
                let lastRowIndex = usersTabelView.numberOfRows(inSection: lastSectionIndex) - 1
                if indexPath.row == lastRowIndex {
                    if viewModel.totalCount > viewModel.user.count && !loadMore{
        
                                            let spinner = UIActivityIndicatorView(style: .gray)
                                            spinner.startAnimating()
                                            spinner.frame = CGRect(x: CGFloat(0), y: CGFloat(0), width: usersTabelView.bounds.width, height: CGFloat(44))
                                            self.usersTabelView.tableFooterView = spinner
                                            self.usersTabelView.tableFooterView?.isHidden = false
                    }
                }
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
         let storyBoard = UIStoryboard(name: "Main", bundle: nil)
               let vc = storyBoard.instantiateViewController(withIdentifier: "UserDetailsViewController") as! UserDetailsViewController
           if let userName: String = viewModel.user[indexPath.row]["login"] as? String {
        vc.githubUserName = userName
        }
        self.navigationController?.pushViewController(vc, animated: true)

    }
    
    
    // MARK: - function used to implement for pagination.
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let offset = scrollView.contentOffset.y
        let contentHeight = scrollView.contentSize.height
        if offset > contentHeight - scrollView.frame.height{
            if viewModel.totalCount > viewModel.user.count && !loadMore{
                loadMore = true
                pageNo = pageNo + 1
                DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                    self.getUserData()
                    self.loadMore = false
                }
            }
        }
        
    }
    
}
