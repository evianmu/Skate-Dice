//
//  FlipView.swift
//  Skate Dice
//
//  Created by Evan Tuazon on 11/30/20.
//  Copyright © 2020 Evan Tuazon. All rights reserved.
//

import Foundation

import SwiftUI

struct FlipView: View
{
	@State private var stanceOutcome = ""
	@State private var spinOutcome = ""
	@State private var rotationOutcome = ""
	@State private var flipOutcome = ""
	@State private var message = "Shake to Roll Dice"
	
	var body: some View
	{
		
		VStack
			{
				HStack
				{
					Image("skate dice final done")
						.resizable()
						.frame(width: 60, height: 60)
						.padding()
					
					Text("Flips")
						.font(.largeTitle)
						.fontWeight(.heavy)
						.foregroundColor(.orange)
					.padding()
				}
				
				HStack
					{
						ZStack
							{
								Image("ejay background")
								
								Text(stanceOutcome)
									.foregroundColor(.white)
								
						}
						ZStack
							{
								Image("ejay background")
								
								Text(spinOutcome)
									.foregroundColor(.white)
						}
				}
				
				HStack
					{
						ZStack
							{
								Image("ejay background")
								
								Text(rotationOutcome)
									.foregroundColor(.white)
								
						}
						ZStack
							{
								Image("ejay background")
								
								Text(flipOutcome)
									.foregroundColor(.white)
						}
				}
				
				// 1st implementation of press to roll
				
				/*
				Button(action: {self.rollStanceDice()
				self.rollSpinDice()
				self.rollRotationDice()
				self.rollFlipDice()
				})
				{
				
				Image("rollDiceButton")
				}.buttonStyle(PlainButtonStyle())
				*/
				
				// implement shake
				
				Text(message)
					.onReceive(NotificationCenter.default.publisher(for: .deviceDidShakeNotification)) { _ in
						
						self.rollStanceDice()
						self.rollSpinDice()
						self.rollRotationDice()
						self.rollFlipDice()
						
						
						self.message = ""
						
						self.message = "Shake to Roll Dice"
						
				}.animation(.easeInOut)
					.transition(.slide)
		}
	}
	
	@discardableResult func rollStanceDice() -> String
	{
		let stance = ["Regular", "Switch", "Nollie", "Fakie"]
		
		let randomStance = stance.randomElement()
		
		stanceOutcome = randomStance!
		
		return stanceOutcome
	}
	
	@discardableResult func rollSpinDice() -> String
	{
		let spin = ["Backside", "Frontside", "", "", "", ""]
		
		let randomSpin = spin.randomElement()
		
		spinOutcome = randomSpin!
		
		return randomSpin!
	}
	
	@discardableResult func rollRotationDice() -> String
	{
		let rotation = ["", "180", "360", "180 shove", "360 shove", ""]
		
		let randomRotation = rotation.randomElement()
		
		rotationOutcome = randomRotation!
		
		return randomRotation!
	}
	
	@discardableResult func rollFlipDice() -> String
	{
		let flip = ["Kickflip", "Heelflip", "", "", "", ""]
		
		let randomFlip = flip.randomElement()
		
		flipOutcome = randomFlip!
		
		return randomFlip!
	}
}

// this is set here, applies to the rest of the views.
// need to only declare once
extension NSNotification.Name
{
	public static let deviceDidShakeNotification = NSNotification.Name("MyDeviceDidShakeNotification")
	
}

extension UIWindow
{
	public override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?)
	{
		super.motionEnded(motion, with: event)
		NotificationCenter.default.post(name: .deviceDidShakeNotification, object: event)
	}
}

struct FlipView_Previews: PreviewProvider {
	static var previews: some View {
		FlipView()
	}
}
