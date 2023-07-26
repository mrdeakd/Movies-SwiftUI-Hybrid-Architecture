source 'https://cdn.cocoapods.org/'

load 'Phasesfile'

# Disable sending stats
ENV['COCOAPODS_DISABLE_STATS'] = 'true'

platform :ios, '15.2'
inhibit_all_warnings!
use_frameworks!

workspace 'Movies.xcworkspace'

def developmentPods
  pod 'SwiftGen'
  pod 'SwiftLint'
end

def basePods
  # Define basePods
end

def networkPods
  # Define networkPods
end

target 'Movies' do
  project 'Movies/Movies.xcodeproj'

  basePods
  developmentPods

  script_phase(ScriptPhase.swiftgen)
  script_phase(ScriptPhase.swiftlint)

  target 'MoviesTests' do
    script_phase(ScriptPhase.swiftlint)
  end
end

target 'Utils' do
  project 'Utils/Utils.xcodeproj'

  basePods
  developmentPods

  script_phase(ScriptPhase.swiftgen)
  script_phase(ScriptPhase.swiftlint)

  target 'UtilsTests' do
    script_phase(ScriptPhase.swiftlint)
  end
end

target 'UI' do
  project 'UI/UI.xcodeproj'

  basePods
  developmentPods

  script_phase(ScriptPhase.swiftgen)
  script_phase(ScriptPhase.swiftlint)

  target 'UITests' do
    script_phase(ScriptPhase.swiftlint)
  end
end

target 'Common' do
  project 'Common/Common.xcodeproj'

  basePods
  developmentPods

  script_phase(ScriptPhase.swiftgen)
  script_phase(ScriptPhase.swiftlint)

  target 'CommonTests' do
    script_phase(ScriptPhase.swiftlint)
  end
end

post_install do |installer|
  installer.pods_project.targets.each do |target|
    # https://github.com/CocoaPods/CocoaPods/issues/8891#issuecomment-1201465446
    if target.respond_to?(:product_type) and target.product_type == "com.apple.product-type.bundle"
      target.build_configurations.each do |config|
          config.build_settings['CODE_SIGNING_ALLOWED'] = 'NO'
      end
    end

    target.build_configurations.each do |config|
      config.build_settings.delete 'IPHONEOS_DEPLOYMENT_TARGET'
    end
  end
end

# derived from: https://github.com/CocoaPods/CocoaPods/issues/11444
post_integrate do |installer|
  installer.aggregate_targets.each do |target|
    set_run_script_to_always_run(project: target.user_project)
  end
end

def set_run_script_to_always_run(project:)
  project.targets.each do |target|
    run_script_build_phases = target.build_phases.filter { |phase| phase.is_a?(Xcodeproj::Project::Object::PBXShellScriptBuildPhase) }
    cocoapods_run_script_build_phases = run_script_build_phases.filter { |phase|
      phase.name != nil && (phase.name.include?("SwiftLint") || phase.name.include?("SwiftGen"))
    }
    cocoapods_run_script_build_phases.each do |run_script|
      run_script.always_out_of_date = "1"
    end
  end
  project.save
end
