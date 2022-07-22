//
//  ViewController.swift
//  MoudlarApp
//
//  Created by Dmitry Bespalov on 22.07.22.
//

import UIKit
import Passcode
import CommonUI

class ViewController: UIViewController {
    @IBOutlet weak var moduleImageView: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
        moduleImageView.image = UIImage(named: "OvalRandomIcon", in: .commonUI, compatibleWith: nil)
    }

    @IBAction func openPasscode(_ sender: Any) {
        let passcodeVC = PasscodeViewController()
        passcodeVC.completion = { [unowned self] in
            dismiss(animated: true)
        }
        present(passcodeVC, animated: true)
    }

}
