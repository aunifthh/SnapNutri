import SwiftUI

struct HomePage: View {
    let bmi: Double
    
    @State private var isAnimated: Bool = false
    
    var body: some View {
        NavigationStack {
            ZStack(alignment: .bottom) {
                // Latar Belakang
                Color("hijaumain")
                    .opacity(0.12)
                    .ignoresSafeArea()
                
                ScrollView(showsIndicators: false) {
                    VStack(alignment: .leading, spacing: 20) {
                        
                        // Header & Greeting
                        HeaderView()
                        GreetingView()
                        
                        // MARK: AI Suggestion Slider
                        TabView {
                            SliderDashboard()
                        }
                        .tabViewStyle(.page(indexDisplayMode: .always))
                        .frame(height: 140)
                        .padding(.bottom, 10) // Jarak tambahan untuk dots slider
                        
                        // MARK: Dashboard Components
                        VStack(spacing: 20) {
                            TodayProgressCard(bmi: bmi)
                            MacrosGridView()
                            MonthlyIntakeCard()
                            RecentMealCard()
                        }
                        
                        .offset(y: isAnimated ? 0 : 30)
                        .opacity(isAnimated ? 1 : 0)
                        
                        Spacer(minLength: 80)
                    }
                    .padding(.horizontal)
                }
                .onAppear {
                    withAnimation(.easeOut(duration: 0.8)) {
                        isAnimated = true
                    }
                }
                
            }
        }
    }
}
