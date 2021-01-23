//
//  UIRating.swift
//  UIRating
//
//  Created by Arman Zoghi on 1/23/21.
//

import Foundation
import UIKit

open class UIRating: UIView {
    
    fileprivate let slider = UISlider()
    fileprivate let stackView = UIStackView()
    
//MARK: View life cycle
    
    override public init(frame: CGRect) {
        super.init(frame: frame)
        self.allConfigs()
    }
    
    public required init?(coder: NSCoder) {
        super.init(coder: coder)
        
    }
    
//MARK: - all configs
    fileprivate func allConfigs() {
        self.sliderConfig()
    }
    
//MARK: - Slider
    //config
    fileprivate func sliderConfig() {
        self.addSubview(self.slider)
        self.sliderConstraints()
    }
    //constraints
    fileprivate func sliderConstraints() {
        self.slider.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint(item: self.slider, attribute: .centerY, relatedBy: .equal, toItem: self, attribute: .centerY, multiplier: 1, constant: 0).isActive = true
        NSLayoutConstraint(item: self.slider, attribute: .centerX, relatedBy: .equal, toItem: self, attribute: .centerX, multiplier: 1, constant: 0).isActive = true
        NSLayoutConstraint(item: self.slider, attribute: .width, relatedBy: .equal, toItem: self, attribute: .width, multiplier: 1, constant: 0).isActive = true
        NSLayoutConstraint(item: self.slider, attribute: .height, relatedBy: .equal, toItem: self, attribute: .height, multiplier: 1, constant: 0).isActive = true
    }
    
//MARK: - all configs
    //configs
    fileprivate func stackViewConfig() {
        self.addSubview(self.stackView)
        self.stackViewConstraints()
    }
    //constraints
    fileprivate func stackViewConstraints() {
        self.stackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint(item: self.stackView, attribute: .centerY, relatedBy: .equal, toItem: self.slider, attribute: .centerY, multiplier: 1, constant: 0).isActive = true
        NSLayoutConstraint(item: self.stackView, attribute: .centerX, relatedBy: .equal, toItem: self.slider, attribute: .centerX, multiplier: 1, constant: 0).isActive = true
        NSLayoutConstraint(item: self.stackView, attribute: .width, relatedBy: .equal, toItem: self.slider, attribute: .width, multiplier: 1, constant: 0).isActive = true
        NSLayoutConstraint(item: self.stackView, attribute: .height, relatedBy: .equal, toItem: self.slider, attribute: .height, multiplier: 1, constant: 0).isActive = true
    }
    
}
