module ComponentDocumenter
  class MessageAttributeHandler < YARD::Handlers::Ruby::Base
    handles method_call(:attribute)
    namespace_only

    process do
      name = statement.parameters[0].jump(:tstring_content, :ident).source
      type = statement.parameters[1].source if statement.parameters[1]

      push_state(:scope => :class) do
        object = YARD::CodeObjects::MethodObject.new(namespace, name)
        register(object)
        object.message_attribute = true
        object.message_attribute_type = type
      end
    end
  end

end
