//
//  ContentView.swift
//  Skate Dice
//
//  Created by Evan Tuazon on 10/3/20.
//  Copyright © 2020 Evan Tuazon. All rights reserved.
//

import SwiftUI

struct ContentView: View
{
	@State private var selection = 1
	
	var body: some View
	{
		TabView(selection: $selection)
		{
			FlipView()
				.tabItem
				{
					Image(systemName:"square.fill")
					
					Text("Flips")
			}.tag(1)
				.animation(.easeInOut)
				.transition(.slide)
			
			// i didn't grind to get to this view
			GrindView()
				.tabItem
				{
					Image(systemName:"square.fill")
					
					Text("Grinds")
			}.tag(2)
				.animation(.easeInOut)
				.transition(.slide)
			
			
			VertView()
				.tabItem
				{
					Image(systemName: "square.fill")
					
					Text("Vert")
			}.tag(3)
				.animation(.easeInOut)
				.transition(.slide)
			
			InfoView()
				.tabItem
				{
					Image(systemName: "square.fill")
					Text("Info")
				}.tag(4)
				.animation(.easeInOut)
				.transition(.slide)
			}
		.accentColor(.orange)
		.transition(.slide)
	}
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
		Group {
			ContentView()
			ContentView()
		}
    }
}

