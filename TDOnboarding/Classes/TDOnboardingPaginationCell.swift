//
//  TDOnboardingPaginationCell.swift
//  TDOnboarding
//
//  Created by M.Haris Baig on 01/01/2020.
//  Copyright (c) 2020 M.Haris Baig. All rights reserved.
//

import Foundation
import UIKit

public protocol TDOnboardingPaginationCell {
    static var identifier: String { get }
    static var nib: UINib { get }
    func configure(for index: Int, isSelected: Bool, options: TDOnboardingOptions?)
}
