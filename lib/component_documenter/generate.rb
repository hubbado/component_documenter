module ComponentDocumenter
  class Generate
    def self.call
      classes = YARD::Registry.all(:class).select do |c|
        c.mixins.map(&:path).include?("Messaging::Message")
      end

      commands = classes.select { |c| c.path =~ /Messages::Commands::/ }
      events = classes.select { |c| c.path =~ /Messages::Events::/ }

      output = [
        "# Message schemas",
        (message_list(commands, "Commands") if commands.any?),
        (message_list(events, "Events") if events.any?),
        (message_schemas(commands, "Commands") if commands.any?),
        (message_schemas(events, "Events") if events.any?)
      ]

      output.compact.join("\n") + "\n"
    end

    def self.message_list(messages, type)
      header = "## #{type}"

      message_list = messages
        .sort_by(&:name)
        .map { |message| "* [#{message.name}](##{header_to_anchor(message.name)})" }
        .join("\n")

      "\n#{header}\n\n#{message_list}"
    end

    def self.message_schemas(messages, type)
      header = "## #{type} Schemas"

      schemas = messages.sort_by(&:name).map do |message|
        schema = "### #{message.name}\n"
        schema += "\n#{message.docstring}\n" if message.docstring != ''
        schema += "\n<table>\n"

        message.children.select { |c| c['message_attribute'] }.each do |attribute|
          schema += <<~OUTPUT
            <tr>
              <td>#{attribute.name}</td>
              <td>#{attribute.message_attribute_type}</td>
              <td>#{attribute.docstring}</td>
            </tr>
          OUTPUT
        end

        schema += "</table>"
      end.join("\n\n")

      "\n#{header}\n\n#{schemas}"
    end

    def self.header_to_anchor(text)
      text.downcase.to_s.gsub(' ', '-')
    end
  end
end
