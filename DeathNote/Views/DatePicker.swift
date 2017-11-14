//
//  DatePicker.swift
//  DeathNote
//
//  Created by Alexandre LEGENT on 14/11/2017.
//  Copyright © 2017 Alexandre Legent. All rights reserved.
//

import UIKit

class DatePicker: UIView {
	let label: UILabel = {
		let label = UILabel()
		label.translatesAutoresizingMaskIntoConstraints = false
		label.text = "Date"
		label.textColor = .white
		label.font = .systemFont(ofSize: 22)
		return label
	}()
	
	let picker: UIDatePicker = {
		let picker = UIDatePicker()
		picker.translatesAutoresizingMaskIntoConstraints = false
		picker.datePickerMode = .date
		picker.minimumDate = Date()
		picker.setValue(UIColor.white, forKey: "textColor")
		return picker
	}()
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		translatesAutoresizingMaskIntoConstraints = false
		addSubview(label)
		addSubview(picker)
		_ = label.constraint(.top, to: self)
		_ = label.constraint(.leading, to: self, constant: 10)
		_ = picker.fill(self)
	}
	
	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
}
