//
//  CatFailViewController.swift
//  MeowBox
//
//  Created by 김예은 on 2018. 7. 13..
//  Copyright © 2018년 yeen. All rights reserved.
//

import UIKit

class CatFailViewController: UIViewController {

    
    @IBOutlet weak var popView: UIView!
    @IBOutlet weak var closeBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        showAnimate()
        
        popView.layer.cornerRadius = 5
        
        closeBtn.clipsToBounds = true
        closeBtn.layer.cornerRadius = 5
        closeBtn.layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMinXMaxYCorner]
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
    
    @IBAction func closeAction(_ sender: Any) {
        
        removeAnimate()
    }

}
