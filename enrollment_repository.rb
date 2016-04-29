require 'pry'
require_relative '../lib/data_manager'

class EnrollmentRepository
  attr_reader :data, :enrollments

  def load_data(data)
    data_manager = DataManager.new
    data_manager.load_data(data)
    populate_repo(data_manager.create_enrollments)
  end

  def populate_repo(raw_enrollments)
    @enrollments = raw_enrollments.each_with_object({}) do |enrollment, object|
      object[enrollment.name] = enrollment
    end
  end

  def find_by_name(name)
    @enrollments[name.upcase]
  end

end
