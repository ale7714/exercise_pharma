class VolunteersController < ApplicationController

  def new
  end

  def create
    sql = build_sql(params)
    if send_to_hospitial(sql)
      render :thank_you
    else
      render :new
    end
  end

  # I think this could be done on a generic page
  # so it can be reuse
  def thank_you
  end

  private

  def build_sql(params)
    "insert into volunteers (first_name, last_name, phone_number, insurance_carrier, medical_id), values(#{params['first_name']}, #{params['last_name']}, #{params['phone_number']}, #{params['insurance_carrier']}, #{params['medical_id']})"
  end

  def send_to_hospitial(sql)
     Rails.logger.debug(sql)
     File.open('output.sql', 'a+t') do | file |
       puts sql
     end
     true
  end
end
