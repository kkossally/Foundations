class Bootcamp
  def initialize(name, slogan, student_capacity)
    @name = name
    @slogan = slogan
    @student_capacity = student_capacity
    @teachers = []
    @students = []
    @grades = Hash.new { |hash, k| hash[k] = [] }
  end

  def name
    @name
  end

  def slogan
    @slogan
  end
  
  def teachers
    @teachers
  end

  def students
    @students
  end

  def hire(teacher)
    @teachers << teacher
  end

  def enroll(student)
    if students.length < @student_capacity
        @students << student
        return true
    end
    false
  end

  def enrolled?(student)
    @students.include?(student)
  end

  def student_to_teacher_ratio
    @students.length / @teachers.length
  end

  def add_grade(student, grade)
    if enrolled?(student) # OR if self.enrolled?(student)
        @grades[student] << grade
        return true
    else
        return false
    end
  end

  def num_grades(student)
    @grades[student].length
  end

  def average_grade(student)
    return nil if num_grades(student) == 0 || !enrolled?(student)
    # OR return nil if num_grades(student) == 0 || !self.enrolled?(student)
       
    @grades[student].sum / num_grades(student)
  end

end