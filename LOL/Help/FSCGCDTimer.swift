//
//  FSCGCDTimer.swift
//  LOL
//
//  Created by fsc on 2019/3/16.
//  Copyright © 2019 fsc. All rights reserved.
//

import Foundation

typealias ActionBlock = () -> ()

class FSCGCDTimer {
    
    //单例
    static let shared = FSCGCDTimer()
    
    lazy var timerContainer = [String: DispatchSourceTimer]()
    
    //- name: 定时器名字
    //- timeInterval: 时间间隔
    //- queue: 队列
    //- repeats: 是否重复
    //- action: 执行任务的闭包
    func scheduledDispatchTimer(withTimerName name: String?, timeInterval: Double, queue: DispatchQueue, repeats: Bool, action: @escaping ActionBlock) {
        if name == nil {
            return
        }
        
        var timer = timerContainer[name!]
        if timer == nil {
            timer = DispatchSource.makeTimerSource(flags: [], queue: queue)
            timer?.resume()
            timerContainer[name!] = timer
        }
        timer?.schedule(deadline: DispatchTime.now()+3, repeating: timeInterval, leeway: DispatchTimeInterval.milliseconds(100))
        timer?.setEventHandler(handler: { [weak self] in
            action()
            if repeats == false {
                self?.cancleTimer(withTimerName: name)
            }
        })
        
    }
    
    //取消定时器
    func cancleTimer(withTimerName name: String?) {
        let timer = timerContainer[name!]
        if timer == nil {
            return
        }
        timerContainer.removeValue(forKey: name!)
        timer?.cancel()
    }
    
    //检查定时器是否存在
    func isExistTimer(withTimerName name: String?) -> Bool {
        if timerContainer[name!] != nil {
            return true
        }
        return false
    }
    
}
