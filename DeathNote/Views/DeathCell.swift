//
//  DeathCell.swift
//  DeathNote
//
//  Created by Alexandre LEGENT on 13/11/2017.
//  Copyright © 2017 Alexandre Legent. All rights reserved.
//

import UIKit

class DeathCell: UITableViewCell {
	let formatter: DateFormatter = {
		let formatter = DateFormatter()
		formatter.locale = Locale(identifier: "fr_FR")
		formatter.setLocalizedDateFormatFromTemplate("dd MMM YYYY")
		return formatter
	}()
	
	var death: Death? {
		didSet {
			guard let death = death else { return }
			name.text = death.name
			date.text = formatter.string(from: death.date)
			deathscription.text = death.deathscription
			
			guard let image = death.image else { return }
			picture.image = image
		}
	}
	
	let picture: UIImageView = {
		let image = UIImage(named: "UserIcon")
		let view = UIImageView(image: image)
		view.translatesAutoresizingMaskIntoConstraints = false
		view.layer.cornerRadius = 25
		view.clipsToBounds = true
		view.contentMode = .scaleAspectFill
		return view
	}()
	
	let name: UILabel = {
		let label = UILabel()
		label.translatesAutoresizingMaskIntoConstraints = false
		label.textColor = .white
		label.font = .systemFont(ofSize: 20)
		return label
	}()
	
	let date: UILabel = {
		let label = UILabel()
		label.translatesAutoresizingMaskIntoConstraints = false
		label.textColor = .gray
		label.font = .systemFont(ofSize: 18)
		return label
	}()
	
	let deathscription: UITextView = {
		let text = UITextView()
		text.translatesAutoresizingMaskIntoConstraints = false
		text.isSelectable = false
		text.isScrollEnabled = false
		text.isEditable = false
        text.isUserInteractionEnabled = false
		text.font = .systemFont(ofSize: 16)
		text.textColor = .white
		text.backgroundColor = .clear
		return text
	}()
	
	let bottomBorder: UIView = {
		let view = UIView()
		view.translatesAutoresizingMaskIntoConstraints = false
		view.backgroundColor = .gray
		return view
	}()
	
	override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
		super.init(style: style, reuseIdentifier: reuseIdentifier)
		backgroundColor = .clear
		setupViews()
		setupLayouts()
	}
	
	private func setupViews() {
		addSubview(picture)
		addSubview(name)
		addSubview(date)
		addSubview(deathscription)
		addSubview(bottomBorder)
	}
	
	private func setupLayouts() {
		_ = picture.constraint(dimension: .height, constant: 50)
		_ = picture.constraint(dimension: .width, constant: 50)
		_ = picture.constraint(.top, to: self, constant: 5)
		_ = picture.constraint(.leading, to: self, constant: 5)
		
		_ = name.constraint(.leading, to: picture, .trailing, constant: 5)
		_ = name.constraint(.trailing, to: self, constant: 5)
		_ = name.constraint(.top, to: self, constant: 5)
		
		_ = date.constraint(.leading, to: name)
		_ = date.constraint(.trailing, to: name)
		_ = date.constraint(.top, to: name, .bottom, constant: 5)
		
		_ = deathscription.constraint(.top, to: picture, .bottom)
		_ = deathscription.fill(.horizontaly, self, constant: 5)
		
		_ = bottomBorder.constraint(.bottom, to: self)
		_ = bottomBorder.constraint(dimension: .height, constant: 0.5)
		_ = bottomBorder.fill(.horizontaly, self)
	}
	
	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
}
