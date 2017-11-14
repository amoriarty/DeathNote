//
//  DeathscriptionField.swift
//  DeathNote
//
//  Created by Alexandre LEGENT on 14/11/2017.
//  Copyright © 2017 Alexandre Legent. All rights reserved.
//

import UIKit

class DeathscriptionField: UIView {
	let label: UILabel = {
		let label = UILabel()
		label.translatesAutoresizingMaskIntoConstraints = false
		label.text = "Deathscription"
		label.textColor = .white
		label.font = .systemFont(ofSize: 22)
		return label
	}()
	
	let field: UITextView = {
		let field = UITextView()
		field.translatesAutoresizingMaskIntoConstraints = false
		field.backgroundColor = .clear
		field.layer.borderColor = UIColor.white.cgColor
		field.layer.borderWidth = 1
		field.textColor = .white
		field.tintColor = .white
		field.font = .systemFont(ofSize: 16)
		return field
	}()
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		translatesAutoresizingMaskIntoConstraints = false
		addSubview(label)
		addSubview(field)
		setupLayouts()
	}
	
	private func setupLayouts() {
		_ = label.constraint(.top, to: self)
		_ = label.fill(.horizontaly, self, constant: 10)
		_ = field.constraint(.top, to: label, .bottom, constant: 5)
		_ = field.constraint(.bottom, to: self, constant: 5)
		_ = field.fill(.horizontaly, label)
	}
	
	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
}
