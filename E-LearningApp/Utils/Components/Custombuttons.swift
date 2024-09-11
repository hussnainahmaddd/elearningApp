//
//  Custombuttons.swift
//  E-LearningApp
//
//  Created by Hussnain Ahmad on 11/09/2024.
//

import SwiftUI

struct ButtonPrimary: View{
    var textLabel: LocalizedStringKey
    enum TagState {
        case defaulted, selected, touched, disabled, delete   // default is a language keyword so it cannot be used
    }
    @State var tagState: TagState
    var action: () -> Void
    var body: some View{
        Button(
            action:{
                action()
            },
            
            label:{
                Text(textLabel)
                    .frame(width: UIScreen.screenWidth - 100, height: 30)
                    .font(.subheadline)
                    .textCase(.uppercase)

            }
        )
        .frame(width: UIScreen.screenWidth - 30, height: 59)
        .background(
            tagState == .selected ?
            Color.lightGreyColor: tagState == .touched ?
            Color.darkGreyColor: tagState == .selected ?
            Color.blackColor: tagState == .disabled ?
            Color.white: tagState == .delete ?
            Color.whiteColor: Color.blackColor
        )
        .foregroundColor(
            !(tagState == .disabled) ?
            Color.lightGreyColor : tagState == .disabled ?
            Color.red : tagState == .delete ?
            Color.whiteColor: Color.blackColor
           
            
        )
        .cornerRadius(12)
        
        .overlay(RoundedRectangle(cornerRadius: 10)
            .stroke(
                !(tagState == .disabled) ?
                Color.lightGreyColor : tagState == .disabled ?
                Color.red : tagState == .delete ?
                Color.whiteColor: Color.blackColor
                , lineWidth:
                    tagState == .disabled ? 1 : 0
            ))
        
    }
}

