import SwiftUI

class ExhibitsViewModel: ObservableObject {
    private let exhibits: [Exhibit]
    
    var thumbnails: [UIImage] {
        var images = [UIImage]()
        
        for exhibit in exhibits {
            if let base64String = exhibit.thumbnail,
               let data = Data(base64Encoded: base64String),
               let image = UIImage(data: data) {
                images.append(image)
            }
        }
        return images
    }
    
    init(exhibits: [Exhibit]) {
        self.exhibits = exhibits
    }
}

struct ExhibitsView: View {
    
    @ObservedObject var viewModel: ExhibitsViewModel
    
    let columns = [
        GridItem(.adaptive(minimum: 160)),
        GridItem(.adaptive(minimum: 160))
    ]
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Exhibits:")
                .font(.caption)
            
            if viewModel.thumbnails.count > 0 {
                LazyVGrid(columns: columns) {
                    ForEach(viewModel.thumbnails, id: \.self) { thumbnail in
                        Image(uiImage: thumbnail)
                            .resizable()
                            .scaledToFit()
                            .cornerRadius(4)
                    }
                }
            } else {
                Text("No thumbnails available")
                    .font(.title3)
            }
        }
    }
}
