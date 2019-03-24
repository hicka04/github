//
//  LanguageTextField.swift
//  github
//
//  Created by hicka04 on 2019/03/23.
//  Copyright © 2019 hicka04. All rights reserved.
//

import UIKit

protocol LanguageTextFieldDelegate: AnyObject {
    
    func languageTextFieldDidBeginSelecting(_ textField: LanguageTextField)
    func languageTextFieldDidPushDoneButton(_ textField: LanguageTextField, selectedLanguage: SearchLanguage)
    func languageTextFieldDidPushCancelButton(_ textField: LanguageTextField)
}

class LanguageTextField: UITextField {
    
    private lazy var languagePickerView: LanguagePickerView = {
        let languagePickerView = LanguagePickerView()
        languagePickerView.languagePickerViewDelegate = self
        return languagePickerView
    }()
    
    private var selectedLanguage: SearchLanguage = .any
    
    weak var languageTextFieldDelegate: LanguageTextFieldDelegate?
    
    override func caretRect(for position: UITextPosition) -> CGRect {
        return .zero
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        initViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        initViews()
    }
    
    private func initViews() {
        delegate = self
        
        text = selectedLanguage.title
        
        inputView = languagePickerView
        
        let toolbar = UIToolbar(frame: CGRect(x: 0, y: 0, width: 0, height: 44))
        toolbar.setItems([
            UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil),
            UIBarButtonItem(barButtonSystemItem: .cancel) { _ in
                self.resignFirstResponder()
                self.languageTextFieldDelegate?.languageTextFieldDidPushCancelButton(self)
            },
            UIBarButtonItem(barButtonSystemItem: .done) { _ in
                self.resignFirstResponder()
                self.text = self.selectedLanguage.title
                self.languageTextFieldDelegate?.languageTextFieldDidPushDoneButton(self,
                                                                                   selectedLanguage: self.selectedLanguage)
            }
        ], animated: true)
        inputAccessoryView = toolbar
    }
}

extension LanguageTextField: UITextFieldDelegate {
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        languageTextFieldDelegate?.languageTextFieldDidBeginSelecting(self)
    }
}

extension LanguageTextField: LanguagePickerViewDelegate {
    
    func languagePickerView(_ pickerView: LanguagePickerView, didSelectLanguage language: SearchLanguage) {
        selectedLanguage = language
    }
}
