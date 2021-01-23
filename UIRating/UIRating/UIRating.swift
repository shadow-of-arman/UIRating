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
    
    /// Sets the amount of option to rate from.
    open var numberOfOptions: Int = 5
    /// Sets the spacing between options.
    open var spacing: CGFloat = 15 {
        didSet {
            self.stackView.spacing = self.spacing
        }
    }
    
    //icons
    /// Sets the icon to use for an empty rating.
    lazy open var emptyIcon    = UIImage(named: "UIRating_empty_icon"    , in: Bundle.init(for: type(of: self)), compatibleWith: nil)
    /// Sets the icon to use for a half rating.
    lazy open var halfFullIcon = UIImage(named: "UIRating_half_full_icon", in: Bundle.init(for: type(of: self)), compatibleWith: nil)
    /// Sets the icon to use for a full rating.
    lazy open var fullIcon     = UIImage(named: "UIRating_full_icon"     , in: Bundle.init(for: type(of: self)), compatibleWith: nil)
    
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
        self.stackViewConfig()
    }
    
//MARK: - Slider
    //config
    fileprivate func sliderConfig() {
        self.addSubview(self.slider)
        self.sliderConstraints()
        self.slider.setThumbImage(UIImage(), for: .normal)
        self.slider.setMinimumTrackImage(UIImage(), for: .normal)
        self.slider.setMaximumTrackImage(UIImage(), for: .normal)
        self.addSliderGesturesAndTargets()
    }
    //gestures
    fileprivate func addSliderGesturesAndTargets() {
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(self.sliderTapped(gestureRecognizer:)))
        let panGestureRecognizer = UIPanGestureRecognizer(target: self, action: #selector(self.sliderTapped(gestureRecognizer:)))
        self.slider.addGestureRecognizer(tapGestureRecognizer)
        self.slider.addGestureRecognizer(panGestureRecognizer)
        self.slider.addTarget(self, action: #selector(self.sliderUpdated(_:)), for: .valueChanged)
        self.slider.addTarget(self, action: #selector(self.sliderValueChanged(_:)), for: .touchUpInside)
        self.slider.addTarget(self, action: #selector(self.sliderBeingDragged(_:)), for: .touchDown)
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
        self.stackView.isUserInteractionEnabled = false
        self.stackView.axis = .horizontal
        self.stackView.alignment = .center
        self.stackView.distribution = .fillEqually
        self.stackView.spacing = self.spacing
        self.optionsConfig()
    }
    //constraints
    fileprivate func stackViewConstraints() {
        self.stackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint(item: self.stackView, attribute: .centerY, relatedBy: .equal, toItem: self.slider, attribute: .centerY, multiplier: 1, constant: 0).isActive = true
        NSLayoutConstraint(item: self.stackView, attribute: .centerX, relatedBy: .equal, toItem: self.slider, attribute: .centerX, multiplier: 1, constant: 0).isActive = true
        NSLayoutConstraint(item: self.stackView, attribute: .width, relatedBy: .equal, toItem: self.slider, attribute: .width, multiplier: 1, constant: 0).isActive = true
        NSLayoutConstraint(item: self.stackView, attribute: .height, relatedBy: .equal, toItem: self.slider, attribute: .height, multiplier: 1, constant: 0).isActive = true
    }
    
//MARK: - icon
    //config
    fileprivate func optionsConfig() {
        for _ in 1...self.numberOfOptions {
            let option = UIImageView(image: self.emptyIcon)
            option.contentMode = .scaleAspectFit
            self.stackView.addArrangedSubview(option)
        }
    }
    
    
//MARK: - Slider objc
    @objc fileprivate func sliderUpdated(_ slider: UISlider) {
        print(self.slider.value)
    }
    
    @objc fileprivate func sliderTapped(gestureRecognizer: UIGestureRecognizer) {
        let pointTapped: CGPoint = gestureRecognizer.location(in: self.slider)

        let positionOfSlider: CGPoint = self.slider.frame.origin
        let widthOfSlider: CGFloat = self.slider.frame.size.width
        let newValue = ((pointTapped.x - positionOfSlider.x) * CGFloat(self.slider.maximumValue) / widthOfSlider)
        self.slider.setValue(Float(newValue), animated: true)
            if gestureRecognizer.state == .ended {
                
            }
        self.sliderUpdated(self.slider)
    }
    
    @objc fileprivate func sliderBeingDragged(_ sender: UIScrollView) {
        
        self.sliderUpdated(self.slider)
    }
    
    @objc fileprivate func sliderValueChanged(_ sender: UIScrollView) {
        
        
        self.sliderUpdated(self.slider)
    }
    
}
