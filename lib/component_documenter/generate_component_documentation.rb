module ComponentDocumenter
  class GenerateComponentDocumentation
    def self.call
      YARD.parse('lib/**/*.rb')

      Generate.()
    end
  end
end
