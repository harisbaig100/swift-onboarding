//
//  TDOnboardingItem.swift
//  TDOnboarding
//
//  Created by M.Haris Baig on 01/01/2020.
//  Copyright (c) 2020 M.Haris Baig. All rights reserved.
//

import Foundation

public protocol TDOnboardingItem {
    var image: UIImage { get }
    var subtitle: NSAttributedString { get }
    var topTitle: NSAttributedString? { get }
    var bottomTitle: NSAttributedString? { get }
    var topActionButtonTitle: NSAttributedString? { get }
    var bottomActionButtonTitle: NSAttributedString? { get }
    var loginButtonTitle: NSAttributedString? { get }
}
