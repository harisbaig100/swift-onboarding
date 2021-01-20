//
//  TDOnboardingPaginationDefaultCell.swift
//  TDOnboarding
//
//  Created by M.Haris Baig on 01/01/2020.
//  Copyright (c) 2020 M.Haris Baig. All rights reserved.
//

import Foundation
import UIKit

class TDOnboardingPaginationDefaultCell: UICollectionViewCell {
    // MARK: - IBOutlets:
    @IBOutlet weak var dotView: UIView!

    // MARK: - View Life Cycle:
    override func awakeFromNib() {
        super.awakeFromNib()
        self.dotView.layer.cornerRadius = 5.0
        self.dotView.layer.masksToBounds = true
    }
}

extension TDOnboardingPaginationDefaultCell: TDOnboardingPaginationCell {
    static var identifier: String = "tdOnboardingPaginationDefaulCell"

    static var nib: UINib = UINib(nibName: "TDOnboardingPaginationDefaultCell", bundle: Bundle(for: TDOnboardingPaginationDefaultCell.classForCoder()))
    
    func configure(for index: Int, isSelected: Bool, options: TDOnboardingOptions?) {
        if #available(iOS 11.0, *) {
            self.dotView.backgroundColor = (options?.color(for: .paginationItem) ?? UIColor(named: "pageDotsColor"))
        } else {
            self.dotView.backgroundColor = UIColor.lightGray
        }
        self.dotView.layer.borderWidth = isSelected ? 0.0 : 1.0
        self.dotView.layer.borderColor = UIColor.clear.cgColor
        self.dotView.layer.cornerRadius = isSelected ? 3.5 : 5.0
    }
}
