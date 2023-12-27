module ComponentDocumenter
  class Generate
    def self.call
      classes = YARD::Registry.all(:class).select do |c|
        c.mixins.map(&:path).include?("Messaging::Message")
      end

      commands = classes.select { |c| c.path =~ /Messages::Commands::/ }
      events = classes.select { |c| c.path =~ /Messages::Events::/ }

      output = ["# Message definitions"]
      output << if commands.any?
                  <<~OUTPUT
                    ## Commands

                    #{message_schemas commands}
                  OUTPUT
                end

      output << if events.any?
                  <<~OUTPUT
                    ## Events

                    #{message_schemas events}
                  OUTPUT
                end

      output.compact.join("\n")
    end

    def self.message_schemas(messages)
      message_list = messages.sort_by(&:name).map do |message|
        "* #{message.name}"
      end.join("\n")

      schemas = messages.sort_by(&:name).map do |message|
        schema = <<~OUTPUT
          **#{message.name}**

          #{message.docstring}

          <table>
        OUTPUT

        message.children.select { |c| c['message_attribute'] }.each do |attribute|
          schema += <<~OUTPUT
            <tr>
              <td>`#{attribute.name}`</td>
              <td>#{attribute.message_attribute_type}</td>
              <td>#{attribute.docstring}</td>
            </tr>
          OUTPUT
        end

        schema += "</table>"
      end

      "#{message_list}\n\n" + schemas.join("\n\n")
    end
  end
end
