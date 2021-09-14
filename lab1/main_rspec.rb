require './main'

RSpec.describe 'Main' do
  @first_name = 'Nikita'
  @surname = 'Serikov'

  it '#foobar test 1' do
    expect(foobar(10, 20)).to eq(20)
  end

  it '#foobar test 2' do
    expect(foobar(5, 10)).to eq(15)
  end

  it '#foobar test 3' do
    expect(foobar(20, 10)).to eq(10)
  end

  it '#greeting test 1' do
    expect(greeting(@first_name, @surname, 18)).to eq("Привет, #{@first_name} #{@surname}. Самое время заняться делом!")
  end

  it '#greeting test 2' do
    expect(greeting(@first_name, @surname, 17)).to eq("Привет, #{@first_name} #{@surname}. Тебе меньше 18 лет, но начать учиться программировать никогда не рано")
  end
end
