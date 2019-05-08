//
//  ViewController.swift
//  TestViews
//
//  Created by artyom.andreev on 08/05/2019.
//  Copyright © 2019 artyom.andreev. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var image: UIImageView
    var colorControl: UISegmentedControl
    var clearButton: UIButton
    
    required init?(coder aDecoder: NSCoder) {
        image = UIImageView()
        colorControl = UISegmentedControl()
        clearButton = UIButton()

        super.init(coder: aDecoder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        drawImage()
        drawControl()
        drawButton()
    }
    
    @objc private func setImageDefault() {
        image.backgroundColor = .red
        image.alpha = 1.0
        colorControl.selectedSegmentIndex = 0
    }
    
    @objc private func changeAlpha() {
        if image.alpha == CGFloat(1.0) {
            image.alpha = 0.1
        } else {
            image.alpha = 1.0
        }
    }
    
    private func drawImage() {
        setImageDefault()
       
        image.isUserInteractionEnabled = true
        image.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(changeAlpha)))
        
//        image.frame.origin.x = view.safeAreaInsets.left
//        image.frame.origin.y = view.safeAreaInsets.top
//        image.frame.size.width = view.bounds.width - view.safeAreaInsets.left - view.safeAreaInsets.right
//        image.frame.size.height = 300
        
        view.addSubview(image)
        
        // try safe area
        image.translatesAutoresizingMaskIntoConstraints = false
        image.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor).isActive = true
        image.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor).isActive = true
        image.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        image.heightAnchor.constraint(equalToConstant: 300).isActive = true
    }
    
    private func drawControl() {
        colorControl.insertSegment(withTitle: "R", at: 0, animated: true)
        colorControl.insertSegment(withTitle: "G", at: 1, animated: true)
        colorControl.insertSegment(withTitle: "B", at: 2, animated: true)
        
        colorControl.addTarget(self, action: #selector(setImageColor), for: .valueChanged)
        
        colorControl.frame.origin.x = view.safeAreaInsets.left
        colorControl.frame.origin.y = 400
        colorControl.frame.size.width = view.bounds.width - view.safeAreaInsets.left - view.safeAreaInsets.right
        colorControl.frame.size.height = 50
        
        view.addSubview(colorControl)
    }
    
    @objc private func setImageColor() {
        switch colorControl.selectedSegmentIndex {
        case 0:
            image.backgroundColor = .red
        case 1:
            image.backgroundColor = .green
        case 2:
            image.backgroundColor = .blue
        default:
            break
        }
    }
    
    private func drawButton() {
        clearButton.setTitle("CLEAR", for: .normal)
        clearButton.addTarget(self, action: #selector(setImageDefault), for: .allTouchEvents)
        
        clearButton.setTitleColor(.black, for: .normal)
        
        clearButton.frame.origin.x = view.safeAreaInsets.left
        clearButton.frame.origin.y = 700
        clearButton.frame.size.width = view.bounds.width - view.safeAreaInsets.left - view.safeAreaInsets.right
        clearButton.frame.size.height = 50
        
        view.addSubview(clearButton)
    }
    
}

