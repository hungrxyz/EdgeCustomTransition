//
//  ViewController.swift
//  EdgeCustomTransition
//
//  Created by Zel Marko on 11/16/16.
//  Copyright © 2016 Zel Marko. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view, typically from a nib.
	}

	@IBAction func leftTapped(_ sender: Any) {
		let vc = ViewController(nibName: String(describing: ViewController.self), bundle: nil)
		vc.view.backgroundColor = .yellow
		self.present(vc, animated: true, completion: nil)
	}
	
	@IBAction func rightTapped(_ sender: Any) {
		let vc = ViewController(nibName: String(describing: ViewController.self), bundle: nil)
		vc.view.backgroundColor = .green
		self.present(vc, animated: true, completion: nil)
	}
	
	@IBAction func dismissTapped(_ sender: Any) {
		self.dismiss(animated: true, completion: nil)
	}
	
	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}


}

