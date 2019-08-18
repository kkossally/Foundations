require "employee"

class Startup
    attr_reader :name, :funding, :salaries, :employees

    def initialize(name, funding, salaries)
        @name = name
        @funding = funding
        @salaries = salaries
        @employees = []
    end

    def valid_title?(title)
        @salaries.key?(title)
    end

    def >(competitor)
        self.funding > competitor.funding
    end

    def hire(employee_name, title)
        if valid_title?(title)
            @employees << Employee.new(employee_name, title)
        else
            raise "title is invalid"
        end
    end

    def size
        @employees.length
    end

    def pay_employee(employee)
        pay_check = @salaries[employee.title]
        if @funding >= pay_check
            employee.pay(pay_check)
            @funding -= pay_check
        else
            raise "not enough funding"
        end
    end

    def payday
        @employees.each { |employee| pay_employee(employee) }
    end

    def average_salary
        sum = 0
        @employees.each { |employee| sum += @salaries[employee.title] }
        sum / @employees.length
    end

    def close
        @employees = []
        @funding = 0
    end

    def acquire(competitor)
        @funding += competitor.funding

        competitor.salaries.each do |title, salary|
            if !self.salaries.key?(title)
                @salaries[title] = salary
            end
        end

        @employees += competitor.employees

        competitor.close
    end
end