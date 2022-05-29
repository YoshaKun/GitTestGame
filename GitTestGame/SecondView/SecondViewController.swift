//
//  SecondViewController.swift
//  GitTestGame
//
//  Created by Yosha Kun on 28.05.2022.
//

import UIKit

class SecondViewController: UIViewController {
    
    private var secondView: SecondView { view as! SecondView }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view = SecondView(frame: CGRect.zero)

    }
}
