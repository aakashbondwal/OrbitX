import SwiftUI

struct NewsView: View {
    
    var size: CGSize
    var safeArea: EdgeInsets
    var title: String // Add title property
    
    @EnvironmentObject var vm: ArticlesViewModel
    @State private var search: String = ""
    @State private var currentIndex: Int?
    @State private var showMenu: Bool = false
    
    var filteredNews: [Results] {
        guard !search.isEmpty else { return vm.allArticles?.results ?? [] }
        return vm.allArticles?.results.filter { $0.title.localizedCaseInsensitiveContains(search) } ?? []
    }
    
    var body: some View {
        
        ZStack {
            
            ScrollView(.vertical) {
                if filteredNews.isEmpty {
                    ProgressView()
                } else {
                    LazyVStack(spacing: 0) {
                        ForEach(filteredNews.indices, id: \.self) { index in
                            let headline = filteredNews[index]
                            HeadlineImageView(disclosed: Binding(get: {
                                currentIndex == index
                            }, set: { newValue in
                                currentIndex = newValue ? index : nil
                            }), result: headline, size: size, safeArea: safeArea)
                            .frame(maxWidth: .infinity)
                            .containerRelativeFrame(.vertical)
                            .overlay(alignment: .bottom, content: {
                                Button(action: {
                                    currentIndex = currentIndex == index ? nil : index
                                }, label: {
                                    DetailsView(result: headline)
                                        .frame(height: currentIndex == index ? nil : 280, alignment: .top)
                                        .clipped()
                                })
                            })
                        }
                    }
                }
            }
            .scrollIndicators(.hidden)
            .scrollTargetBehavior(.paging)
            .environment(\.colorScheme, .dark)
            
            HStack {
                VStack(alignment: .leading, spacing: 20) {
                    Text(title) 
                        .font(.title)
                        .bold()
                    Spacer()
                }
                Spacer()
            }
            .foregroundStyle(.white)
            .padding()
            .padding(.top, 80)
        }
    }
}
