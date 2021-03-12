import SwiftUI

struct ReportView: View {
    
    @Binding var report: ERForm?
    
    @State private var title = ""
    @State private var firstName = ""
    @State private var lastName = ""
    
    var body: some View {
        VStack {
            if let report = report {
                Form {
                    Text(report.title)
                        .font(.largeTitle)
                    
                    ForEach(report.form.form.fields!, id: \.id) { field in
                        VStack(alignment: .leading) {
                            
                            if let title = field.title["en"] as? String {
                                Text(title)
                                    .font(.title2)
                                    .padding()
                            }
                            
                            switch field.inputHint {
                            case .input:
                                TextField("Title", text: $title)
                            case .person:
                                VStack(alignment: .leading) {
                                    TextField("First name", text: $firstName)
                                        .padding()
                                    TextField("Last name", text: $lastName)
                                        .padding()
                                }
                            default:
                                Text(field.inputHint.rawValue)
                            }
                            
                        }.padding()
                    }
                }
            }
            HStack {
                Button("Cancel") {
                    report = nil
                }
                
                Button("Submit") {
                    print("Submit")
                    guard let report = report else { return }
                    
                    let reportID = UUID().uuidString
                    
                    
                    let personCreateInput = PersonCreateInput(firstName: firstName, lastName: lastName)
                    let createPersonMutation = CreatePersonMutation(person: personCreateInput, statuses: [])
                    
                    CloudClient.shared.apolloClient.perform(mutation: createPersonMutation) { result in
                        switch result {
                        case .success(let data):
                            if let errors = data.errors {
                                errors.forEach({ print($0) })
                            }
                            
                            guard let data = data.data else { return }
                            print(data.createPerson)
                            let person = PersonWithStatusWhereUniqueInput(id: data.createPerson.id)
                            let submitFormFieldInput = SubmitFormFieldInput(id: UUID().uuidString, persons: [person])
                            let submitFormInput = SubmitFormInput(files: WhereIDin(idIn: [""]), fields: [submitFormFieldInput])
                            let submitForm = SubmitFormMutation(formInput: submitFormInput)
                            CloudClient.shared.apolloClient.perform(mutation: submitForm) { result in
                                switch result {
                                case .success(let data):
                                    print(data)
                                case .failure(let error):
                                    print(error.localizedDescription)
                                }
                            }
                                                        
                        case .failure(let error):
                            print(error.localizedDescription)
                        }
                    }
                    
//                    let person = PapiCase.Report.Person(person: GetCasesQuery.Data.Case.Report.Person.Person(firstName: firstName, lastName: lastName))
//                    PapiCase.Report(id: reportID, name: title, persons: [person])
//                    let p = PersonWithStatusWhereUniqueInput(id: "aøsldkfj")
//                    let submitFormFieldInput = SubmitFormFieldInput(id: UUID().uuidString, persons: [p])
//                    let submitFormInput = SubmitFormInput(final: false, files: WhereIDin(idIn: ["dummy"]), fields: [submitFormFieldInput])
//                    let submitForm = SubmitFormMutation(formInput: submitFormInput)
//
//                    CloudClient.shared.apolloClient.perform(mutation: submitForm) { result in
//                        switch result {
//                        case .success(let data):
//                            print(data)
//                        case .failure(let error):
//                            print(error.localizedDescription)
//                        }
//                    }
                    
//                    let personID = UUID().uuidString
//                    let person = PersonCreateInput(personalId: nil, firstName: firstName, lastName: lastName, email: nil, phoneNumber: nil, gender: nil, dateOfBirth: nil, nationality: nil, workPlace: nil, address: nil, address2: nil, zipCode: nil, postArea: nil, country: nil)
//
//                    let personWithStatusWhereUniqueInput = PersonWithStatusWhereUniqueInput(id: personID)
//
//                    CloudClient.shared.apolloClient.perform(mutation: CreatePersonMutation(person: person, statuses: [""]))
//
//                    let fieldsInput = SubmitFormFieldInput(id: UUID().uuidString, value: nil, listValue: nil, files: nil, persons: [personWithStatusWhereUniqueInput])
//                    let formInput = SubmitFormInput(files: WhereIDin(idIn: [""]), fields: [fieldsInput])
//
//                    CloudClient.shared.apolloClient.perform(mutation: SubmitFormMutation(formInput: formInput)) { result in
//                        switch result {
//                        case .success(let data):
//                            print(data.errors)
//                        case .failure(let error):
//                            print(error.localizedDescription)
//                        }
//                    }
//
                    
                }.buttonStyle(EvidenceButtonStyle(bgColor: .secondary, clipShape: .capsule))
            }
        }.padding()
    }
}
