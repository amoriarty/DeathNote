//
//  Placeholder.swift
//  DeathNote
//
//  Created by Alexandre LEGENT on 14/11/2017.
//  Copyright © 2017 Alexandre Legent. All rights reserved.
//

import UIKit

let DEATHS: [Death] = {
	let image = UIImage(named: "KennyZombie")
	let formatter = DateFormatter()
	formatter.locale = Locale(identifier: "en_FR")
	formatter.dateFormat = "dd/MM/yyyy"
	
	return [
		Death(name: "Kenny McCormick", date: formatter.date(from: "13/08/1997")!, deathscription: "Explusé par un vaisseau spatial alien, piétiné par un troupeau de vaches puis écrasé par la voiture de l'officier Barbrady.\nDécapité, puis mangé par des rats.", image: image),
		Death(name: "Kenny McCormick", date: formatter.date(from: "07/10/1998")!, deathscription: "Ozzy Osbourne lui arrache la tête avec les dents pour impressionner la foule lors d'un de ses concerts.", image: image),
		Death(name: "Kenny McCormick", date: formatter.date(from: "16/12/1998")!, deathscription: "Ecrasé par un wagon minier qui déraille dans l'atelier secret des gnomes voleurs de slips.", image: image),
		Death(name: "Kenny McCormick", date: formatter.date(from: "14/04/1999")!, deathscription: "Mort par combustion spontannée a cause d'une restriction de pets.", image: image)
	]
}()
