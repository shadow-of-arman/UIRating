//
//  UIRatingDelegate.swift
//  UIRating
//
//  Created by Arman Zoghi on 1/24/21.
//

import Foundation

/// The delegate protocol used by UIRating.
public protocol UIRatingDelegate {
    /// Returns the rating selected.
    /// - Parameter rating: The selected rating.
    func currentRating(rating: Double)
}
