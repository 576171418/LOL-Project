//
//  ChatViewController.swift
//  LOL
//
//  Created by fsc on 2019/3/12.
//  Copyright © 2019 fsc. All rights reserved.
//

import UIKit
import Hyphenate
import SnapKit

class ChatViewController: UIViewController {
    
    var firstLabel: UILabel!
    var secondLabel: UILabel!
    var thirdLabel: UILabel!
    var scollLabelView: ScollLabelView?
    
    var pictures = ["vn","zed","ez","eyu","luxian"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        scollLabelView = ScollLabelView(frame: CGRect(x: 0, y: 100, width: screenWidth, height: 20))
        self.view.addSubview(scollLabelView!)
        createCyclePicture1()

    }
    func createCyclePicture1() {
        
        let cyclePictureView: FSCCyclyView = FSCCyclyView(frame: CGRect(x: 0, y: 200, width: self.view.frame.width, height: 250), pictures: pictures)
        
        // 滚动方向
        cyclePictureView.direction = .left
        
        // 自动滚动时间
        cyclePictureView.autoScrollDelay = 3
        
        // pageControl 位置
        cyclePictureView.pageControlStyle = .center

        // 点击回调
        cyclePictureView.didTapAtIndexHandle = { index in
            
            print("点击了第 \(index + 1) 张图片")
        }
        
        self.view.addSubview(cyclePictureView)
    }
}
