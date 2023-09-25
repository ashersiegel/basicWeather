import SwiftUI

struct ContentView: View {
    
    @State private var isNight = false
    
    var body: some View {
        ZStack {
            backgroundView(topColor: isNight ? .black : .blue,
                           bottomColor: isNight ? .gray : Color("lightBlue"))
            VStack {
                Text("Deerfield, IL")
                    .font(.system(size: 32, weight: .medium, design: .rounded))
                    .foregroundColor(.white)
                    .padding()
                VStack(spacing: 8){
                    Image(systemName: isNight ? "moon.stars.fill" : "cloud.sun.fill")
                        .renderingMode(.original)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 180, height: 180)
                    Text("73°")
                        .font(.system(size: 70, weight: .medium, design: .rounded))
                        .foregroundColor(.white)
                }
                .padding(.bottom, 40)
                HStack(spacing: 20) {
                    weatherDayView(dayOfWeek: "Tue",
                                   imageName: "cloud.fill",
                                   temperature: 67)
                    weatherDayView(dayOfWeek: "Wed",
                                   imageName: "cloud.fill",
                                   temperature: 73)
                    weatherDayView(dayOfWeek: "Thu",
                                   imageName: "cloud.drizzle.fill",
                                   temperature: 72)
                    weatherDayView(dayOfWeek: "Fri",
                                   imageName: "cloud.bolt.rain.fill",
                                   temperature: 72)
                    weatherDayView(dayOfWeek: "Sat",
                                   imageName: "sun.max.fill",
                                   temperature: 76)
                }
                Spacer()
                Button {
                    isNight.toggle()
                    
                }
                label: {
                    Text("Change day time")
                        .frame(width: 280, height: 50)
                        .background(.white)
                        .font(.system(size: 20, weight: .bold, design: .rounded))
                        .cornerRadius(10)
                }
                Spacer()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct weatherDayView: View {
    
    var dayOfWeek: String
    var imageName: String
    var temperature: Int
    
    var body: some View {
        VStack{
            Text(dayOfWeek)
                .font(.system(size: 16, weight: .medium, design: .rounded))
                .foregroundColor(.white)
            Image(systemName: imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 40, height: 40)
            Text("\(temperature)°")
                .font(.system(size: 28, weight: .medium, design: .rounded))
                .foregroundColor(.white)
        }
    }
}

struct backgroundView: View {
    
    var topColor: Color
    var bottomColor: Color
    
    var body: some View {
        LinearGradient(gradient: Gradient(colors: [topColor, bottomColor]),
                       startPoint: .topLeading,
                       endPoint: .bottomLeading)
        .edgesIgnoringSafeArea(.all)
    }
}

