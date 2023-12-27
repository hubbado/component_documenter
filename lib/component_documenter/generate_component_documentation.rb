module ComponentDocumenter
  class GenerateComponentDocumentation
    def self.call(glob = nil)
      glob ||= 'lib/**/*.rb'

      YARD.parse(glob)

      puts Generate.()
    end
  end
end
