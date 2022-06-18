//
//  DetailEditView.swift
//  Scrumdinger
//
//  Created by George Mapaya on 2022-06-18.
//

import SwiftUI

struct DetailEditView: View {
    @State private var data = DailyScrum.Data()
    @State private var newAttendeeName = ""
    
    var body: some View {
        Form {
            Section("Meeting Info") {
                TextField("Title", text: $data.title)
                HStack {
                    Slider(value: $data.lengthInMinutes, in: 5...30, step: 1) {
                        Text("Length")
                    }
                    .accessibilityValue("\(Int(data.lengthInMinutes)) minutes")
                    Spacer()
                    Text("\(Int(data.lengthInMinutes)) minutes")
                        .accessibilityHidden(true)
                }
            }
            
            Section("Attendees") {
                ForEach(data.attendees) { attendee in
                    Text(attendee.name)
                }
                .onDelete { indexSet in
                    data.attendees.remove(atOffsets: indexSet)
                }
                HStack {
                    TextField("Attendee name", text: $newAttendeeName)
                    Button {
                        withAnimation {
                            let attendee = DailyScrum.Attendee(name: newAttendeeName)
                            data.attendees.append(attendee)
                            newAttendeeName = ""
                        }
                    } label: {
                        Label("Add New Attendee", systemImage: "plus.circle.fill")
                            .labelStyle(.iconOnly)
                    }
                    .disabled(newAttendeeName.isEmpty)
                }
            }
        }
    }
}

struct DetailEditView_Previews: PreviewProvider {
    static var previews: some View {
        DetailEditView()
    }
}
