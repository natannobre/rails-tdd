require 'student'
require 'course'

describe 'Stub' do
  it '#bar' do
    # setup
    student = Student.new

    # verify
    expect(student).to receive(:bar)

    # exercise
    student.bar
  end
end