require 'pry'
require_relative '../lib/clean_data'

class Enrollment
  include CleanData

  attr_reader :name, :kindergarten_participation, :high_school_graduation

  def initialize(data)
    @name                       = data[:name].upcase
    @kindergarten_participation = clean_data(data[:kindergarten_participation])
    @high_school_graduation     = clean_data(data[:high_school_graduation])
  end

  def kindergarten_participation_by_year
    kindergarten_participation
  end

  def kindergarten_participation_in_year(year)
    if kindergarten_participation.has_key?(year)
      kindergarten_participation.fetch(year)
    end
  end

  def kd_participation_avg_all_yrs
    compute_avg(kindergarten_participation.values)
  end

  def graduation_rate_by_year
    high_school_graduation
  end

  def graduation_avg_all_years
    compute_avg(high_school_graduation.values)
  end

  def compute_avg(array)
    array.reduce(:+) / array.count
  end

  def graduation_rate_in_year(year)
    high_school_graduation.fetch(year) if high_school_graduation.has_key?(year)
  end

end
