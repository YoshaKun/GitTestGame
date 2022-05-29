//
//  ViewController.swift
//  GitTestGame
//
//  Created by Yosha Kun on 28.05.2022.
//

import UIKit

class StartViewController: UIViewController {

    private var startView: StartView { view as! StartView }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view = StartView(frame: CGRect.zero)
        
    }
}

