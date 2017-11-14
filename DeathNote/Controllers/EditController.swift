//
//  EditController.swift
//  DeathNote
//
//  Created by Alexandre LEGENT on 14/11/2017.
//  Copyright © 2017 Alexandre Legent. All rights reserved.
//

import UIKit

class EditController: UIViewController, UITextFieldDelegate {
	private let cellId = "cellId"
	let name = NameField()
	var death: Death? {
		didSet {
			if let death = death { title = death.name }
			else { title = "Add Note" }
		}
	}
	
	override func viewDidLoad() {
		super.viewDidLoad()
		view.addSubview(name)
		name.field.delegate = self
		_ = name.constraint(.top, to: view, constant: 5)
		_ = name.fill(.horizontaly, view)
	}
	
	func textFieldShouldReturn(_ textField: UITextField) -> Bool {
		textField.resignFirstResponder()
		return true
	}
}
