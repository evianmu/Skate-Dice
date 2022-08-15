//
//  GrindView.swift
//  Skate Dice
//
//  Created by Evan Tuazon on 11/30/20.
//  Copyright © 2020 Evan Tuazon. All rights reserved.
//

import Foundation

import SwiftUI

struct GrindView: View
{
	@State private var stanceOutcome = ""
	@State private var spinOutcome = ""
	@State private var grindOutcome = ""
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
					
					Text("Grinds")
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
								
								Text(grindOutcome)
									.foregroundColor(.white)
								
						}
						ZStack
							{
								Image("ejay background")

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
						
						self.message = "Shake to Roll Dice"
						
						self.rollStanceDice()
						self.rollSpinDice()
						self.rollGrindDice()
						
						
						self.message = ""
						
						self.message = "Shake to Roll Dice"
						
						
				}
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
	
	@discardableResult func rollGrindDice() -> String
	{
		let grind = ["50-50", "5-0", "Nose Grind", "Nose Slide", "Tail Slide", "Blunt Slide", "Nose Blunt Slide", "Feeble", "Smith", "Crooked Grind"]
		
		let randomGrind = grind.randomElement()
		
		grindOutcome = randomGrind!
		
		return randomGrind!
	}

}


struct GrindView_Previews: PreviewProvider {
	static var previews: some View {
		GrindView()
	}
}
