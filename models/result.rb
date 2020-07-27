require './configs/redis_initializer'

module Models
  class Result
    attr_accessor :user_name, :tasks_count, :correct_answers_count, :duration
    attr_reader :duration_average

    def initialize(user_name, tasks_count, correct_answers_count, duration)
      @user_name = user_name
      @tasks_count = tasks_count
      @correct_answers_count = correct_answers_count
      @duration = duration
      @duration_average = duration / tasks_count
    end

    def attributes
      self.instance_variables.each_with_object({}) do |var, hash|
        hash[var.to_s.delete("@")] = self.instance_variable_get(var)
      end
    end

    def save
      REDIS.set(SecureRandom.uuid, self.attributes.to_json)
    end

    def self.fetch_all
      REDIS.keys('*').map { |e| JSON.parse(REDIS.get(e)) }
    end
  end
end