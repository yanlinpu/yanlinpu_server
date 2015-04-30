module Yanlinpu
  class User
    attr_accessor :name, :email, :age
    def initialize(options)
      %w(name email age).each do |key|
        self.send("#{key}=", options[key.to_sym])
      end
    end
    class << self
      def sing(song='tell me why')
        "I can sing #{song}"
      end
    end
    def myself
      "My name is #{@name} and My email is #{@email} and I'm #{@age} years old"
    end
  end
end
