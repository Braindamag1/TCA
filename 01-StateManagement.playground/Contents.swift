import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack {
            List {
                NavigationLink {
                    CounterView()
                } label: {
                    Text("Counter Demo")
                }
                
                NavigationLink {
                    EmptyView()
                } label: {
                    Text("Favorite Prime")
                }
            }
            .navigationTitle("State management")
        }
    }
}

struct CounterView: View {
    @State var count: Int = 0
    var body: some View {
        VStack {
            HStack {
                Button(action: {
                    count -= 1
                }, label: {
                    Text("-")
                })
                Text("\(count)")
                Button(action: {
                    count += 1
                }, label: {
                    Text("+")
                })
                
            }
            Button(action: {}, label: {
                Text("Is this prime?")
            })
            Button(action: {}, label: {
                Text("What is \(ordinal(count)) prime?")
            })
        }
        .font(.title)
        .navigationTitle("Counter Demo")
    }
    
    private func ordinal(_ n: Int)->String {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .ordinal
        return numberFormatter.string(for: n) ?? ""
    }
}

import PlaygroundSupport

PlaygroundPage.current.liveView = UIHostingController(rootView: ContentView())
