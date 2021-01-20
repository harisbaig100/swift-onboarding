//
//  ViewController.swift
//  TDOnboarding
//
//  Created by M.Haris Baig on 01/01/2020.
//  Copyright (c) 2020 M.Haris Baig. All rights reserved.
//

import UIKit
import TDOnboarding

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        var items = [ExampleOnboardingItem]()
        items.append(ExampleOnboardingItem(image: #imageLiteral(resourceName: "image2"), title: "KRIJG NIEUWE  OPDRACHTEN", subtitle: "Nulla ornare semper blandit. Vivamus sagittis, ligula eget interdum tempus.", isLast: false))
        items.append(ExampleOnboardingItem(image: #imageLiteral(resourceName: "image1"), title: "KRIJG NIEUWE  OPDRACHTEN", subtitle: "Nulla ornare semper blandit. Vivamus sagittis, ligula eget interdum tempus.", isLast: false))
        items.append(ExampleOnboardingItem(image: #imageLiteral(resourceName: "image3"), title: "KRIJG NIEUWE  OPDRACHTEN", subtitle: "Nulla ornare semper blandit. Vivamus sagittis, ligula eget interdum tempus.", isLast: false))
        let onboarding = TDOnboarding(items: items, options: ExampleOnboardingOptions())
        onboarding.delegate = self
        onboarding.present(from: self, completion: nil)
    }
}

extension ViewController: TDOnboardingDelegate {
    func loginButtonTapped(on onboarding: TDOnboarding, itemIndex: Int) {
        print("did tap login btn \(itemIndex)")
    }
    
    func topActionButtonTapped(on onboarding: TDOnboarding, itemIndex: Int) {
        print("did tap top in \(itemIndex)")
    }
    
    func bottomActionButtonTapped(on onboarding: TDOnboarding, itemIndex: Int) {
        print("did tap bottom in \(itemIndex)")
    }
}

struct ExampleOnboardingItem: TDOnboardingItem {
    var loginButtonTitle: NSAttributedString?
    var image: UIImage
    var subtitle: NSAttributedString
    var topTitle: NSAttributedString?
    var bottomTitle: NSAttributedString?
    var topActionButtonTitle: NSAttributedString?
    var bottomActionButtonTitle: NSAttributedString?

    init(image: UIImage, title: String, subtitle: String, isLast: Bool) {
        let titleAttributes: [NSAttributedString.Key: Any] = [
            .font: UIFont.systemFont(ofSize: 48, weight: .semibold),
            .foregroundColor: UIColor.white
        ]

        let subtitleAttributes: [NSAttributedString.Key: Any] = [
            .font: UIFont.systemFont(ofSize: 25, weight: .light),
            .foregroundColor: UIColor.white
        ]
        
        let btnTextAttributes: [NSAttributedString.Key: Any] = [
            .font: UIFont.systemFont(ofSize: 16, weight:.semibold),
            .foregroundColor: UIColor.white
        ]
        
        self.image = image
        self.subtitle = NSAttributedString(string: subtitle, attributes: subtitleAttributes)
        self.bottomTitle = NSAttributedString(string: title, attributes: titleAttributes)
        self.bottomActionButtonTitle = NSAttributedString(string: "Start meteen", attributes: btnTextAttributes)
        self.loginButtonTitle = NSAttributedString(string: "Of login", attributes: btnTextAttributes)
    }
}

struct ExampleOnboardingOptions: TDOnboardingOptions {
    var statusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    var defaultBackgroundImage: UIImage {
        return #imageLiteral(resourceName: "disruptor4K")
    }

    func measure(for component: TDOnboardingMeasurableComponent) -> CGFloat? {
        switch component {
        case .bottomPanelHeight:
            return 170.0
        case .imageBottomDistance, .imageTopDistance:
            return 0.0
        case .bottomActionButtonWidth:
            return 315.0
        }
    }

    func configure(for component: TDOnboardingConfigurableComponent) {
        switch component {
        case .bottomActionButton(let button):
            button.layer.cornerRadius = 5.0
            button.layer.masksToBounds = true
            if #available(iOS 11.0, *) {
                button.backgroundColor = UIColor(named: "btnColor")
            } else {
                button.backgroundColor = .green
            }
            button.layer.cornerRadius = 20
            button.layer.borderWidth = 0.5
            button.layer.borderColor = UIColor.lightGray.cgColor
            
        default:
            break
        }
    }

//    var paginationCell: TDOnboardingPaginationCell.Type {
//        return CustomPaginationItemCell.self
//    }
}

