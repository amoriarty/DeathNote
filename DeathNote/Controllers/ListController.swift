//
//  ListController.swift
//  DeathNote
//
//  Created by Alexandre LEGENT on 13/11/2017.
//  Copyright © 2017 Alexandre Legent. All rights reserved.
//

import UIKit

class ListController: UITableViewController {
	private let editController = EditController()
	private let cellId = "cellId"
	let deaths: [Death] = [
		Death(name: "Kenny", date: Date(timeIntervalSinceNow: 0), deathscription: "Tuer par des aliens.", image: UIImage(named: "KennyZombie")),
		Death(name: "Kenny", date: Date(timeIntervalSinceNow: 0), deathscription: "Explosé.", image: UIImage(named: "KennyZombie")),
		Death(name: "Kenny", date: Date(timeIntervalSinceNow: 0), deathscription: "́Ecrasé par la voiture de l'officier Barbrady.", image: UIImage(named: "KennyZombie")),
		Death(name: "Kenny", date: Date(timeIntervalSinceNow: 0), deathscription: "Tuer par des aliens.\nExplosé.\nEcrasé par la voiture de l'officier Barbrady.\nDécapité par Kyle.", image: UIImage(named: "KennyZombie"))
	]
	
	override func viewDidLoad() {
		super.viewDidLoad()
		title = "Death Note"
		setupTableView()
		setupNavigationBar()
	}
	
	private func setupTableView() {
		tableView.backgroundColor = .clear
		tableView.register(DeathCell.self, forCellReuseIdentifier: cellId)
		tableView.separatorStyle = .none
	}
	
	private func setupNavigationBar() {
		navigationController?.navigationBar.tintColor = .white
		navigationController?.navigationBar.barStyle = .black
		navigationController?.navigationBar.barTintColor = .black
		navigationController?.navigationBar.isTranslucent = false
		navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(toggleAdd))
	}
	
	@objc func toggleAdd() {
		editController.death = nil
		navigationController?.pushViewController(editController, animated: true)
	}
	
	override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return deaths.count
	}
	
	override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: cellId) as! DeathCell
		cell.death = deaths[indexPath.item]
		return cell
	}
	
	override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
		let death = deaths[indexPath.item]
		let size = CGSize(width: tableView.frame.width, height: 10000)
		let estimatedFrame = NSString(string: death.deathscription).boundingRect(with: size, options: .usesLineFragmentOrigin, attributes: [.font: UIFont.systemFont(ofSize: 16)], context: nil)

		return estimatedFrame.height + 67
	}
	
	override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		editController.death = deaths[indexPath.item]
		navigationController?.pushViewController(editController, animated: true)
	}
}
