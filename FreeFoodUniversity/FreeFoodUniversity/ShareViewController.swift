//
//  ShareViewController.swift
//  FreeFoodUniversity
//
//  Created by William Sirotkin on 7/16/22.
//

import Foundation
import UIKit

class ViewController: UIViewController {
    
    let authViewController = authUI.authViewController()
    
    func authUI(_ authUI: FUIAuth, didSignInWith user: FIRUser?, error: Error?) {
      // handle user and error as necessary
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func share() {
        let vc = UIActivityViewController(activityItems: ["FreeFoodUGA.com"], applicationActivities: nil)
        vc.popoverPresentationController?.sourceView = self.view
        self.present(vc, animated: true, completion: nil)
    }
}

