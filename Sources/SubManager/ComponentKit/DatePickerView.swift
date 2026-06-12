//
//  DatePickerView.swift
//
//
//  Created by Yildirim, Alper on 4.07.2023.
//
import SwiftUI

struct DatePickerField: View {
    @State private var selectedDate = Date()
    @State private var isDatePickerVisible = false

    var body: some View {
        TextField("Select Date",
                  text: .constant(dateFormatter.string(from: selectedDate))) {
            isDatePickerVisible = $0
        }
        .textFieldStyle(RoundedBorderTextFieldStyle())
        .disabled(true)
        .onTapGesture {
            isDatePickerVisible = true
        }
        .sheet(isPresented: $isDatePickerVisible) {
            DatePicker("Select Date", selection: $selectedDate, in: ...Date(), displayedComponents: .date)
        }
    }

    private let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .none
        return formatter
    }()
}
