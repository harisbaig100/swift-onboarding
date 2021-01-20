//
//  TDOnboarding.swift
//  TDOnboarding
//
//  Created by M.Haris Baig on 01/01/2020.
//  Copyright (c) 2020 M.Haris Baig. All rights reserved.
//

import Foundation
import UIKit

public protocol TDOnboardingDelegate: class {
    func bottomActionButtonTapped(on onboarding: TDOnboarding, itemIndex: Int)
    func loginButtonTapped(on onboarding: TDOnboarding, itemIndex: Int)
}

public class TDOnboarding {
    var items: [TDOnboardingItem]
    var options: TDOnboardingOptions

    public weak var delegate: TDOnboardingDelegate?

    public init(items: [TDOnboardingItem], options: TDOnboardingOptions) {
        self.items = items
        self.options = options
    }

    public func present(from presentingViewController: UIViewController, animated: Bool = true, completion: (() -> Void)?) {
        guard let onboardingVC = TDOnboardingViewController.initiateFromStoryboard(with: self) else {
            return
        }
        presentingViewController.present(onboardingVC, animated: animated, completion: completion)
    }
}
