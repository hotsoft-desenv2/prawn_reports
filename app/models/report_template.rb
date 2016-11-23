require 'yaml'

class ReportTemplate < ActiveRecord::Base
  belongs_to :ac_filter_def

  has_many :filters, :through => :ac_filter_def, :source => :ac_filters


  def serialization_params=(value)
    if value.is_a? Hash
      value = Marshal.dump(value)
    end
    write_attribute :serialization_params, value
  end

  def serialization_params
    value = read_attribute :serialization_params
    #value.nil? ? {} : Marshal.load(value)
    begin
      value.nil? ? {} : Marshal.load(value)
      #value.nil? ? {} : YAML.load(value)
    rescue TypeError

    end
  end

end
