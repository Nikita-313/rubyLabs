require './main'

RSpec.describe 'Main' do
  it '#foo test 1' do
    expect(foo(2, 'hello')).to eq('olleh')
  end

  it '#foo test 2' do
    expect(foo(2, 'hhCS')).to eq(16)
  end

  it '#create_pokemons test 1' do
    allow_any_instance_of(Kernel).to receive(:gets).and_return(2,"Lvysaur","blue","Charmander","orange")
    expect(create_pokemons).to eq([{"name"=>"Lvysaur", "color"=>"blue"}, {"name"=>"Charmander", "color"=>"orange"}])
  end
end
