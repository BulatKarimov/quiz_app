module Models
  class User
    attr_accessor :name, :age, :tasks

    def initialize(name, age, tasks: [])
      @name = name
      @age = age
      @tasks = tasks
    end

    def start_test
      self.tasks.each_with_index do |task, i|
        puts "#{i}) #{task.first_num} #{task.operation} #{task.last_num} = ?"
        task.answer = gets.chomp.to_i
      end
    end
  end
end