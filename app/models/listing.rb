class Listing < ActiveRecord::Base
  # checks to see if there is a description value present in the description field when the form is submitted
  # this validation will show a error is the description filed does not have a value prestent
  # this will not allow a blank description field to be submitted
  validates_presence_of :description
end