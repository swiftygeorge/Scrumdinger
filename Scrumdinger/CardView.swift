//
//  CardView.swift
//  Scrumdinger
//
//  Created by George Mapaya on 2022-06-17.
//

import SwiftUI

struct CardView: View {
    let scrum: DailyScrum
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(scrum.title)
                .font(.headline)
                .accessibilityAddTraits(.isHeader)
            Spacer()
            HStack {
                Label("\(scrum.attendees.count)", systemImage: "person.3")
                    .accessibilityLabel("\(scrum.attendees.count) attendees")
                Spacer()
                Label("\(scrum.lengthInMinutes)", systemImage: "clock")
                    .labelStyle(.trailingIcon)
                    .accessibilityLabel("\(scrum.lengthInMinutes) minute meeting")
            }
            .font(.caption)
        }
        .foregroundColor(scrum.theme.accentColor)
        .padding()
            
    }
}

struct CardView_Previews: PreviewProvider {
    static let scrum = DailyScrum.sampleData[0]
    static var previews: some View {
        Group {
            CardView(scrum: scrum)
            CardView(scrum: scrum)
                .preferredColorScheme(.dark)
        }
        .background(scrum.theme.mainColor)
        .previewLayout(.fixed(width: 400, height: 60))
    }
}
