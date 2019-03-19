//
//  RateViewController.swift
//  LOL
//
//  Created by fsc on 2019/3/9.
//  Copyright © 2019 fsc. All rights reserved.
//

import UIKit

class RateViewController: UIViewController {

    @IBOutlet weak var stackView: UIStackView!
    @IBOutlet var rateButtons: [UIButton]!
    
    
    @IBAction func tapBackground(_ sender: UITapGestureRecognizer) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func drawStackView(_ sender: UIPanGestureRecognizer) {
        switch sender.state {
            
        case .changed:
            //获取位移坐标
            let translate = sender.translation(in: view)
            let position = CGAffineTransform(translationX: translate.x, y: translate.y)
            
            let angle = translate.x / stackView.frame.width
            //            print(sin(translate.x / stackView.frame.width))
            
            stackView.transform = position.rotated(by: angle)
            
        case .ended:
            UIViewPropertyAnimator(duration: 0.5, dampingRatio: 0.5) {
                self.stackView.transform = .identity
                }.startAnimation()
            
        //拖动手势的各种状态
        case .possible, .began, .failed, .cancelled:
            break
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let startPosition = CGAffineTransform(translationX: 400, y: 0)
        let startScale = CGAffineTransform(scaleX: 10, y: 10)
        for button in rateButtons {
            button.alpha = 0
            button.transform = startPosition.concatenating(startScale)
        }

    }
    
    override func viewDidAppear(_ animated: Bool) {
        UIViewPropertyAnimator(duration: 0.3, dampingRatio: 0.5) {
            self.rateButtons[0].alpha = 1
            self.rateButtons[0].transform = .identity
            }.startAnimation(afterDelay: 0.1)
        
        UIViewPropertyAnimator(duration: 0.3, dampingRatio: 0.5) {
            self.rateButtons[1].alpha = 1
            self.rateButtons[1].transform = .identity
            }.startAnimation(afterDelay: 0.2)
        
        UIViewPropertyAnimator(duration: 0.3, dampingRatio: 0.5) {
            self.rateButtons[2].alpha = 1
            self.rateButtons[2].transform = .identity
            }.startAnimation(afterDelay: 0.3)
        
        UIViewPropertyAnimator(duration: 0.3, dampingRatio: 0.5) {
            self.rateButtons[3].alpha = 1
            self.rateButtons[3].transform = .identity
            }.startAnimation(afterDelay: 0.4)
        
        UIViewPropertyAnimator(duration: 0.3, dampingRatio: 0.5) {
            self.rateButtons[4].alpha = 1
            self.rateButtons[4].transform = .identity
            }.startAnimation(afterDelay: 0.5)
    }

}
