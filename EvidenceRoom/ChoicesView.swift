import SwiftUI

class ChoicesViewModel: ObservableObject {
    
    private let field: TaskField
    
    var options: [ChoiceOption] {
        field.options
    }
    
    var names: [String] {
        field.options.compactMap({ getTranslation(dict: $0.title) })
    }
    
    init(field: TaskField) {
        self.field = field
    }
}

struct ChoicesView: View {
    
    @ObservedObject var viewModel: ChoicesViewModel
    
    var body: some View {
        ForEach(viewModel.options, id: \.id) { option in
            Text(getTranslation(dict: option.title))
                .fontWeight(option.answer == true ? .semibold : .thin)
                .foregroundColor(option.answer == true ? .black : .gray)
        }
    }
}
