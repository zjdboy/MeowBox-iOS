//
//  MainBottomViewController.swift
//  MeowBox
//
//  Created by 김예은 on 2018. 7. 7..
//  Copyright © 2018년 yeen. All rights reserved.
//

import UIKit

class MainBottomViewController: UIViewController,UIGestureRecognizerDelegate{

    @IBOutlet weak var closeBtnView: UIView!
    @IBOutlet weak var catCountLabel: UILabel!
    
    @IBOutlet weak var instaProfileImageView: UIImageView!
    @IBOutlet weak var instaProfile2ImageView: UIImageView!
    @IBOutlet weak var instaProfile3ImageView:UIImageView!
    @IBOutlet weak var instaProfile4ImageView: UIImageView!
    
    @IBOutlet weak var idLabel: UILabel!
    @IBOutlet weak var id2Label: UILabel!
    @IBOutlet weak var id3Label: UILabel!
    @IBOutlet weak var id4Label: UILabel!
    
    
    @IBOutlet weak var instaImageView: UIImageView!
    @IBOutlet weak var insta2ImageView: UIImageView!
    @IBOutlet weak var insta3ImageView: UIImageView!
    @IBOutlet weak var insta4ImageView: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        catCountInit()
        instaInit()
        
        //bottomView click litener
        let gesture1 = UITapGestureRecognizer(target: self, action:  #selector(self.closeViewAction))
    
        self.closeBtnView.addGestureRecognizer(gesture1)

        //프로필 이미지 동그랗게
        instaProfileImageView.layer.masksToBounds = true
        instaProfileImageView.layer.cornerRadius = instaProfileImageView.layer.frame.width/2
        instaProfile2ImageView.layer.masksToBounds = true
        instaProfile2ImageView.layer.cornerRadius = instaProfile2ImageView.layer.frame.width/2
        instaProfile3ImageView.layer.masksToBounds = true
        instaProfile3ImageView.layer.cornerRadius = instaProfile3ImageView.layer.frame.width/2
        instaProfile4ImageView.layer.masksToBounds = true
        instaProfile4ImageView.layer.cornerRadius = instaProfile4ImageView.layer.frame.width/2

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: 고양이 수
    func catCountInit() {
        MainService.catCountInit() { (catCountData) in
            self.catCountLabel.text = catCountData.result
            
        }
    }
    
    func instaInit() {
            MainService.instaInit{ (instaData) in
                self.instaProfileImageView.kf.setImage(with: URL(string: instaData[0].profile), placeholder: UIImage())
                self.instaProfile2ImageView.kf.setImage(with: URL(string: instaData[1].profile), placeholder: UIImage())
                self.instaProfile3ImageView.kf.setImage(with: URL(string: instaData[2].profile), placeholder: UIImage())
                self.instaProfile4ImageView.kf.setImage(with: URL(string: instaData[3].profile), placeholder: UIImage())
                
                self.idLabel.text = instaData[0].nickname
                self.id2Label.text = instaData[1].nickname
                self.id3Label.text = instaData[2].nickname
                self.id4Label.text = instaData[3].nickname
                
                self.instaImageView.kf.setImage(with: URL(string: instaData[0].picture), placeholder: UIImage())
                self.insta2ImageView.kf.setImage(with: URL(string: instaData[1].picture), placeholder: UIImage())
                self.insta3ImageView.kf.setImage(with: URL(string: instaData[2].picture), placeholder: UIImage())
                self.insta4ImageView.kf.setImage(with: URL(string: instaData[3].picture), placeholder: UIImage())
                
                print("인스타 성공")

            }
        
    }

    //MARK: bottomView action
    @objc func closeViewAction(sender : UITapGestureRecognizer) {
 
        self.dismiss(animated: true, completion: nil)
    }
}
