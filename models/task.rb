module Models
  class Task
    attr_accessor :answer
    attr_reader :first_num, :last_num, :correct_answer, :operation

    def initialize
      @last_num = rand(1..10)
      @first_num = @last_num * rand(1..10)
      @operation = random_operation
      @answer
      @correct_answer = correct_answer
    end

    def correct?
      @correct_answer == @answer
    end

    private

    def correct_answer
      case @operation
      when '+' then @first_num + @last_num
      when '-' then @first_num - @last_num
      when '*' then @first_num * @last_num
      when '/' then @first_num / @last_num
      end
    end

    def random_operation
      case rand(0..3)
      when 0 then '+'
      when 1 then '-'
      when 2 then '*'
      when 3 then '/'
      end
    end
  end
end