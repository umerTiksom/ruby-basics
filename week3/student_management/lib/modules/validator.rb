module Validator
  def valid_name?(name)
    !name.strip.empty?
  end

  def valid_age?(age)
    age.between?(5, 100)
  end

  def valid_marks?(marks)
    marks.between?(0, 100)
  end

  def valid_salary?(salary)
    salary > 0
  end
end
