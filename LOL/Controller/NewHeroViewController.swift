//
//  NewHeroViewController.swift
//  LOL
//
//  Created by fsc on 2019/3/10.
//  Copyright © 2019 fsc. All rights reserved.
//

import UIKit
import AVKit
import MobileCoreServices
import AVFoundation

protocol NewHeroDelegate {
    func sendHero(hero: Hero, iamge: UIImage)
}

class NewHeroViewController: UITableViewController, UIPickerViewDelegate, UIPickerViewDataSource, UITextFieldDelegate {
    
    @IBOutlet weak var backgroundImage: UIImageView!
    @IBOutlet weak var playButton: UIButton!
    @IBOutlet weak var nameTF: UITextField!
    @IBOutlet weak var typePickView: UIPickerView!
    @IBOutlet weak var rangeTF: UITextField!
    @IBOutlet weak var rangeStepper: UIStepper!
    @IBOutlet weak var originPcikView: UIPickerView!
    @IBOutlet weak var descriptionTF: UITextField!
    @IBOutlet weak var mvTF: UITextField!
    
    var types = ["射手","辅助","法师","刺客","坦克","战士"]
    var origins = ["德玛西亚","艾欧尼亚","诺克萨斯","祖安","皮尔特沃夫","弗雷尔卓德","比尔吉沃特","暗影岛","怒瑞玛","班德尔城","虚空之地","符文之地"]
    
    @IBAction func tapCancel(_ sender: UIBarButtonItem) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func tapStepper(_ sender: UIStepper) {
        rangeTF.text = Int(sender.value).description
    }
    
    @IBAction func tapSave(_ sender: UIBarButtonItem) {
        if nameTF.text != "" && rangeTF.text != "" && descriptionTF.text != "" {
            hero.name = nameTF.text ?? ""
            hero.mv = Double(mvTF.text ?? "0.50") ?? 0.50
            hero.favorite = false
            hero.description = descriptionTF.text ?? "作者没有输入详细的介绍"
            hero.range = Int(rangeTF.text ?? "500") ?? 500
            self.delegate?.sendHero(hero: hero, iamge: backgroundImage.image!)
            self.navigationController?.popViewController(animated: true)
        } else {
            print("请输入正确的详细信息")
        }
    }
    
    @IBAction func playVideo(_ sender: UIButton) {
        let playerVC = AVPlayerViewController()
        
        playerVC.player = AVPlayer(url: videoUrl)
        
        self.present(playerVC, animated: true) {
            playerVC.player?.play()
        }
    }
    
    var videoUrl: URL!
    
    var hero = Hero()
    var selectedImage = UIImage()
    
    var delegate: NewHeroDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.typePickView.delegate = self
        self.typePickView.dataSource = self
        self.originPcikView.delegate = self
        self.originPcikView.dataSource = self
        self.nameTF.delegate = self
        self.descriptionTF.delegate = self
        self.rangeTF.delegate = self
        self.mvTF.delegate = self
    }
    
    //MARK: - PickerViewDataSource
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        switch pickerView.tag {
        case 11:
            return types.count
        default:
            return origins.count
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        switch pickerView.tag {
        case 11:
            return types[row]
        default:
            return origins[row]
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        //选中pickView某行回调
        switch pickerView.tag {
        case 11:
            hero.type = types[row]
        default:
            hero.origin = origins[row]
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.endEditing(true)
        return true
    }

}

extension NewHeroViewController {
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if indexPath.section == 0 {
            let actionSheet = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
            
            let photoAction = UIAlertAction(title: "照片", style: .default) { (_) in
                guard UIImagePickerController .isSourceTypeAvailable(.photoLibrary) else {
                    return
                }
                let picker = UIImagePickerController()
                picker.sourceType = .photoLibrary
                
                picker.delegate = self
                self.present(picker, animated: true)
            }
            
            let takePhotoAction = UIAlertAction(title: "拍照", style: .default) { (_) in
                guard UIImagePickerController.isSourceTypeAvailable(.camera) else {
                    return
                }
                let take = UIImagePickerController()
                take.sourceType = .camera
                
                take.delegate = self
                self.present(take, animated: true)
            }
            
            let videoAction = UIAlertAction(title: "视频", style: .default) { (_) in
                guard UIImagePickerController.isSourceTypeAvailable(.photoLibrary) else {
                    return
                }
                let video = UIImagePickerController()
                video.sourceType = .photoLibrary
                video.mediaTypes = [kUTTypeMovie as String]
                
                video.delegate = self
                self.present(video, animated: true)
            }
            
            let recordAction = UIAlertAction(title: "拍摄视频", style: .default) { (_) in
                guard UIImagePickerController.isSourceTypeAvailable(.camera) else {
                    return
                }
                let record = UIImagePickerController()
                record.sourceType = .camera
                record.mediaTypes = [kUTTypeMovie as String]
                record.videoQuality = .typeHigh
                record.videoMaximumDuration = 10
                
                record.delegate = self
                self.present(record, animated: true)
            }
            
            let cancekAction = UIAlertAction(title: "取消", style: .cancel)
            
            actionSheet.addAction(photoAction)
            actionSheet.addAction(takePhotoAction)
            actionSheet.addAction(videoAction)
            actionSheet.addAction(recordAction)
            actionSheet.addAction(cancekAction)
            
            self.present(actionSheet, animated: true) {
                
            }
        }
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

extension NewHeroViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let mediaType = info[UIImagePickerController.InfoKey.mediaType] as! String
        
        if mediaType == (kUTTypeMovie as String) {
            videoUrl = info[UIImagePickerController.InfoKey.mediaURL] as? URL
            
            let asset = AVAsset(url: videoUrl)
            
            let gen = AVAssetImageGenerator(asset: asset)
            let time = CMTime(seconds: 0, preferredTimescale: 2)
            let image = try! gen.copyCGImage(at: time, actualTime: nil)
            backgroundImage.image = UIImage(cgImage: image)
            
            playButton.isHidden = false
            
        } else {
            backgroundImage.image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage
        }
        
        picker.dismiss(animated: true, completion: nil)
        
    }
    
}
