//
//  ViewController.swift
//  PopUpView
//
//  Created by Eryus Developer on 31/07/17.
//  Copyright © 2017 Eryushion Techsol. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var dimView: UIView!
    @IBOutlet weak var closePopUp: UIButton!
    @IBOutlet var InfoView: UIView!
    @IBOutlet weak var infoImage: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.closePopUp.layer.cornerRadius = 20
        self.closePopUp.layer.masksToBounds = true
        Timer.scheduledTimer(timeInterval: 5.0, target: self, selector: #selector(self.dismissAlert), userInfo: nil, repeats: true)
    }
    func dismissAlert(){
        self.InfoView.center = self.view.center
        self.InfoView.transform = CGAffineTransform(scaleX: 0.8, y: 1.2)
        self.view.addSubview(InfoView)
        UIView.animate(withDuration: 0.3, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0, options: [], animations: {
            self.dimView.alpha = 0.8
            self.InfoView.transform = .identity
        })
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func ClosePopUp(_ sender: Any) {
        UIView.animate(withDuration: 0.3, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0, options: [], animations: {
            self.dimView.alpha = 0
            self.InfoView.transform = CGAffineTransform(scaleX: 0.2, y: 0.2)
        }) { (success) in
            self.InfoView.removeFromSuperview()
        }
    }

}

