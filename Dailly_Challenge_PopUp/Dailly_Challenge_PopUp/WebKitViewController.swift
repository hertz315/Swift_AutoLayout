//
//  WebKitViewController.swift
//  Dailly_Challenge_PopUp
//
//  Created by Hertz on 9/13/22.
//

import UIKit
import WebKit

class WebKitViewController: UIViewController {
    
    @IBOutlet weak var webVIew: WKWebView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    @IBAction func closeButtonTapped(_ sender: UIButton) {
        dismiss(animated: true)
    }
    
}


/*
 // MARK: - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
 // Get the new view controller using segue.destination.
 // Pass the selected object to the new view controller.
 }
 */


