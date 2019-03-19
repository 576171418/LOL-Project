//
//  ViewController.swift
//  LOL
//
//  Created by fsc on 2019/3/9.
//  Copyright © 2019 fsc. All rights reserved.
//
import UIKit
import MJRefresh

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, NewHeroDelegate {

    @IBOutlet weak var tableView: UITableView!
    
    @IBAction func tapFav(_ sender: UIButton) {
        let btnPods = sender.convert(CGPoint.zero, to: self.tableView)
        
        let indexPath = tableView.indexPathForRow(at: btnPods)!
        
        self.heros[indexPath.row].favorite = !self.heros[indexPath.row].favorite
        
        let cell = tableView.cellForRow(at: indexPath) as! HeroCardCell
        
        cell.favorite = self.heros[indexPath.row].favorite
    }
    
    @IBAction func toNewHeroVC(_ sender: UIBarButtonItem) {
        let newHeroVC = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "NewHeroViewController") as! NewHeroViewController
        newHeroVC.delegate = self
        self.show(newHeroVC, sender: nil)
    }
    
    //下拉刷新
    let header = MJRefreshNormalHeader()
    
    var newImage: UIImage?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        //设置navigationBarn大标题的主题颜色
        navigationController?.navigationBar.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor : UIColor(named: "Theme") ?? UIColor.blue]
        
        navigationController?.navigationBar.tintColor = UIColor(named: "Theme")
        
        //下拉刷新的相关设置
        header.setRefreshingTarget(self, refreshingAction: #selector(self.refresh))
        self.tableView.mj_header = header
                
    }
    
    @objc func refresh() {
        sleep(2)
        self.tableView.reloadData()
        self.tableView.mj_header.endRefreshing()
    }
    
    func sendHero(hero: Hero, iamge: UIImage) {
        print(hero)
        print(iamge)
        heros.insert(hero, at: 0)
        newImage = iamge
        tableView.mj_header.beginRefreshing()
    }
    
    //MARK: - TableViewDelegate and TableViewDataSource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return heros.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "HeroCardCell", for: indexPath) as! HeroCardCell
        let row = indexPath.row
        cell.name.text = heros[row].name
        cell.type.text = heros[row].type
        cell.origin.text = heros[row].origin
        cell.heroImage.image = UIImage(named: heros[row].image)
        cell.favorite = heros[row].favorite
        if heros[row].image == "" {
            cell.heroImage.image = newImage
        } else {
            cell.heroImage.image = UIImage(named: heros[row].image)
        }
        return cell
    }
    
    //自定义tableView左滑菜单
    func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let favAction = UIContextualAction(style: .normal, title: "喜欢") { (_, _, complection) in
            self.heros[indexPath.row].favorite = !self.heros[indexPath.row].favorite
            let cell = tableView.cellForRow(at: indexPath) as! HeroCardCell
            cell.favorite = self.heros[indexPath.row].favorite
            complection(true)
        }
        if heros[indexPath.row].favorite {
            favAction.image = UIImage(named: "fav")
        } else {
            favAction.image = UIImage(named: "unfav")
        }
        
        favAction.backgroundColor = UIColor.purple
        
        let config = UISwipeActionsConfiguration(actions: [favAction])
        return config
        
    }
    
    //自定义tableView右滑菜单
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let delAction = UIContextualAction(style: .destructive, title: "删除") { (_, _, complection) in
            self.heros.remove(at: indexPath.row)
            self.tableView.deleteRows(at: [indexPath], with: .automatic)
            
            complection(true)
        }
        
        let shareAction = UIContextualAction(style: .normal, title: "分享") { (_, _, complection) in
            let text = "这是英雄联盟中的英雄\(self.heros[indexPath.row])"
            let image = UIImage(named: self.heros[indexPath.row].image)!
            
            let ac = UIActivityViewController(activityItems: [text,image], applicationActivities: nil)

            self.present(ac, animated: true)
            
            complection(true)
        }
        shareAction.backgroundColor = .orange
        
        let config = UISwipeActionsConfiguration(actions: [delAction, shareAction])
        return config
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailVC = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "DetailViewController") as! DetailViewController
        detailVC.hero = heros[indexPath.row]
        if heros[indexPath.row].image == "" {
            detailVC.newbackgroundImage = newImage
        }
        self.show(detailVC, sender: nil)
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    var heros: [Hero] =
        [Hero(name: "九尾妖狐", type: "法师", origin: "德玛西亚", image: "ali", favorite: false, range: 550, mv: 0.65, description: "阿狸的详细介绍阿狸的详细介绍阿狸的详细介绍阿狸的详细介绍阿狸的详细介绍阿狸的详细介绍阿狸的详细介绍阿狸的详细介绍阿狸的详细介绍阿狸的详细介绍阿狸的详细介绍阿狸的详细介绍阿狸的详细介绍阿狸的详细介绍阿狸的详细介绍阿狸的详细介绍阿狸的详细介绍阿狸的详细介绍阿狸的详细介绍阿狸的详细介绍阿狸的详细介绍阿狸的详细介绍阿狸的详细介绍阿狸的详细介绍阿狸的详细介绍阿狸的详细介绍阿狸的详细介绍阿狸的详细介绍阿狸的详细介绍阿狸的详细介绍阿狸的详细介绍阿狸的详细介绍阿狸的详细介绍阿狸的详细介绍阿狸的详细介绍阿狸的详细介绍阿狸的详细介绍阿狸的详细介绍阿狸的详细介绍阿狸的详细介绍阿狸的详细介绍阿狸的详细介绍阿狸的详细介绍阿狸的详细介绍阿狸的详细介绍阿狸的详细介绍", rate: "0", heroStrength: [0.5, 0.6, 0.9, 1.0, 0.4]),
         Hero(name: "魂锁典狱长", type: "辅助", origin: "艾欧尼亚", image: "chuishi", favorite: false, range: 550, mv: 0.65, description: "锤石的详细介绍", rate: "0", heroStrength: [0.5, 0.6, 0.9, 1.0, 0.4]),
         Hero(name: "鳄鱼", type: "战士", origin: "德玛西亚", image: "eyu", favorite: false, range: 100, mv: 0.65, description: "鳄鱼的详细介绍", rate: "0", heroStrength: [0.5, 0.6, 0.9, 1.0, 0.4]),
         Hero(name: "伊泽瑞尔", type: "射手", origin: "艾欧尼亚", image: "ez", favorite: false, range: 550, mv: 0.75, description: "EZ的详细介绍", rate: "0", heroStrength: [0.5, 0.6, 0.9, 1.0, 0.4]),
         Hero(name: "皎月女神", type: "法师/战士", origin: "德玛西亚", image: "jiaoyue", favorite: false, range: 150, mv: 0.55, description: "皎月的详细介绍", rate: "0", heroStrength: [0.5, 0.6, 0.9, 1.0, 0.4]),
         Hero(name: "圣枪游侠", type: "射手", origin: "德玛西亚", image: "luxian", favorite: false, range: 500, mv: 0.70, description: "卢锡安的详细介绍", rate: "0", heroStrength: [0.5, 0.6, 0.9, 1.0, 0.4]),
         Hero(name: "法外狂徒", type: "射手/战士", origin: "德玛西亚", image: "nanqiang", favorite: false, range: 400, mv: 0.65, description: "男枪的详细介绍", rate: "0", heroStrength: [0.5, 0.6, 0.9, 1.0, 0.4]),
         Hero(name: "琴女", type: "法师/辅助", origin: "德玛西亚", image: "qinnv", favorite: false, range: 500, mv: 0.48, description: "琴女的详细介绍", rate: "0", heroStrength: [0.5, 0.6, 0.9, 1.0, 0.4]),
         Hero(name: "暗夜猎手", type: "射手/刺客", origin: "德玛西亚", image: "vn", favorite: false, range: 550, mv: 0.85, description: "薇恩的详细介绍", rate: "0", heroStrength: [0.5, 0.6, 0.9, 1.0, 0.4]),
         Hero(name: "劫", type: "刺客", origin: "德玛西亚", image: "zed", favorite: false, range: 150, mv: 0.70, description: "劫的详细介绍", rate: "0", heroStrength: [0.5, 0.6, 0.9, 1.0, 0.4])]
}

