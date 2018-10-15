require "pry"

class Member
	def initialize (full_name, introduce)
		@full_name = full_name
		@introduce = introduce
	end 

	def get_name
		@full_name
	end 

	def get_introduce
		@introduce
	end 
end


class Student < Member
	def initialize (full_name, reason)
		@full_name = full_name
		@introduce = reason
	end 

end 

class Instructor < Member

	def initialize (full_name, bio)
		@full_name = full_name
		@introduce = bio
		@skill_set = Array.new
	end 

	def add_skill(strin)
		return @skill_set.push(strin)
	end  

	def get_skills
		return @skill_set.join(", ")
	end 
end 

class Workshop
	def initialize (date, classroom)
		@date = date
		@classroom = classroom
		@g_instructors = Array.new
		@g_students = Array.new
	end 

	def add_participant (member)
		if member.class == Student
			return @g_students.push(member)
		elsif member.class == Instructor
			return @g_instructors.push(member)
		else
		end 
	end 

	def print_details
		i = 1
		j = 1
		puts "Workshop - #{@date} - Classroom: #{@classroom}"
		puts " "
		puts "Students"
		# @g_students.each { |st| print "#{i}. #{st.get_name} - #{st.get_introduce}"}
		@g_students.length.times do |i|
			puts "#{i+1}. #{@g_students[i].get_name} - #{@g_students[i].get_introduce}"
		end	

		puts "Instructors"
		@g_instructors.length.times do |i|
			puts "#{i+1}. #{@g_instructors[i].get_name} - #{@g_instructors[i].get_skills}"
			puts "   #{@g_instructors[i].get_introduce}"
		end	
		return 
	end 
				
end 


# Workshop - 12/03/2014 - Classroom: CR6
#
# Students
# 1. Jane Doe - I am trying to learn programming and need some help
# 2. Lena Smith - I am really excited about learning to program!
#
# Instructors
# 1. Vicky Ruby - HTML, JavaScript
#    I want to help people learn coding.
# 2. Nicole McMillan - Ruby
#    I have been programming for 5 years in Ruby and want to spread the love



workshop = Workshop.new("12/03/2014", "Shutl")
jane = Student.new("Jane Doe", "I am trying to learn programming and need some help")
lena = Student.new("Lena Smith", "I am really excited about learning to program!")
vicky = Instructor.new("Vicky Ruby", "I want to help people learn coding.")
vicky.add_skill("HTML")
vicky.add_skill("JavaScript")
nicole = Instructor.new("Nicole McMillan", "I have been programming for 5 years in Ruby and want to spread the love")
nicole.add_skill("Ruby")

workshop.add_participant(jane)
workshop.add_participant(lena)
workshop.add_participant(vicky)
workshop.add_participant(nicole)
workshop.print_details

# binding.pry

# puts "end code"