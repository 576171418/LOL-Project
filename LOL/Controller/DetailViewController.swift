//
//  DetailViewController.swift
//  LOL
//
//  Created by fsc on 2019/3/9.
//  Copyright © 2019 fsc. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var backgroundImage: UIImageView!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var rateButton: UIButton!
    
    var hero: Hero!
    var newbackgroundImage: UIImage?
    
    //headerView用来存放TableHeaderView的ImageView
    var headerView: UIView!
    
    @IBAction func rateButtonAction(_ sender: UIButton) {
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        if hero.image == "" {
            backgroundImage.image = newbackgroundImage
        } else {
            backgroundImage.image = UIImage(named: hero.image)
        }
        
        //取消导航控制条大标题显示
        navigationItem.largeTitleDisplayMode = .never
        
        //将tableHeaderView赋值给headerView
        headerView = tableView.tableHeaderView
        //将headerView置为空，然后将headerView作为tableView的子View加入
        tableView.tableHeaderView = nil
        tableView.addSubview(headerView)
        
        //将TableView向下偏移300，即向下偏移headerView的高度
        tableView.contentInset = UIEdgeInsets(top: 300, left: 0, bottom: 0, right: 0)
        
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        //获取UITableView的偏移量，初始偏移量为300，即offsetY = -300
        let offsetY = scrollView.contentOffset.y
        //下移是负值，上移是正值
        print("纵向位移：", offsetY)
        
        //因为UITablView向下偏移了300，所以为了让headerView置顶显示，即相对TableView向上偏移300
        headerView.frame = CGRect(x: 0, y: offsetY, width: scrollView.bounds.width, height: -offsetY)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 6
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "DetailCell", for: indexPath) as! DetailCell
        
        switch indexPath.row {
        case 0:
            cell.keyLabel.text = "名称:"
            cell.valueLabel.text = hero.name
        case 1:
            cell.keyLabel.text = "类型:"
            cell.valueLabel.text = hero.type
        case 2:
            cell.keyLabel.text = "起源地:"
            cell.valueLabel.text = hero.origin
        case 3:
            cell.keyLabel.text = "射程:"
            cell.valueLabel.text = hero.range.description
        case 4:
            cell.keyLabel.text = "攻速:"
            cell.valueLabel.text = hero.mv.description
        default:
            cell.keyLabel.isHidden = true
            cell.valueLabel.text = hero.description
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        if indexPath.row == 3 {
            let heroStrengthVC = self.storyboard?.instantiateViewController(withIdentifier: "HeroStrengthViewController") as! HeroStrengthViewController
            heroStrengthVC.hero = self.hero
            self.show(heroStrengthVC, sender: nil)
        }
    }
    
    
    @IBAction func backToDetail(segue: UIStoryboardSegue) {
        if let rating = segue.identifier {
            hero.rate = rating
            rateButton.setTitle("打分: \(hero.rate)星", for: .normal)
        }
    }
    
}
