//
//  LogoutPopUpViewController.swift
//  MeowBox
//
//  Created by 김예은 on 2018. 7. 4..
//  Copyright © 2018년 yeen. All rights reserved.
//

import UIKit

class LogoutPopUpViewController: UIViewController {

    @IBOutlet weak var logoutTextView: UITextView!
    @IBOutlet weak var logoutView: UIView!
    @IBOutlet weak var logoutCloseBtn: UIButton!
    @IBOutlet weak var logoutOkBtn: UIButton!
    
    let userDefault = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.showAnimate()
        
        logoutTextView.text = "정말 로그아웃 하시나요?\n정말인가요?"
        
        logoutView.layer.cornerRadius = 5
        
        logoutCloseBtn.clipsToBounds = true
        logoutCloseBtn.layer.cornerRadius = 5
        logoutCloseBtn.layer.maskedCorners = [.layerMinXMaxYCorner]
        
        logoutOkBtn.clipsToBounds = true
        logoutOkBtn.layer.cornerRadius = 5
        logoutOkBtn.layer.maskedCorners = [.layerMaxXMaxYCorner]

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func showAnimate()
    {
        self.view.transform = CGAffineTransform(scaleX: 1.3, y: 1.3)
        self.view.alpha = 0.0;
        UIView.animate(withDuration: 0.25, animations: {
            self.view.alpha = 1.0
            self.view.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
        });
    }
    
    func removeAnimate()
    {
        UIView.animate(withDuration: 0.25, animations: {
            self.view.transform = CGAffineTransform(scaleX: 1.3, y: 1.3)
            self.view.alpha = 0.0;
        }, completion:{(finished : Bool)  in
            if (finished)
            {
                self.view.removeFromSuperview()
            }
        });
    }
    
    
    //MARK: 취소하기 액션
    @IBAction func closeAction(_ sender: Any) {
        self.removeAnimate()
    }
    
    //MARK: 확인하기 액션
    //TODO: 로그아웃 통신
    @IBAction func okAction(_ sender: Any) {
        userDefault.set("", forKey: "token")
        
        let successPopup = UIStoryboard(name: "MyPage", bundle: nil).instantiateViewController(withIdentifier: LogoutSucessPopUpViewController.reuseIdentifier) as! LogoutSucessPopUpViewController
        
        self.addChildViewController(successPopup)
        successPopup.view.frame = self.view.frame
        self.view.addSubview(successPopup.view)
        
        successPopup.didMove(toParentViewController: self)
    }
    
    

}
