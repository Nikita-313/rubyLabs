require './main'

RSpec.describe 'Main' do

  it '#index test' do
    expect(index).to eq(["Петр Петров 21\n", "Греков Даниил 20\n"])
  end

  it '#find test' do
    expect(find(1)).to eq("Петр Петров 21\n")
  end

  it '#where test' do
    expect(where("21")).to eq("Петр Петров 21\n")
  end

  it '#update test' do
    update(1, "Никита")
    expect(find(1)).to eq("Никита\n")
    update(1, "Петр Петров 21\n")
  end

  it '#delete test' do
    delete(1)
    expect(index).to eq(["Греков Даниил 20\n"])
    update(1, "Петр Петров 21\n")
    update(1, "Греков Даниил 20\n")
  end
end