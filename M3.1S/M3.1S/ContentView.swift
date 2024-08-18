//
//  ContentView.swift
//  M2S
//
//  Created by Илья Иванов on 17.08.2024.
//

import SwiftUI

enum Genders: String, CaseIterable, Identifiable {
  case man, woman
  
  var id: Self {self}
}

struct ContentView: View {
  @State private var userName: String = ""
  @State private var userSurname: String = ""
  @State private var dateOfBirth = Date()
  @State private var genderType: Genders = .man
  @State private var isOn: Bool = false
  @State private var isShowDialog: Bool = false
  
  
  var body: some View {
    NavigationView{
      
      
      List{
        Section(){
          TextField(
            "Input your Name",
            text: $userName){
              
            }
          
          TextField(
            "Input your Surname",
            text: $userSurname){
              
            }
          
          DatePicker(
            "Date of Birthday",
            selection: $dateOfBirth,
            displayedComponents: [.date]
          )
          
          Picker("Genders", selection: $genderType) {
            Text(Genders.man.rawValue.capitalized).tag(Genders.man)
            Text(Genders.woman.rawValue.capitalized).tag(Genders.woman)
          }
          .datePickerStyle(.compact)
          
        } header: {
          Text("Personal Data")
        }
        
        Section(){
          Toggle(isOn: $isOn, label: {
            Text("Receive notifications")
          })
          if isOn == true {
            Label("News", systemImage: "bubble")
            Label("Update Friends", systemImage: "person")
          }
          
          
        } header: {
          Text("Notification")
        }
        
        Section(){
          Button("Personal Data", action: {
            
          })
          Button("Terms of Use", action: {
            
          })
        } header: {
          Text("Documents")
        }
        
        Section(){
          Button("Exit", action: {
            isShowDialog = true
          })
          .foregroundStyle(Color.red)
          .alert("Are you sure you want to get out?",
                 isPresented: $isShowDialog
          ) {
            Button("Cancel", action: {
              isShowDialog = false
            })
            
            Button("Exit", action: {
              isShowDialog = false
            })
            
          }
          
        }
        
        
        
      }
      .padding(5)
      .pickerStyle(.navigationLink)
      
      
    }
  }
}

#Preview {
    ContentView()
}

