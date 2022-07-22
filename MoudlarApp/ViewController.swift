//
//  ViewController.swift
//  MoudlarApp
//
//  Created by Dmitry Bespalov on 22.07.22.
//

import UIKit
import Passcode

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func openPasscode(_ sender: Any) {
        let passcodeVC = PasscodeViewController()
        passcodeVC.completion = { [unowned self] in
            dismiss(animated: true)
        }
        present(passcodeVC, animated: true)
    }

}
