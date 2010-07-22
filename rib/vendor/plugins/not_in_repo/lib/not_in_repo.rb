
# NotInRepo
#
#


class NotInRepo 

        def initialize(path = nil)
                @@path = path || "data.nir"
                @@data = {}

                file = File.new(@@path, "r") 

                @@data  = YAML.load(File.read(@@path))
                @@data
        end


end
