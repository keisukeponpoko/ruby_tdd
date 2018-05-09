
require_relative '../../metapro/introspection.rb'

describe Greeting do
  let(:greeting) { Greeting.new(text) }

  describe '#initialize' do
    let(:text) { 'Hello' }
    it '初期化' do
      expect(greeting.welcome).to eq 'Hello'
      p greeting.class
      p greeting.class.instance_methods(false)
      p greeting.instance_variables
    end
  end
end
