//
//  MainController.swift
//  DeathNote
//
//  Created by Alexandre LEGENT on 13/11/2017.
//  Copyright © 2017 Alexandre Legent. All rights reserved.
//

import UIKit

class MainController: UIViewController {
	override var preferredStatusBarStyle: UIStatusBarStyle {
		return .lightContent
	}
	
	let controller: UINavigationController = {
		let rootController = ListController()
		let controller = UINavigationController(rootViewController: rootController)
		controller.view.translatesAutoresizingMaskIntoConstraints = false
		return controller
	}()
	
	override func viewDidLoad() {
		super.viewDidLoad()
		view.addSubview(controller.view)
		setupLayouts()
	}
	
	private func setupLayouts() {
		controller.view.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
		controller.view.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
		controller.view.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
		controller.view.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
	}
}

