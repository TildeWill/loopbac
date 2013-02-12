require 'spec_helper'

describe Circle do
  it { should have_many(:users) }
  it { should validate_presence_of(:name) }
end