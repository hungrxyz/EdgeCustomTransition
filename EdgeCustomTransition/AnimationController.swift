//
//  AnimationController.swift
//  EdgeCustomTransition
//
//  Created by Zel Marko on 11/16/16.
//  Copyright © 2016 Zel Marko. All rights reserved.
//

import UIKit

enum TransitionType {
	case presenting
	case dismissing
}

class AnimationController: NSObject, UIViewControllerAnimatedTransitioning {
	var duration: TimeInterval
	var isPresenting: Bool
	var originFrame: CGRect
	
	init(withDuration duration: TimeInterval, forTransitionType type: TransitionType, originFrame: CGRect) {
		self.duration = duration
		self.isPresenting = type == .presenting
		self.originFrame = originFrame
		
		super.init()
	}
	
	func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
		return self.duration
	}
	
	func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
		let containerView = transitionContext.containerView
		
		let fromView = transitionContext.viewController(forKey: UITransitionContextViewControllerKey.from)!.view
		let toView = transitionContext.viewController(forKey: UITransitionContextViewControllerKey.to)!.view
		
		toView?.frame = originFrame
		toView!.transform = CGAffineTransform(translationX: -toView!.bounds.width / 2, y: 0)
		
		toView!.layoutIfNeeded()
		fromView!.layoutIfNeeded()
		
		
		if self.isPresenting {
			containerView.insertSubview(toView!, belowSubview: fromView!)
		} else {
			containerView.addSubview(toView!)
		}
		
		UIView.animateKeyframes(withDuration: self.duration, delay: 0, options: .calculationModeCubic, animations: {
			UIView.addKeyframe(withRelativeStartTime: 0.0, relativeDuration: self.duration / 2, animations: {
				fromView!.transform = CGAffineTransform(translationX: fromView!.bounds.width / 2, y: 0)
			})
			UIView.addKeyframe(withRelativeStartTime: self.duration / 2, relativeDuration: self.duration / 2, animations: {
				containerView.bringSubview(toFront: toView!)
				containerView.layoutSubviews()
				fromView!.transform = CGAffineTransform.identity
				toView!.transform = CGAffineTransform.identity
			})
		}, completion: { _ in
			transitionContext.completeTransition(!transitionContext.transitionWasCancelled)
		})
	}
}
