//
//  File.swift
//  
//
//  Created by Dmitry Bespalov on 22.07.22.
//

import UIKit

class CustomView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        load()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        load()
    }

    func load() {
        let nib = UINib(nibName: String(describing: type(of: self)), bundle: Bundle.module)
            // NOTE: `bundle` must be module, and not a bundle for the class CustomView - otherwise the app's main
            // bundle is returned
        let roots = nib.instantiate(withOwner: self)
        let root = roots[0] as! UIView
        root.frame = self.bounds
        root.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        addSubview(root)
    }
}
