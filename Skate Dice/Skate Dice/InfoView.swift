//
//  InfoView.swift
//  Skate Dice
//
//  Created by Evan Tuazon on 12/10/20.
//  Copyright © 2020 Evan Tuazon. All rights reserved.
//

import Foundation
import SwiftUI

struct InfoView: View
{
	var body: some View
	{
		
		VStack
		{
			VStack
			{
			Text("Skate Dice Instructions")
				.font(.title)
				.fontWeight(.bold)
				.foregroundColor(.orange)
			}
			VStack
			{
				Text("You can either practice alone, or with friends!")
				.padding()
					
				Text("If you are playing with a friend, play rock paper scissors to see who goes first.")
					.fontWeight(.bold)
				.padding()
				
		
				Text("Winner rolls the dice, and tries the trick that is displayed on the screen.")
				.padding()
			
				Text("If he lands the trick, he does not get a letter added to SKATE.")
					.fontWeight(.bold)
				.padding()
				
				Text("The first person to have all the letters in SKATE loses.")
				.padding()
				
				Text("(If some dice are blank, feel free to fill in your own trick.)")
					.padding()
			}
		}
	}
}

struct InfoView_Previews: PreviewProvider {
	static var previews: some View {
		InfoView()
	}
}
