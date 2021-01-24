//
//  ViewController.swift
//  Example
//
//  Created by Arman Zoghi on 1/23/21.
//

import UIKit
import UIRating
class ViewController: UIViewController {
    
    let ratingView1 = UIRating()
    let ratingView2 = UIRating()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        self.allConfigs()
    }

    
//MARK: - all configs
    fileprivate func allConfigs() {
        self.ratingView1Config()
        self.ratingView2Config()
    }
    
//MARK: - rating view 1
    //config
    fileprivate func ratingView1Config() {
        self.view.addSubview(self.ratingView1)
        self.ratingView1Constraints()
        self.ratingView1.delegate = self
    }
    //constraints
    fileprivate func ratingView1Constraints() {
        self.ratingView1.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint(item: self.ratingView1, attribute: .centerY, relatedBy: .equal, toItem: self.view, attribute: .centerY, multiplier: 0.8, constant: 0).isActive = true
        NSLayoutConstraint(item: self.ratingView1, attribute: .centerX, relatedBy: .equal, toItem: self.view, attribute: .centerX, multiplier: 1, constant: 0).isActive = true
        NSLayoutConstraint(item: self.ratingView1, attribute: .width, relatedBy: .equal, toItem: self.view, attribute: .width, multiplier: 0.7, constant: 0).isActive = true
        NSLayoutConstraint(item: self.ratingView1, attribute: .height, relatedBy: .equal, toItem: self.ratingView1, attribute: .width, multiplier: 0, constant: 60).isActive = true
    }
    
//MARK: - rating view 2
    //config
    fileprivate func ratingView2Config() {
        self.view.addSubview(self.ratingView2)
        self.ratingView2Constraints()
        self.ratingView2.emptyIcon = UIImage(named: "empty")
        self.ratingView2.halfFullIcon = UIImage(named: "half-full")
        self.ratingView2.fullIcon = UIImage(named: "full")
        self.ratingView2.numberOfOptions = 7
        self.ratingView2.allowHalfSelection = true
    }
    //constraints
    fileprivate func ratingView2Constraints() {
        self.ratingView2.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint(item: self.ratingView2, attribute: .centerY, relatedBy: .equal, toItem: self.view, attribute: .centerY, multiplier: 1.2, constant: 0).isActive = true
        NSLayoutConstraint(item: self.ratingView2, attribute: .centerX, relatedBy: .equal, toItem: self.view, attribute: .centerX, multiplier: 1, constant: 0).isActive = true
        NSLayoutConstraint(item: self.ratingView2, attribute: .width, relatedBy: .equal, toItem: self.view, attribute: .width, multiplier: 0.7, constant: 0).isActive = true
        NSLayoutConstraint(item: self.ratingView2, attribute: .height, relatedBy: .equal, toItem: self.ratingView2, attribute: .width, multiplier: 0, constant: 60).isActive = true
    }


}

extension ViewController: UIRatingDelegate {
    func currentRating(rating: Double) {
        print(rating)
    }
    
}

