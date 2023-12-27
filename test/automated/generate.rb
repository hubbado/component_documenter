require_relative 'automated_init'

context 'Generate' do
  context 'With a single command' do
    YARD::Registry.clear
    YARD.parse_string(Controls::SourceCode::SingleCommand.source)

    test 'Builds expected documentation' do
      assert Generate.() == Controls::SourceCode::SingleCommand.documentation
    end
  end

  context 'With a single event' do
    YARD::Registry.clear
    YARD.parse_string(Controls::SourceCode::SingleEvent.source)

    test 'Builds expected documentation' do
      assert Generate.() == Controls::SourceCode::SingleEvent.documentation
    end
  end

  context 'With multiple commands and events' do
    YARD::Registry.clear
    YARD.parse_string(Controls::SourceCode::MultipleCommandsAndEvents.source)

    test 'Builds expected documentation' do
      assert Generate.() == Controls::SourceCode::MultipleCommandsAndEvents.documentation
    end
  end

  context 'With additional objects' do
    YARD::Registry.clear
    YARD.parse_string(Controls::SourceCode::SingleCommandWithAdditionalObjects.source)

    test 'Ignores non command and event objects' do
      assert Generate.() == Controls::SourceCode::SingleCommand.documentation
    end
  end
end
