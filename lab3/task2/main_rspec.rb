require './main'

RSpec.describe 'Main' do
  it 'foo test 1' do
    allow_any_instance_of(Kernel).to receive(:gets).and_return('19','-1')
    foo
    File.read('results.txt').split("\n").each do |e|
      expect(e).to eq("Никитина Василиса 19")
    end
    File.delete('results.txt')
  end
end

