//
//  Widget.swift
//  Widget
//
//  Created by UnsafePointers on 11/6/21.
//

import WidgetKit
import SwiftUI
import Intents
import TextSourceKit


struct Provider: IntentTimelineProvider {
  func placeholder(in context: Context) -> SimpleEntry {
    SimpleEntry(date: Date(), configuration: ConfigurationIntent())
  }
  
  func getSnapshot(for configuration: ConfigurationIntent, in context: Context, completion: @escaping (SimpleEntry) -> ()) {
    let entry = SimpleEntry(date: Date(), configuration: configuration)
    completion(entry)
  }
  
  func getTimeline(for configuration: ConfigurationIntent, in context: Context, completion: @escaping (Timeline<Entry>) -> ()) {
    var entries: [SimpleEntry] = []
    
    // Generate a timeline consisting of five entries an hour apart, starting from the current date.
    let currentDate = Date()
    for hourOffset in 0 ..< 5 {
      let entryDate = Calendar.current.date(byAdding: .hour, value: hourOffset, to: currentDate)!
      let entry = SimpleEntry(date: entryDate, configuration: configuration)
      entries.append(entry)
    }
    
    let timeline = Timeline(entries: entries, policy: .atEnd)
    completion(timeline)
  }
}

struct SimpleEntry: TimelineEntry {
  let date: Date
  let configuration: ConfigurationIntent
}

import Combine
class WidgetViewModel: ObservableObject {
  @Published var currentWord: String = "hello world"
  var cancellables = Set<AnyCancellable>()
  var wordBank: [String] = []
  var currentIndex = 0
  
  init() {
    mock()
  }
}


extension WidgetViewModel {
  func mock() {
    wordBank = mockWords()
    Timer.publish(every: 0.5, on: .main, in: .default)
      .autoconnect()
      .sink { [unowned self] v in
        self.currentIndex += 1
        if self.currentIndex == self.wordBank.count {
          cancellables.forEach { $0.cancel() }
        }
        self.currentWord = self.wordBank[self.currentIndex]
      }
      .store(in: &cancellables)
  }
}

// We probably can't use a widget for this due to refresh limitations.
// We may have to get creative here if we want to have one.
struct WidgetEntryView : View {
  var entry: Provider.Entry
  
  @ObservedObject var viewModel = WidgetViewModel()
  
  var body: some View {
//    Text(entry.date, style: .time)
    Text(viewModel.currentWord)
  }
}

@main
struct TextWidget: Widget {
  let kind: String = "Widget"
  
  var body: some WidgetConfiguration {
    IntentConfiguration(kind: kind, intent: ConfigurationIntent.self, provider: Provider()) { entry in
      WidgetEntryView(entry: entry)
    }
    .configurationDisplayName("My Widget")
    .description("This is an example widget.")
    .supportedFamilies([.systemSmall, .systemMedium, .systemLarge, .systemExtraLarge])
  }
}

struct Widget_Previews: PreviewProvider {
  static var previews: some View {
    WidgetEntryView(
      entry: SimpleEntry(
        date: Date(),
        configuration: ConfigurationIntent()
      )
    )
      .previewContext(WidgetPreviewContext(family: .systemExtraLarge))
    
    WidgetEntryView(
      entry: SimpleEntry(
        date: Date(),
        configuration: ConfigurationIntent()
      )
    )
      .previewContext(WidgetPreviewContext(family: .systemLarge))
    
    WidgetEntryView(
      entry: SimpleEntry(
        date: Date(),
        configuration: ConfigurationIntent()
      )
    )
      .previewContext(WidgetPreviewContext(family: .systemMedium))
    
    WidgetEntryView(
      entry: SimpleEntry(
        date: Date(),
        configuration: ConfigurationIntent()
      )
    )
      .previewContext(WidgetPreviewContext(family: .systemSmall))
  }
}
