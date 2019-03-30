//
//  LanguagePickerView.swift
//  github
//
//  Created by hicka04 on 2019/03/23.
//  Copyright © 2019 hicka04. All rights reserved.
//

import UIKit
import entity

protocol LanguagePickerViewDelegate: AnyObject {
    
    func languagePickerView(_ pickerView: LanguagePickerView, didSelectLanguage language: SearchLanguage)
}

class LanguagePickerView: UIPickerView {
    
    weak var languagePickerViewDelegate: LanguagePickerViewDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        delegate = self
        dataSource = self
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        delegate = self
        dataSource = self
    }
}

extension LanguagePickerView: UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return SearchLanguage.allCases.count
    }
}

extension LanguagePickerView: UIPickerViewDelegate {
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return SearchLanguage.allCases[row].title
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        languagePickerViewDelegate?.languagePickerView(self, didSelectLanguage: SearchLanguage.allCases[row])
    }
}

