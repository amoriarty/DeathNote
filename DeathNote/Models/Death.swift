//
//  Death.swift
//  DeathNote
//
//  Created by Alexandre LEGENT on 13/11/2017.
//  Copyright © 2017 Alexandre Legent. All rights reserved.
//

import UIKit

struct Death {
	let name: String
	let date: Date
	let deathscription: String
	let image: UIImage?
}

func ==(left: Death, right: Death) -> Bool {
	guard left.name == right.name else { return false }
	guard left.date == right.date else { return false }
	guard left.deathscription == left.deathscription else { return false }
	return true
}

func !=(left: Death, right: Death) -> Bool {
	return !(left == right)
}
