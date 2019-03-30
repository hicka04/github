//
//  LanguageTextField.swift
//  github
//
//  Created by hicka04 on 2019/03/23.
//  Copyright © 2019 hicka04. All rights reserved.
//

import UIKit
import entity

class LanguageTextField: UITextField {

    private lazy var languagePickerView: LanguagePickerView = {
        let languagePickerView = LanguagePickerView()
        languagePickerView.languagePickerViewDelegate = self
        return languagePickerView
    }()
    
    private var selectedLanguage: SearchLanguage = .any {
        didSet {
            languagePickerView.selectRow(selectedLanguage.index, inComponent: 0, animated: false)
            text = selectedLanguage.title
        }
    }
    private var selectingLanguage: SearchLanguage = .any
    
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
                self.cancelButtonClickedHandler?(self)
            },
            UIBarButtonItem(barButtonSystemItem: .done) { _ in
                self.resignFirstResponder()
                self.selectedLanguage = self.selectingLanguage
                self.doneButtonClickedHandler?(self, self.selectedLanguage)
            }
        ], animated: true)
        inputAccessoryView = toolbar
    }
    
    func set(language: Language?) {
        selectedLanguage = SearchLanguage(language: language)
    }
    
    // Event Handlers
    private var didBeginSelectingHandler: ((LanguageTextField) -> Void)?
    func didBeginSelecting(handler: @escaping (LanguageTextField) -> Void) {
        didBeginSelectingHandler = handler
    }
    
    private var doneButtonClickedHandler: ((LanguageTextField, SearchLanguage) -> Void)?
    func doneButtonClicked(handler: @escaping (LanguageTextField, SearchLanguage) -> Void) {
        doneButtonClickedHandler = handler
    }
    
    private var cancelButtonClickedHandler: ((LanguageTextField) -> Void)?
    func cancelButtonClicked(handler: @escaping (LanguageTextField) -> Void) {
        cancelButtonClickedHandler = handler
    }
}

extension LanguageTextField: UITextFieldDelegate {
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        didBeginSelectingHandler?(self)
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if isFirstResponder {
            resignFirstResponder()
        }
        self.selectedLanguage = SearchLanguage(language: self.selectedLanguage.language)
    }
}

extension LanguageTextField: LanguagePickerViewDelegate {
    
    func languagePickerView(_ pickerView: LanguagePickerView, didSelectLanguage language: SearchLanguage) {
        selectingLanguage = language
    }
}
