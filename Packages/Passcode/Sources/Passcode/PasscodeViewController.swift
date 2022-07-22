//
//  PasscodeViewController.swift
//  
//
//  Created by Dmitry Bespalov on 22.07.22.
//

import UIKit
import CommonUI

public class PasscodeViewController: UIViewController, UITextFieldDelegate {

    public var completion: (() -> Void)?

    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var moduleImageView: UIImageView!
    @IBOutlet weak var importedModuleImageView: UIImageView!

    convenience init() {
        self.init(nibName: nil, bundle: Bundle.module)
    }

    public override func viewDidLoad() {
        super.viewDidLoad()
        importedModuleImageView.image = UIImage(named: "OvalRandomIcon", in: .commonUI, compatibleWith: nil)
        textField.becomeFirstResponder()
    }

    @IBAction func done(_ sender: Any) {
        completion?()
    }

    public func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
