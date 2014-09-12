require 'rails_helper'

describe User do
  it { should validate_presence_of :email }
  it { should have_many :stories }
  it { should have_many :comments }

end
