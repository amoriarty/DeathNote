//
//  NameField.swift
//  DeathNote
//
//  Created by Alexandre LEGENT on 14/11/2017.
//  Copyright © 2017 Alexandre Legent. All rights reserved.
//

import UIKit

class NameField: UIView {
	let label: UILabel = {
		let label = UILabel()
		label.translatesAutoresizingMaskIntoConstraints = false
		label.text = "Name"
		label.textColor = .white
		label.font = .systemFont(ofSize: 22)
		return label
	}()
	
	let field: UITextField = {
		let field = UITextField()
		field.translatesAutoresizingMaskIntoConstraints = false
		field.tintColor = .white
		field.textColor = .white
		field.font = .systemFont(ofSize: 20)
		field.autocorrectionType = .no
		field.autocapitalizationType = .words
		field.returnKeyType = .done
		return field
	}()
	
	let bottomBorder: UIView = {
		let border = UIView()
		border.translatesAutoresizingMaskIntoConstraints = false
		border.backgroundColor = .gray
		return border
	}()
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		translatesAutoresizingMaskIntoConstraints = false
		addSubview(label)
		addSubview(field)
		addSubview(bottomBorder)
		setupLayouts()
	}
	
	private func setupLayouts() {
		_ = label.constraint(.leading, to: self, constant: 10)
		_ = label.constraint(dimension: .width, constant: 75)
		_ = label.fill(.verticaly, self)
		_ = field.constraint(.leading, to: label, .trailing, constant: 2)
		_ = field.constraint(.trailing, to: self, constant: 10)
		_ = field.fill(.verticaly, self)
		_ = bottomBorder.constraint(.bottom, to: field)
		_ = bottomBorder.constraint(dimension: .height, constant: 1.5)
		_ = bottomBorder.fill(.horizontaly, field)
	}
	
	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
}
