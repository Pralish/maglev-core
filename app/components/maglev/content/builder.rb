# frozen_string_literal: true

module Maglev
  module Content
    module Builder
      TYPES = {
        text: Maglev::Content::Text,
        image_picker: Maglev::Content::ImagePicker,
        link: Maglev::Content::Link,
        checkbox: Maglev::Content::Checkbox
      }.freeze

      def build(scope, content, setting)
        klass = TYPES[setting.type.to_sym]

        raise "[Maglev] Unknown setting type: #{setting.type}" unless klass

        klass.new(scope, content, setting)
      end

      module_function :build
    end
  end
end