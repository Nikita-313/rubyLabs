require './CashMachine'

RSpec.describe 'Main' do
  it '#CashMachine test' do
    allow_any_instance_of(Kernel).to receive(:gets).and_return("d", "100", "w", "50","b","q")
    CashMachine.new.init
    balance = File.read('balance.txt').chomp.to_f
    expect(balance).to eq(150.0)
    allow_any_instance_of(Kernel).to receive(:gets).and_return("w","50","q")
    CashMachine.new.init
  end
end
