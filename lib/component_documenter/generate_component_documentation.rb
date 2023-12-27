module ComponentDocumenter
  class GenerateComponentDocumentation
    def self.call
      YARD.parse('lib/**/*.rb')

      puts Generate.()
    end
  end
end
