import SwiftUI



// SwiftUI View that displays the cards
struct ContentView: View {
    @State private var cards: [Card] = []

    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVGrid(columns: columns, spacing: 20) {
                    ForEach(cards, id: \.id) { card in
                        VStack {
                            CardImageView(card: card)
                            Text(card.name)
                                .font(.caption)
                                .lineLimit(1)
                        }
                    }
                }
                .padding()
            }
            .navigationTitle("Cards")
        }
        .onAppear(perform: loadCards)
    }
    // Function to load and parse the JSON data
    func loadCards() {
        // Replace this with the actual path to your JSON file in the app bundle
        if let url = Bundle.main.url(forResource: "WOT-Scryfall", withExtension: "json"),
           let data = try? Data(contentsOf: url) {
            let decoder = JSONDecoder()
            do {
                let cardList = try decoder.decode(CardList.self, from: data)
                self.cards = cardList.data
            } catch {
                print("Error parsing JSON: \(error)")
            }
        }
    }
}
struct CardImageView: View {
    let card: Card

    var body: some View {
        ZStack(alignment: Alignment(horizontal: .leading, vertical: .bottom)) {
            if let imageUris = card.imageUris {
                AsyncImage(url: imageUris.normal) { image in
                    image.resizable()
                } placeholder: {
                    Color.gray.frame(width: 100, height: 140)
                }
                .frame(width: 100, height: 140)
                .cornerRadius(5)

            }
        }
    }
}


#Preview {
    ContentView()
}
