import Foundation

class ERForm {
    
    var form: GetFormsQuery.Data.Setting.Capture.RequiredForm.Form
    
    var title: String!
    
    init(form: GetFormsQuery.Data.Setting.Capture.RequiredForm.Form) {
        self.form = form
        
        title = form.formType.displayName["nb-NO"] as? String ?? form.formType.displayName["en"] as? String ?? "No displayname"
    }
}
