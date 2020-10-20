//
//  MissionView.swift
//  Moonshot
//
//  Created by PRABALJIT WALIA     on 06/10/20.
//

import SwiftUI

struct MissionView: View {
    
    struct CrewMember{
        let role:String
        let astronaut:Astronaut
    }
    
    let mission:Mission
    let astronauts:[CrewMember]
    
    var body: some View {
        GeometryReader{geometry in
            ScrollView(.vertical){
                VStack{
                    //chg1
                    Text(self.mission.formattedLaunchDate)
                        .font(.headline)
                        .padding()
                    
                    Image(self.mission.image)
                        .resizable()
                        .scaleEffect()
                        .frame(maxWidth: geometry.size.width * 0.7)
                        .padding(.top)
                    
                    Text(self.mission.description)
                        .padding()
                    
                    ForEach(self.astronauts, id: \.role) { crewMember in
                        NavigationLink(
                            destination: AstronautView( astronaut: crewMember.astronaut)){
                           
                        HStack {
                           // Text(mission.launchDate)
                            Image(crewMember.astronaut.id)
                                .resizable()
                                .frame(width: 83, height: 60)
                                .clipShape(Capsule())
                                .overlay(Capsule().stroke(Color.primary, lineWidth: 1))

                            VStack(alignment:.leading) {
                                Text(crewMember.astronaut.name)
                                    .font(.headline)
                                Text(crewMember.role)
                                    .foregroundColor(.secondary)
                            }

                            Spacer()
                        }
                        .padding(.horizontal)
                    }
                        //to stop the blue color highlighting on the second view by swiftUI
                        .buttonStyle(PlainButtonStyle())
                    }
                    
                    Spacer(minLength: 25)
                }
                
            }
        }
        .navigationBarTitle(Text(mission.displayName),displayMode: .inline)
    }
    //initialising view hierarchy as one mission and assosciated array of astronauts
    init(mission: Mission, astronauts: [Astronaut]) {
        self.mission = mission

        var matches = [CrewMember]()

        for member in mission.crew {
            if let match = astronauts.first(where: { $0.id == member.name }) {
                matches.append(CrewMember(role: member.role, astronaut: match))
            } else {
                fatalError("Missing \(member)")
            }
        }

        self.astronauts = matches
    }
}

struct MissionView_Previews: PreviewProvider {
    static let missions:[Mission] = Bundle.main.decode("missions.json")
    static let astronauts: [Astronaut] = Bundle.main.decode("astronauts.json")

    static var previews: some View {
        
        MissionView(mission: missions[0], astronauts: astronauts)
    }
}
