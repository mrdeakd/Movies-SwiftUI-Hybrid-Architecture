import SwiftUI

struct MainScreenView<ViewModel: MainScreenViewModelProtocol>: View {
    @StateObject var viewModel: ViewModel

    var body: some View {
        NavigationView {
            Text("MainScreenView")
                .onTapGesture {
                    viewModel.startLoading()
                }
        }
        .navigationBarHidden(true)
    }
}

struct MainScreenView_Previews: PreviewProvider {
    static var previews: some View {
        MainScreenView(
            viewModel: MainScreenViewModel(
                navigation: MainScreenNavigation(),
                repository: AppRepository(),
                overlayManager: OverlayManager(appDependency: AppDependency())
            )
        )
    }
}
