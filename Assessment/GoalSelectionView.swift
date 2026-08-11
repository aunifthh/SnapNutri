import SwiftUI

struct GoalSelectionView: View {
    
    let onContinue: () -> Void
    
    // MARK: - Goal
    
    enum Goal {
        case lose
        case maintain
        case gain
    }
    
    @State private var selectedGoal: Goal = .maintain
    
    var body: some View {
        ZStack {
            
            // MARK: - Background
            Color.white
                .ignoresSafeArea()
            
    
       
             
             Image("backgroundGoalSelectionView")
             .resizable()
             .scaledToFit()
             .ignoresSafeArea()
             .opacity(0.5)
             
            
            VStack(spacing: 0) {
                
                // MARK: - Progress Dots
                
                HStack(spacing: 14) {
                    Circle()
                        .fill(Color.gray.opacity(0.5))
                        .frame(width: 12, height: 12)
                    
                    Circle()
                        .fill(Color.black)
                        .frame(width: 12, height: 12)
                    
                    Circle()
                        .fill(Color.gray.opacity(0.5))
                        .frame(width: 12, height: 12)
                }
                .padding(.top, 60)
                
                Spacer()
                
                // MARK: - Title
                
                VStack(alignment: .leading, spacing: 20) {
                    
                    Text("What brings you here?")
                        .font(.system(size: 30, weight: .bold))
                    
                    Text("You can change this anytime")
                        .font(.system(size: 18, weight: .regular))
                    
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.top, 70)
                
                // MARK: - Goal Cards
                
                VStack(spacing: 12) {
                    
                    GoalCard(
                        icon: "scalemass",
                        title: "Lose weight",
                        subtitle: "Gradual, sustainable pace",
                        isSelected: selectedGoal == .lose
                    ) {
                        selectedGoal = .lose
                    }
                    
                    GoalCard(
                        icon: "equal",
                        title: "Maintain",
                        subtitle: "Just track and stay aware",
                        isSelected: selectedGoal == .maintain
                    ) {
                        selectedGoal = .maintain
                    }
                    
                    GoalCard(
                        icon: "gauge.with.dots.needle.bottom.50percent",
                        title: "Gain weight",
                        subtitle: "Build muscle or recover",
                        isSelected: selectedGoal == .gain
                    ) {
                        selectedGoal = .gain
                    }
                }
                .padding(.top, 50)
                
                Spacer()
                
                // MARK: - Continue Button
                
                Button {
                    onContinue()
                } label: {
                    Text("Continue")
                        .padding(20)
                        .padding(.horizontal,76)
                        .foregroundStyle(Color.white)
                        .background(.blue, in: RoundedRectangle(cornerRadius: 12))
                }
                .padding(.horizontal, 10)
                .padding(.bottom, 35)
            }
            .padding(.horizontal, 35)
        }
    }
}


// MARK: - Goal Card

struct GoalCard: View {
    
    let icon: String
    let title: String
    let subtitle: String
    let isSelected: Bool
    let action: () -> Void
    
    var body: some View {
        
        Button {
            action()
        } label: {
            
            HStack(spacing: 25) {
                
                // Icon
                
                Image(systemName: icon)
                    .font(.system(size: 24))
                    .frame(width: 40)
                    .foregroundStyle(.black)
                
                // Text
                
                VStack(alignment: .leading, spacing: 5) {
                    
                    Text(title)
                        .font(.system(size: 20, weight: .bold))
                        .foregroundStyle(.black)
                    
                    Text(subtitle)
                        .font(.system(size: 14))
                        .foregroundStyle(.black)
                }
                
                Spacer()
                
                // Checkmark
                
                if isSelected {
                    Image(systemName: "checkmark")
                        .font(.system(size: 28, weight: .bold))
                        .foregroundStyle(.green)
                }
            }
            .padding(.horizontal, 25)
            .frame(maxWidth: .infinity)
            .frame(height: 90)
            .background(
                isSelected
                ? Color.green.opacity(0.3)
                : Color.white.opacity(0.85)
            )
            .overlay(
                RoundedRectangle(cornerRadius: 20)
                    .stroke(
                        isSelected ? Color.green : Color.black,
                        lineWidth: 2
                    )
            )
            .clipShape(RoundedRectangle(cornerRadius: 20))
        }
        .buttonStyle(.plain)
    }
}


#Preview {
    NavigationStack {
        GoalSelectionView {
            print("Continue pressed")
        }
    }
}
