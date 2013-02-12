require 'spec_helper'

describe User do
  it { should have_many(:circles) }
  it { should have_many(:teammates).through(:circles) }
end