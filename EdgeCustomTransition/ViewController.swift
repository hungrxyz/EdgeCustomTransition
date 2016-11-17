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
		vc.transitioningDelegate = self
		self.present(vc, animated: true, completion: nil)
	}
	
	@IBAction func rightTapped(_ sender: Any) {
		let vc = ViewController(nibName: String(describing: ViewController.self), bundle: nil)
		vc.view.backgroundColor = .green
		vc.transitioningDelegate = self
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

extension ViewController: UIViewControllerTransitioningDelegate {
	func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
		return AnimationController(withDuration: 1, forTransitionType: .dismissing, originFrame: UIScreen.main.bounds)
	}
	
	func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
		return AnimationController(withDuration: 1, forTransitionType: .presenting, originFrame: UIScreen.main.bounds)
	}
}

