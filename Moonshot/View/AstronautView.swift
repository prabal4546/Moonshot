//
//  AstronautView.swift
//  Moonshot
//
//  Created by PRABALJIT WALIA     on 07/10/20.
//

import SwiftUI

struct AstronautView: View {
    
    let astronaut:Astronaut
    
    var body: some View {
        GeometryReader{geometry in
            ScrollView(.vertical){
                VStack{
                    //Image of the astronauts w.r.t id as mentioned in astroauts.json file
                    Image(self.astronaut.id)
                        .resizable()
                        .scaledToFit()
                        .frame(width: geometry.size.width)
                    //text description
                    Text(self.astronaut.description)
                        .padding()
                }
            }
        }
        .navigationBarTitle(Text(astronaut.name), displayMode: .inline)
    }
}

struct AstronautView_Previews: PreviewProvider {
    static let astronauts: [Astronaut] = Bundle.main.decode("astronauts.json")

    static var previews: some View {
                
        AstronautView(astronaut: astronauts[0])

    }
}
