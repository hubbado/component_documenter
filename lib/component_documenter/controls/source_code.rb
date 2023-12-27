module ComponentDocumenter
  module Controls
    module SourceCode
      module SingleCommand
        def self.source
          SourceCode.read('single_command.rb.txt')
        end

        def self.documentation
          SourceCode.read('single_command.md')
        end
      end

      module SingleEvent
        def self.source
          SourceCode.read('single_event.rb.txt')
        end

        def self.documentation
          SourceCode.read('single_event.md')
        end
      end

      module MultipleCommandsAndEvents
        def self.source
          SourceCode.read('multiple_commands_and_events.rb.txt')
        end

        def self.documentation
          SourceCode.read('multiple_commands_and_events.md')
        end
      end

      module SingleCommandWithAdditionalObjects
        def self.source
          SourceCode.read('single_command_with_additional_objects.rb.txt')
        end

        def self.documentation
          SourceCode.read('single_command.md')
        end
      end

      module MissingComments
        def self.source
          SourceCode.read('missing_comments.rb.txt')
        end

        def self.documentation
          SourceCode.read('missing_comments.md')
        end
      end

      def self.read(file)
        File.read("lib/component_documenter/controls/source_code/#{file}")
      end
    end
  end
end
