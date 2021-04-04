//
//  CheckboxView.swift
//  GenericCheckBoxDemo
//
//  Created by Rahul Bandal on 06/12/20.
//  Copyright © 2020 Rahul Bandal. All rights reserved.
//

import UIKit

enum CheckBoxState {
    case Checked
    case Unchecked
}

class CheckboxView: UIView {
    // MARK: - Properties
    var checkBoxState = CheckBoxState.Unchecked
    var viewFromNib: CheckboxView!
    
    // MARK: - IBOutlet
    @IBOutlet weak var checkImageBGView: UIView!
    @IBOutlet weak var checkImageView: UIImageView! {
        didSet {
            updateCheckBoxView()
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonSetup()
    }
    
    required init(coder aCoder: NSCoder) {
        super.init(coder: aCoder)!
        if self.subviews.count == 0 {
            commonSetup()
        }
    }

    private func commonSetup() {
        viewFromNib = instanceFromNib()
        viewFromNib.frame = bounds
        addSubview(viewFromNib)
    }
    
    private func instanceFromNib() -> CheckboxView {
        viewFromNib = Bundle.main.loadNibNamed("CheckboxView", owner: self, options: nil)?[0] as? CheckboxView
        viewFromNib.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        viewFromNib.frame = bounds
        return viewFromNib
    }
    
    func updateCheckBoxView() {
        if checkBoxState == .Checked {
            checkImageView.isHidden = false
            checkImageBGView.backgroundColor = UIColor.white
            checkImageBGView.layer.borderColor = UIColor.lightGray.cgColor
            checkImageBGView.layer.borderWidth = 1
            let image = UIImage.init(named: "tick")
            checkImageView.image = image
        } else {
            checkImageView.isHidden = true
            checkImageView.image = nil
            checkImageBGView.backgroundColor = UIColor.white
            checkImageBGView.layer.borderColor = UIColor.lightGray.cgColor
            checkImageBGView.layer.borderWidth = 1
            let image = UIImage.init(named: "")
            checkImageView.image = image
        }
        checkImageBGView.layer.cornerRadius = 0.0
    }
    
    @IBAction func didTapOnButton(_ sender: UIButton) {
        if checkBoxState == .Checked {
            checkBoxState = .Unchecked
        } else {
            checkBoxState = .Checked
        }
        updateCheckBoxView()
    }

}
