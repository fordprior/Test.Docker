
module Patient
	class PatientDetails
		attr_accessor :patient_name
		attr_accessor :patient_history
		
		def initialize
			@history = []
		end

	class << self
		def from_json(string)
			json = MultiJson.load(string)

			model = new

			model.name = json['PatientName']
			
			patient_history = json['PatientHistory']
			unless patient_history.nil? || patient_history.empty?
			    patient_history.each do |term|
			    	model.patient_history.push(PatientHistory.from_json_hash(patient_history))
			    end
			end
			
			model
		end
	end
end


	class PatientHistory
	        # Detail record in the collection.
	          attr_accessor :condition_name
	          attr_accessor :start_date
	          attr_accessor :end_date
	end

    class << self
      def from_json_hash(hash)
        # Creates a new instance based off of Hash parsed from a json collection result.
        #
        # @param hash [Hash] The parsed values from the collection record.
        #
        # @return [PatientHistory]
        model = new

        model.condition_name = hash['ConditionName']
        model.start_date = hash['StartDate']
        model.end_date = hash['EndDate']

        model
      end
  end
end
