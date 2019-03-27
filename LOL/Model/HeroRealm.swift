//
//  HeroRealm.swift
//  LOL
//
//  Created by fsc on 2019/3/22.
//  Copyright © 2019 fsc. All rights reserved.
//

import Foundation
import RealmSwift

class HerRealm: Object {
    @objc dynamic var name = ""
    @objc dynamic var type = ""
    @objc dynamic var origin = ""
    @objc dynamic var image = ""
    @objc dynamic var favorite = false
    @objc dynamic var range = 500
    @objc dynamic var mv = 0.0
    @objc dynamic var heroDescription = ""
    @objc dynamic var rate = ""
//    @objc dynamic var heroStrength = [0.5,0.5,0.5,0.5,0.5]
}
