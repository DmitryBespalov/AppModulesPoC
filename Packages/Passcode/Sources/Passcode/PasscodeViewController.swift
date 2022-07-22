//
//  PasscodeViewController.swift
//  
//
//  Created by Dmitry Bespalov on 22.07.22.
//

import UIKit

public class PasscodeViewController: UIViewController {

    public var completion: (() -> Void)?

    @IBOutlet weak var textField: UITextField!

    convenience init() {
        self.init(nibName: nil, bundle: Bundle.module)
    }

    public override func viewDidLoad() {
        super.viewDidLoad()

        textField.becomeFirstResponder()
    }

    @IBAction func done(_ sender: Any) {
        completion?()
    }

}
