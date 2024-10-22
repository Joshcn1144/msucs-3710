require "test_helper"

class StudentTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  # 1
  test "should raise error when saving student without first name" do
    assert_raises ActiveRecord::RecordInvalid do
        Student.create!(last_name: "Lincoln", school_email: "abe@msudenver.edu", major: "CS")
    end
 end
  # 2 
  test "should raise error when saving student without last name" do
    assert_raises ActiveRecord::RecordInvalid do
        Student.create!(first_name: "Nikola", school_email: "jokic@msudenver.edu", major: "CS")
    end
 end
 # 3
 test "should not allow duplicate school_email" do
  # This retrieves the student with the key 'one' from students.yml
  student = students(:one)

  assert_raises ActiveRecord::RecordInvalid do
    Student.create!(first_name: "Run", last_name: "Time", school_email: "rtime@msudenver.edu", major: "CSI")
  end
end
#4
test "should raise error when saving student without email" do
  assert_raises ActiveRecord::RecordInvalid do
      Student.create!(first_name: "Nikola", last_name: "Jokic", major: "CS")
  end
end
#5
test "should raise error when saving student without major" do
  assert_raises ActiveRecord::RecordInvalid do
      Student.create!(first_name: "Nikola", last_name: "Jokic", school_email: "jokic@msudenver.edu")
  end
end
#6
test "should raise error when saving student" do
  assert_raises ActiveRecord::RecordInvalid do
      Student.save!(first_name: "Nikola", last_name: "Jokic", school_email: "jokic@msudenver.edu", major: "CS")
  end
end
#7
test "should raise error when updating students last name" do
  assert_raises ActiveRecord::RecordInvalid do
      Student.update!(first_name: "Nikola", last_name: "NONE", school_email: "jokic@msudenver.edu", major: "CS")
  end 
end
#8
test "should raise error when updating student" do
  assert_raises ActiveRecord::RecordInvalid do
      Student.update!(first_name: "Nikola", last_name: "Jokic", school_email: "jokic@msudenver.edu", major: "CS")
  end
end

end
