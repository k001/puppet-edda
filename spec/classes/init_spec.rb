require 'spec_helper'
describe 'edda' do

  context 'with defaults for all parameters' do
    it { should contain_class('edda') }
  end
end
