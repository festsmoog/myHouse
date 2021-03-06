//
//  HomeViewController.swift
//  myHouse
//
//  Created by Valera Petin on 06.02.17.
//  Copyright © 2017 Valery Petin. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    
    @IBOutlet weak var menuButton: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
            //Кнопка назад без названия
            self.navigationItem.backBarButtonItem = UIBarButtonItem(title:"", style:.plain, target:nil, action:nil)
        
            //слайд-меню
            menuButton.target = revealViewController()
            menuButton.action = Selector(("revealToggle:"))
        
            //свайп слева на право
            view.addGestureRecognizer(revealViewController().panGestureRecognizer())
        
        }
 
}
