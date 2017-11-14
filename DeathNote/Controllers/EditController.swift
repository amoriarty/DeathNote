//
//  EditController.swift
//  DeathNote
//
//  Created by Alexandre LEGENT on 14/11/2017.
//  Copyright © 2017 Alexandre Legent. All rights reserved.
//

import UIKit

protocol EditDelegate: class {
	func didSave(_ death: Death)
	func didReplace(_ death: Death, by edit: Death)
	func shouldPopView()
}

class EditController: UIViewController, UITextFieldDelegate {
	private let cellId = "cellId"
	weak var delegate: EditDelegate?
	let name = NameField()
	let datePicker = DatePicker()
	let deathscription = DeathscriptionField()
	var death: Death? {
		didSet {
			guard let death = death else {
				title = "Add Note"
				name.field.text = ""
				datePicker.picker.date = Date()
				deathscription.field.text = ""
				return
			}
			
			title = death.name
			name.field.text = death.name
			datePicker.picker.date = death.date
			deathscription.field.text = death.deathscription
		}
	}
	
	var editDeath: Death? {
		guard let name = name.field.text, name != "" else { return nil }
		guard let deathscription = deathscription.field.text, deathscription != "" else { return nil }
		return Death(name: name, date: datePicker.picker.date, deathscription: deathscription, image: death?.image)
	}
	
	override func viewDidLoad() {
		super.viewDidLoad()
		view.addSubview(name)
		view.addSubview(datePicker)
		view.addSubview(deathscription)
		name.field.delegate = self
		setupLayouts()
		navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(toggleDone))
	}
	
	private func setupLayouts() {
		_ = name.constraint(.top, to: view, constant: 5)
		_ = name.fill(.horizontaly, view)
		_ = datePicker.constraint(.top, to: name, .bottom, constant: 5)
		_ = datePicker.fill(.horizontaly, view)
		_ = deathscription.constraint(.top, to: datePicker, .bottom, constant: 5)
		_ = deathscription.constraint(.bottom, to: view)
		_ = deathscription.fill(.horizontaly, view)
	}
	
	@objc func toggleDone() {
		guard let editDeath = editDeath else {
			delegate?.shouldPopView()
			return
		}
		guard let death = death else {
			delegate?.didSave(editDeath)
			delegate?.shouldPopView()
			return
		}
		
		if editDeath != death {
			delegate?.didReplace(death, by: editDeath)
		}
		delegate?.shouldPopView()
	}
	
	func textFieldShouldReturn(_ textField: UITextField) -> Bool {
		textField.resignFirstResponder()
		return true
	}
}
