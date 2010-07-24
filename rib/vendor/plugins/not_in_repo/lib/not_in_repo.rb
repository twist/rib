
# NotInRepo
#
#


class NotInRepo 

        def initialize(path, storage, key)
                
		@@path = path || @@data
                @@data = {}
		@@storage = :git

                file = File.new(@@path, "r") 

                @@data  = YAML.load(File.read(@@path))
                @@data
        end


	def self.data
		return @@data
	end

	def self.fetch

	end

	def self.push

	end


  def self.method_missing(method, *args)
          return @@data["#{method}"]
  end
	


end




class HashWithDots < Hash

	def method_missing(method, *args)

		return self[:"#{method}"]
	end
end
