//
//  ViewController.swift
//  Example
//
//  Created by Arman Zoghi on 1/23/21.
//

import UIKit
import UIRating
class ViewController: UIViewController {
    
    let ratingView = UIRating()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        self.allConfigs()
    }

    
//MARK: - all configs
    fileprivate func allConfigs() {
        self.ratingViewConfig()
        self.ratingView.emptyIcon = UIImage(named: "empty")
        self.ratingView.fullIcon = UIImage(named: "full")
    }
    
//MARK: - rating view
    //config
    fileprivate func ratingViewConfig() {
        self.view.addSubview(self.ratingView)
        self.ratingViewConstraints()
    }
    //constraints
    fileprivate func ratingViewConstraints() {
        self.ratingView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint(item: self.ratingView, attribute: .centerY, relatedBy: .equal, toItem: self.view, attribute: .centerY, multiplier: 1, constant: 0).isActive = true
        NSLayoutConstraint(item: self.ratingView, attribute: .centerX, relatedBy: .equal, toItem: self.view, attribute: .centerX, multiplier: 1, constant: 0).isActive = true
        NSLayoutConstraint(item: self.ratingView, attribute: .width, relatedBy: .equal, toItem: self.view, attribute: .width, multiplier: 0.7, constant: 0).isActive = true
        NSLayoutConstraint(item: self.ratingView, attribute: .height, relatedBy: .equal, toItem: self.ratingView, attribute: .width, multiplier: 0, constant: 60).isActive = true
    }

}

