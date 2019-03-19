//
//  ScollView.swift
//  LOL
//
//  Created by fsc on 2019/3/17.
//  Copyright © 2019 fsc. All rights reserved.
//

import UIKit

let screenWidth = UIScreen.main.bounds.width
let screenHeight = UIScreen.main.bounds.height

class ScollLabelView: UIView {
    
    var firstLabel: UILabel!
    var secondLabel: UILabel!
    var thirdLabel: UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.clipsToBounds = true
        initLabel()
        Animations()
    }
    
    deinit {
        FSCGCDTimer.shared.cancleTimer(withTimerName: "ScollLabel")
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func initLabel() {
        firstLabel = UILabel(frame: CGRect(x: 0, y: 0, width: screenWidth, height: 20))
        firstLabel.backgroundColor = UIColor.orange
        firstLabel.textColor = UIColor.white
        firstLabel.textAlignment = .center
        firstLabel.text = "摇一摇这是第一个Label，你好吗"
        self.addSubview(firstLabel)
        
        secondLabel = UILabel(frame: CGRect(x: 0, y: 30, width: screenWidth, height: 20))
        secondLabel.backgroundColor = UIColor.orange
        secondLabel.textColor = UIColor.white
        secondLabel.textAlignment = .center
        secondLabel.text = "哦哦哦这是第二个Label，我很好，谢谢"
        self.addSubview(secondLabel)
        
        thirdLabel = UILabel(frame: CGRect(x: 0, y: 60, width: screenWidth, height: 20))
        thirdLabel.backgroundColor = UIColor.orange
        thirdLabel.textColor = UIColor.white
        thirdLabel.textAlignment = .center
        thirdLabel.text = "啊啊啊这是第三个Label，啊啊啊啊啊"
        self.addSubview(thirdLabel)
    }
    
    func Animations() {
        FSCGCDTimer.shared.scheduledDispatchTimer(withTimerName: "ScollLabel", timeInterval: 3, queue: .main, repeats: true) {
            UIViewPropertyAnimator(duration: 0.5, dampingRatio: 0.9, animations: {
                self.changeLabelFrame()
            }).startAnimation()
        }
    }
    
    func changeLabelFrame() {
        let firstLabelY = self.firstLabel.frame.minY
        let secondLabelY = self.secondLabel.frame.minY
        let thirdLabelY = self.thirdLabel.frame.minY
        if firstLabelY == 0 {
            self.firstLabel.transform = CGAffineTransform.init(translationX: 0, y: 60)
            self.firstLabel.frame = CGRect(x: 0, y: firstLabelY+60, width: screenWidth, height: 20)
            self.secondLabel.transform = CGAffineTransform.init(translationX: 0, y: -30)
            self.secondLabel.frame = CGRect(x: 0, y: secondLabelY-30, width: screenWidth, height: 20)
            self.thirdLabel.transform = CGAffineTransform.init(translationX: 0, y: -30)
            self.thirdLabel.frame = CGRect(x: 0, y: thirdLabelY-30, width: screenWidth, height: 20)
            print(firstLabelY)
        } else if firstLabelY == 60 {
            self.firstLabel.transform = CGAffineTransform.init(translationX: 0, y: -30)
            self.firstLabel.frame = CGRect(x: 0, y: firstLabelY-30, width: screenWidth, height: 20)
            self.secondLabel.transform = CGAffineTransform.init(translationX: 0, y: +60)
            self.secondLabel.frame = CGRect(x: 0, y: secondLabelY+60, width: screenWidth, height: 20)
            self.thirdLabel.transform = CGAffineTransform.init(translationX: 0, y: -30)
            self.thirdLabel.frame = CGRect(x: 0, y: thirdLabelY-30, width: screenWidth, height: 20)
        } else {
            self.firstLabel.transform = CGAffineTransform.init(translationX: 0, y: -30)
            self.firstLabel.frame = CGRect(x: 0, y: firstLabelY-30, width: screenWidth, height: 20)
            self.secondLabel.transform = CGAffineTransform.init(translationX: 0, y: -30)
            self.secondLabel.frame = CGRect(x: 0, y: secondLabelY-30, width: screenWidth, height: 20)
            self.thirdLabel.transform = CGAffineTransform.init(translationX: 0, y: 60)
            self.thirdLabel.frame = CGRect(x: 0, y: thirdLabelY+60, width: screenWidth, height: 20)
        }
    }
    
}
