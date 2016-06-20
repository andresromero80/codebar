class Member
  def initialize(full_name)
    @full_name = full_name
  end

  def introduce
    puts "Hi, my name is #{self.full_name}. Nice to meet you!"
  end
end

class Student < Member
  def initialize(reason)
    @reason = reason
  end
end

class Instructor < Member
  def initialize(bio, skills)
    @bio = bio
    @skills = skills
  end

  def add_skill(skill)
    self.skills.push(skill)
  end
end

class Workshop
  def initialize(date, classroom, instructors=[], students=[])
    @date = date
    @classroom = classroom
    @instructors = instructors
    @students = students
  end

  def add_participant(participant)
    if participant.class == "Student"
    elsif participant.class == "Instructor"
    else
      puts "Error: You must submit a participant that is a Student or Instructor."
    end
  end

  def print_details
    puts "Workshop - #{self.date} - Classroom: #{self.classroom}"
    puts "\n"
    puts "Students"

    self.students.each_with_index do |student, index|
      puts "#{index}. #{student.full_name} - #{student.reason}"
    end

    self.instructors.each_with_index do |instructor, index|
      puts "#{index}. #{instructor.full_name} - #{instructor.skills}"
      puts "\t#{instructor.bio}"
    end
  end
end
