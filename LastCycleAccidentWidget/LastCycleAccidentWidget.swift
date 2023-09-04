//
//  LastCycleAccidentWidget.swift
//  LastCycleAccidentWidget
//
//  Created by Zdenko Čepan on 28/08/2023.
//

import WidgetKit
import SwiftUI
import Intents

struct Provider: IntentTimelineProvider {
    func placeholder(in context: Context) -> AccidentEntry {
        AccidentEntry(date: Date(), accident: 4)
    }

    func getSnapshot(for configuration: ConfigurationIntent, in context: Context, completion: @escaping (AccidentEntry) -> ()) {
        let entry = AccidentEntry(date: Date(), accident: 4)
        completion(entry)
    }

    func getTimeline(for configuration: ConfigurationIntent, in context: Context, completion: @escaping (Timeline<Entry>) -> ()) {
        let date = Date()
        let entry: AccidentEntry = AccidentEntry(date: date, accident: 4)
        
        let timeline = Timeline(entries: [entry], policy: .atEnd)
        completion(timeline)
    }
}

struct AccidentEntry: TimelineEntry {
    let date: Date
    let accident: Int
    //let configuration: ConfigurationIntent
    // How Can I import or only use here code from my other files?
}

struct LastCycleAccidentWidgetEntryView : View {
    var entry: Provider.Entry

    var body: some View {
        Text(entry.date, style: .time)
    }
}

struct LastCycleAccidentWidget: Widget {
    let kind: String = "LastCycleAccidentWidget"

    var body: some WidgetConfiguration {
        IntentConfiguration(kind: kind, intent: ConfigurationIntent.self, provider: Provider()) { entry in
            LastCycleAccidentWidgetEntryView(entry: entry)
        }
        .configurationDisplayName("My Widget")
        .description("This is an example widget.")
    }
}

struct LastCycleAccidentWidget_Previews: PreviewProvider {
    static var previews: some View {
        LastCycleAccidentWidgetEntryView(entry: AccidentEntry(date: Date(), accident: 4))
            .previewContext(WidgetPreviewContext(family: .systemSmall))
    }
}
