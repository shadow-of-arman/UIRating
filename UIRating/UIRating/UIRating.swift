//
//  UIRating.swift
//  UIRating
//
//  Created by Arman Zoghi on 1/23/21.
//

import Foundation
import UIKit

/// A customizable rating view.
open class UIRating: UIView {
    
    fileprivate let slider = UISlider()
    fileprivate let stackView = UIStackView()
    fileprivate var option: Float!
    fileprivate var animationHandler = false
    fileprivate var rating:Double = 0.0

    /// Sets the amount of option to rate from.
    open var numberOfOptions: Int = 5 {
        didSet {
            self.optionsReset()
        }
    }
    /// Allows the selection of half ratings if set to true.
    open var allowHalfSelection = false {
        didSet {
            
        }
    }
    /// Sets the spacing between options.
    open var spacing: CGFloat = 15 {
        didSet {
            self.stackView.spacing = self.spacing
        }
    }
    
    /// The delegate for UIRating.
    open var delegate: UIRatingDelegate?
    
    //icons
    /// Sets the icon to use for an empty rating.
    lazy open var emptyIcon    = UIImage(named: "UIRating_empty_icon"    , in: Bundle.init(for: type(of: self)), compatibleWith: nil) {
        didSet {
            self.optionsReset()
        }
    }
    /// Sets the icon to use for a half rating.
    lazy open var halfFullIcon = UIImage(named: "UIRating_half_full_icon", in: Bundle.init(for: type(of: self)), compatibleWith: nil)
    /// Sets the icon to use for a full rating.
    lazy open var fullIcon     = UIImage(named: "UIRating_full_icon"     , in: Bundle.init(for: type(of: self)), compatibleWith: nil)
    
//MARK: View life cycle
    
    /// The default initializer for UIRating.
    /// - Parameter frame: Sets the frame for the UIRating instance.
    override public init(frame: CGRect) {
        super.init(frame: frame)
        self.allConfigs()
    }
    
    /// The required coder initializer for UIRating.
    /// - Parameter coder: NSCoder.
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
        for _ in 0...(numberOfOptions - 1) {
            let option = UIImageView(image: self.emptyIcon)
            option.contentMode = .scaleAspectFit
            self.stackView.addArrangedSubview(option)
        }
        self.option = 1 / Float(self.numberOfOptions)
    }
    //reset
    fileprivate func optionsReset() {
        self.stackView.removeAllArrangedSubviews()
        self.optionsConfig()
    }
        
//MARK: - Slider objc
    @objc fileprivate func sliderUpdated(_ slider: UISlider) {
        let y = 1 / Float(self.numberOfOptions)
        var ratingIncrease:Double = 1.0
        if self.allowHalfSelection == true {
            ratingIncrease = 0.5
        }
        for i in 0...(numberOfOptions - 1) {
            let imageView = self.stackView.arrangedSubviews[i] as! UIImageView
            if self.allowHalfSelection && self.slider.value > (self.option - y) && self.slider.value < (self.option - y + (y / 2)) {
                self.rating += ratingIncrease
                if imageView.image != self.halfFullIcon {
                    UIView.transition(with: imageView, duration: 0.3, options: .transitionCrossDissolve, animations: {
                        imageView.image = self.halfFullIcon
                    }, completion: nil)
                }
            } else
            if self.slider.value > (self.option - y) {
                if self.allowHalfSelection {
                    self.rating += ratingIncrease
                }
                self.rating += ratingIncrease
                if imageView.image != self.fullIcon {
                    UIView.transition(with: imageView, duration: 0.3, options: .transitionFlipFromLeft) {
                        imageView.image = self.fullIcon
                        imageView.transform = CGAffineTransform.init(translationX: 0, y: -imageView.frame.height / 2)
                    } completion: { (_) in
                        UIView.animate(withDuration: 0.2) {
                            imageView.transform = .identity
                        }
                    }
                }
            } else {
                if imageView.image != self.emptyIcon {
                    if self.rating < 0 {
                        self.rating -= ratingIncrease
                    }
                    UIView.transition(with: imageView, duration: 0.3, options: .transitionFlipFromRight) {
                        imageView.image = self.emptyIcon
                    }
                }
            }
            self.option += y
        }
        self.delegate?.currentRating(rating: self.rating)
        self.rating = 0
        self.option = y //reset
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

//MARK: - Delegate
extension UIRating: UIRatingDelegate {
    public func currentRating(rating: Double) {
        
    }
}

private extension UIStackView {
    /// Removes all arranged subviews within a StackView.
    func removeAllArrangedSubviews() {
        
        let removedSubviews = arrangedSubviews.reduce([]) { (allSubviews, subview) -> [UIView] in
            self.removeArrangedSubview(subview)
            return allSubviews + [subview]
        }
        
        // Deactivate all constraints
        NSLayoutConstraint.deactivate(removedSubviews.flatMap({ $0.constraints }))
        
        // Remove the views from self
        removedSubviews.forEach({ $0.removeFromSuperview() })
    }
}
