require './main'

RSpec.describe 'Main' do
  it '#foo test 1' do
    expect(foo(2, 'hello')).to eq('olleh')
  end

  it '#foo test 2' do
    expect(foo(2, 'hhCS')).to eq(16)
  end
end
