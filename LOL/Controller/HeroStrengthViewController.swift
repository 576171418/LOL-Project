//
//  HeroStrengthViewController.swift
//  LOL
//
//  Created by fsc on 2019/3/17.
//  Copyright © 2019 fsc. All rights reserved.
//

import UIKit

class HeroStrengthViewController: UIViewController {
    
    var hero = Hero()

    override func viewDidLoad() {
        super.viewDidLoad()
        // 初始化图表视图控件
        let chartWidth  = self.view.frame.size.width
        let chartHeight = self.view.frame.size.height - 200
        let aaChartView = AAChartView()
        aaChartView.frame = CGRect(x:0, y:0, width:chartWidth, height:chartHeight)
        self.view.addSubview(aaChartView)
        
        // 初始化图表模型
        let chartModel = AAChartModel()
            .chartType(.line)//图表类型
            .title("英雄强度随等级走势")//图表主标题
            .inverted(false)//是否翻转图形
            .yAxisTitle("强度")// Y 轴标题
            .legendEnabled(true)//是否启用图表的图例(图表底部的可点击的小圆点)
            .tooltipValueSuffix("强度")//浮动提示框单位后缀
            .categories(["1级", "3级", "6级", "11级", "15级", "18级"])
            .colorsTheme([AAGradientColor.oceanBlue,
                          AAGradientColor.sanguine,
                          AAGradientColor.lusciousLime])//渐变颜色数组
            .series([
                AASeriesElement()
                    .name(hero.name)
                    .data(hero.heroStrength)
                    .toDic()!])
        
        // 图表视图对象调用图表模型对象,绘制最终图形
        aaChartView.aa_drawChartWithChartModel(chartModel)
    }
    
}
