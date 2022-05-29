//
//  ThirdViewController.swift
//  GitTestGame
//
//  Created by Yosha Kun on 29.05.2022.
//

import UIKit

class ThirdViewController: UIViewController {

    private var tirdView: ThirdView { view as! ThirdView }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view = ThirdView(frame: CGRect.zero)
        
    }
}
