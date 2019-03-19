//
//  Hero.swift
//  LOL
//
//  Created by fsc on 2019/3/9.
//  Copyright © 2019 fsc. All rights reserved.
//

import Foundation

struct Hero: Codable {
    //英雄名
    var name = ""
    //类型（射手/法师/坦克/战士/辅助）
    var type = ""
    //英雄起源地(德玛西亚，艾欧尼亚）
    var origin = ""
    //英雄图片
    var image = ""
    //是否收藏
    var favorite = false
    
    //射程
    var range = 550
    //攻速
    var mv = 0.0
    //英雄详细介绍
    var description = ""
    //评分
    var rate = ""
    
    var heroStrength = [0.5,0.5,0.5,0.5,0.5]
}
