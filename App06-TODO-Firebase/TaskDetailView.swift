//
//  TaskDetailView.swift
//  App06-TODO-Firebase
//
//  Created by alumno on 04/12/21.
//

import SwiftUI

struct TaskDetailView: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    @StateObject var taskModel: TaskModel
    @State var task: Task
    var mode: Mode
    @State var showError: Bool = false
    
    var dateFormat: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy/MMM/dd"
        return formatter
    }
    
    var body: some View {
        VStack {
            Form {
                Section(header: Text("Datos Generales")) {
                    TextField("Tarea", text: $task.task)
                        .font(.largeTitle)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    Toggle("Tarea Completada", isOn: $task.is_completed)
                        .font(.title)
                }
                Section(header: Text("Categoría")) {
                    CategoryView(taskModel: taskModel, task: $task)
                }
                Section(header: Text("Prioridad")) {
                    PriorityView(taskModel: taskModel, task: $task)
                }
                Section(header: Text("Fecha de entrega")) {
                    DatePicker(selection: $task.due_date, displayedComponents: .date) {
                        Text("\(dateFormat.string(from: task.due_date))")
                            .font(.title)
                    }
                }
                
            }
            Spacer()
            Button {
                if task.task != "" {
                    if mode == .add {
                        addTask()
                    } else {
                        editTask()
                    }
                    presentationMode.wrappedValue.dismiss()
                } else {
                    showError.toggle()
                }
            } label: {
                HStack {
                    Image(systemName: mode == .add ? "square.and.arrow.down" : "pencil.circle")
                        .font(.largeTitle)
                        .foregroundColor(.white)
                    Text(mode == .add ? "Agregar" : "Editar")
                        .font(.largeTitle)
                        .foregroundColor(.white)
                }
                .padding()
                .background(Color.green)
                .cornerRadius(20)
            }

        }
        .onAppear {
            print(Int(task.due_date - Date())/86400)
        }
        .alert(isPresented: $showError) {
                    Alert(title: Text("Error en la tarea"), message: Text("Falta capturar la tarea"), dismissButton: .default(
                            Text("Va!")))
                }
    }
    
    func addTask() {
                
        taskModel.addData(task: task)
        
    }
    
    func editTask() {
        
        taskModel.updateData(task: task)
        
    }
}

struct TaskDetailView_Previews: PreviewProvider {
    static var previews: some View {
        TaskDetailView(taskModel: TaskModel(), task: Task(task: "Tarea", category_id: "01", priority_id: "01", is_completed: false, date_created: Date(), due_date: Date()), mode: .add)
    }
}
