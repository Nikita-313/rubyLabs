require './main'

RSpec.describe 'Main' do
  it '#third_task' do
    allow_any_instance_of(Kernel).to receive(:gets).and_return("d", "100", "w", "50","b","q")
    balance = File.read('balance.txt').chomp.to_f
    expect(balance).to eq(100.0)
    allow_any_instance_of(Kernel).to receive(:gets).and_return("w", "50","q")
  end
end