//
//  TDOnboardingItemCell.swift
//  Pods-TDOnboarding_Example
//
//  Created by M.Haris Baig on 01/01/2020.
//  Copyright (c) 2020 M.Haris Baig. All rights reserved.
//

import UIKit

protocol TDOnboardingItemCellDelegate: class {
    func bottomActionTapped(on cell: TDOnboardingItemCell)
    func loginButtonTapped(on cell: TDOnboardingItemCell)
}

class TDOnboardingItemCell: UICollectionViewCell {
    // MARK: - IBOutlets:
    @IBOutlet weak var bottomTitleLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!
    @IBOutlet weak var bottomActionButton: UIButton!
    @IBOutlet weak var bottomPanelHeightConstraint: NSLayoutConstraint!
    
    @IBOutlet var loginButton: UIButton!
    
    @IBOutlet var imageViewBackground: UIImageView!
    
    // MARK: - IBActions:
    @IBAction func bottomButtonTapped() {
        self.delegate?.bottomActionTapped(on: self)
    }
    
    @IBAction func loginButtonTapped(_ sender: Any) {
        self.delegate?.loginButtonTapped(on: self)
    }
    

    // MARK: - Model:
    var item: TDOnboardingItem!
    var options: TDOnboardingOptions!
    weak var delegate: TDOnboardingItemCellDelegate?

    // MARK: - Funcs:
    func configure() {
        
        self.imageViewBackground.image = self.item.image
        self.bottomTitleLabel.attributedText = self.item.bottomTitle
        self.subtitleLabel.attributedText = self.item.subtitle
        self.bottomActionButton.setAttributedTitle(self.item.bottomActionButtonTitle, for: .normal)
        self.loginButton.setAttributedTitle(self.item.loginButtonTitle, for: .normal)
        self.bottomActionButton.isHidden = self.item.bottomActionButtonTitle == nil
        self.bottomTitleLabel.isHidden = self.item.bottomTitle == nil
        self.bottomPanelHeightConstraint.constant = self.options.measure(for: .bottomPanelHeight) ?? 300.0
        self.options.configure(for: .bottomActionButton(self.bottomActionButton))

    }
}
