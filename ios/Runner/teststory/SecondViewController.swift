//
//  SecondViewController.swift
//  Runner
//
//  Created by Rishabh Balani on 30/08/24.
//

import UIKit

class SecondViewController: UIViewController {

    @IBAction func navigateback(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        
        
//        let label = UILabel()
//        label.text = "Welcome to the Second View"
//        label.textAlignment = .center
//        label.frame = view.bounds
//        
//        view.addSubview(label)
    }
}
