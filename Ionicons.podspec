Pod::Spec.new do |spec|
  spec.name     = 'Ionicons'
  spec.version  = '1.3.5'
  spec.authors   = { 'Connor Grady' => 'conair360@gmail.com' }
  spec.license  = { :type => 'MIT', :file => 'LICENSE' }
  spec.homepage = 'https://github.com/itsjustcon/ionicons-objc'
  spec.summary  = 'Use the beautiful Ionicons font (http://ionicons.com/) in your native Objective-C projects.'
  spec.source   = { :git => 'https://github.com/itsjustcon/ionicons-objc.git', :tag => "v#{spec.version}" }
  spec.platform = :ios, '5.0'
  spec.source_files = '*.{h,m}'
  spec.resources = [ 'ionicons.ttf' ]
  spec.frameworks = 'Foundation', 'UIKit'
  spec.requires_arc = true

  spec.pre_install do |pod, library_representation|
    require 'rexml/document'

    font = 'ionicons.ttf'
    proj = Xcodeproj::Project.open(library_representation.library.user_project_path)
    target = proj.targets.first   # good guess for simple projects

    info_plists = target.build_configurations.map do |config|
      File.join(File.dirname(proj.path), config.build_settings['INFOPLIST_FILE'])
    end.uniq    # debug/release often have the same plist, so filter to only unique file paths

    info_plists.each do |plist|
      doc = REXML::Document.new(File.open(plist))
      main_dict = doc.elements["plist/dict"]
      app_fonts = main_dict.elements["key[text()='UIAppFonts']"]
      if app_fonts.nil?
        elem = REXML::Element.new 'key'
        elem.text = 'UIAppFonts'
        main_dict.add_element(elem)
        font_array = REXML::Element.new 'array'
        main_dict.add_element(font_array)
      else
        font_array = app_fonts.next_element
      end

      if font_array.get_elements("string[text()='#{font}']").empty?
        font_elem = REXML::Element.new 'string'
        font_elem.text = font
        font_array.add_element(font_elem)
      end

      doc.write(File.open(plist, 'wb'))

    end
  end
end