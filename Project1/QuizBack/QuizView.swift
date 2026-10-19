//
//  QuizView.swift
//  Project1
//
//  Created by Ferdinando Carbone on 27/10/22.
//

import SwiftUI


struct QuizView: View {
    
    let quizdata = DataLoader().museumQuiz
    
    @Binding var userXP: Int
    @State private var quizStep: Int = 0
    @State private var selectedAnswer: String = ""
    @State private var showNext: Bool = false
    
    var body: some View {
        if showNext {
            FinalView(userXP: $userXP)
        } else {
            VStack{
                HStack{
                    Spacer()
                    HStack(spacing: 0) {
                        Text("XP: \(userXP)")//(Image(systemName: "trophy"))")
                            .font(.title2)
                            .fontWeight(.semibold)
                        .padding(.trailing)
                   
                        Image(systemName: "trophy").foregroundColor(Color("Yellow"))
                            .font(.title)
                            .bold()
                            .padding(.trailing)
                    }
                    
                }
                
                if !quizdata.isEmpty {
                    Image(quizdata[quizStep].photo)
                        .resizable()
                        .frame(width: 200, height: 200)
                        .clipShape(Circle())
                        .shadow(radius: 20)
                        .overlay(Circle().stroke(Color.black, lineWidth: 0.5))
                        .padding(.bottom, 30)
                    
                    Text(quizdata[quizStep].question)
                        .font(.system(size: 22))
                        .foregroundColor(.black.opacity(0.7))
                        .fontWeight(.medium)
                        .multilineTextAlignment(.center)
                        .fixedSize(horizontal: false, vertical: true)
                        .padding(.bottom, 25)
                        .padding(.horizontal)
                    
                    HStack{
                        
                        Button {
                            selectedAnswer = quizdata[quizStep].answer1
                            checkCorrectAnswer()
                        } label: {
                            Text(quizdata[quizStep].answer1)
                                .font(.system(size: 18))
                                .foregroundColor(.black.opacity(0.7))
                                .fixedSize(horizontal: false, vertical: true)
                                .multilineTextAlignment(.center)
                                .frame(width: 160, height: 80)
                              
                                .background(RoundedRectangle(cornerRadius: 12).fill(
                                    selectedAnswer == "" ? Color.white : (selectedAnswer != "" && selectedAnswer == quizdata[quizStep].rightAnswer && selectedAnswer == quizdata[quizStep].answer1) ? Color.green : (selectedAnswer != "" && selectedAnswer != quizdata[quizStep].rightAnswer && selectedAnswer == quizdata[quizStep].answer1) ? .orange : .white).shadow(radius: 5))
                            
                            
                        }
                        .frame(width: 160.0, height: 80.0)
                        
                        Spacer()
                            .frame(width: 20.0, height: 20.0)
                        Button {
                            selectedAnswer = quizdata[quizStep].answer2
                            checkCorrectAnswer()
                        } label: {
                            Text(quizdata[quizStep].answer2)
                                .font(.system(size: 18))
                                .foregroundColor(.black.opacity(0.7))
                                .fixedSize(horizontal: false, vertical: true)
                                .multilineTextAlignment(.center)
                                .frame(width: 160, height: 80)
                                .background(RoundedRectangle(cornerRadius: 12).fill(selectedAnswer == "" ? Color.white : (selectedAnswer != "" && selectedAnswer == quizdata[quizStep].rightAnswer && selectedAnswer == quizdata[quizStep].answer2) ? Color.green : (selectedAnswer != "" && selectedAnswer != quizdata[quizStep].rightAnswer && selectedAnswer == quizdata[quizStep].answer2) ? .orange : .white ).shadow(radius: 5))
                        }
                        .frame(width: 160.0, height: 80.0)
                    }
                    Spacer()
                        .frame(width: 20.0, height: 20.0)
                    HStack{
                        Button {
                            selectedAnswer = quizdata[quizStep].answer3
                            checkCorrectAnswer()
                        } label: {
                            Text(quizdata[quizStep].answer3)
                                .font(.system(size: 18))
                                .foregroundColor(.black.opacity(0.7))
                                .fixedSize(horizontal: false, vertical: true)
                                .multilineTextAlignment(.center)
                                .frame(width: 160, height: 80)
                                .background(RoundedRectangle(cornerRadius: 12).fill(selectedAnswer == "" ? Color.white : (selectedAnswer != "" && selectedAnswer == quizdata[quizStep].rightAnswer && selectedAnswer == quizdata[quizStep].answer3) ? Color.green: (selectedAnswer != "" && selectedAnswer != quizdata[quizStep].rightAnswer && selectedAnswer == quizdata[quizStep].answer3) ? .orange: .white).shadow(radius: 5))
                        }
                        .frame(width: 160.0, height: 80.0)
                        Spacer()
                            .frame(width: 20.0, height: 20.0)
                        Button {
                            selectedAnswer = quizdata[quizStep].answer4
                            checkCorrectAnswer()
                        } label: {
                            Text(quizdata[quizStep].answer4)
                                .font(.system(size: 18))
                                .foregroundColor(.black.opacity(0.7))
                                .fixedSize(horizontal: false, vertical: true)
                                .multilineTextAlignment(.center)
                                .frame(width: 160, height: 80)
                                .background(RoundedRectangle(cornerRadius: 12).fill(selectedAnswer == "" ? Color.white : (selectedAnswer != "" && selectedAnswer == quizdata[quizStep].rightAnswer && selectedAnswer == quizdata[quizStep].answer4) ? Color.green : (selectedAnswer != "" && selectedAnswer != quizdata[quizStep].rightAnswer && selectedAnswer == quizdata[quizStep].answer4) ? .orange : .white ).shadow(radius: 5))
                            
                        }
                        .frame(width: 160.0, height: 80.0)
                    }
                    Spacer()
                    Spacer()
                    
                }
                
                
                
                
                // PageControlPreview()
                //I was trying to parse the question on the json file, in order to dynamically use the view
                
                
            }
        }
    }
    
    func checkCorrectAnswer() {
            
          
                DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                    withAnimation(.easeInOut) {
                        if quizStep < 4 {
                            quizStep += 1
                            if selectedAnswer == quizdata[quizStep-1].rightAnswer {
                                let tmp = userXP + 5
                                UserDefaults.standard.set(tmp, forKey: "userXP")
                                selectedAnswer = ""
                            }
                           //
                        } else {
                            if selectedAnswer == quizdata[quizStep].rightAnswer {
                                let tmp = userXP + 5
                                UserDefaults.standard.set(tmp, forKey: "userXP")
                            }
                            showNext = true
                        }
                    }
               // }
            }//se la risposta selezionata è uguale alla risposta corretta, aspetta due secondi e con un'animazione
        //easeInout riporta la variabile a zero e passa allo step successivo
        
        
    }
}
struct QuizView_Previews: PreviewProvider {
    static var previews: some View {
        QuizView(userXP: .constant(10))
    }
}
