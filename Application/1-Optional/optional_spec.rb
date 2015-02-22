# optional_spec.rb

describe 'Optional#value' do

  context 'with valid arguments' do
    let(:answer) { Optional.new(42)  }

    it 'is valid' do
      expect(answer.value).to eq(42)
    end

    it 'can chain a valid method' do
      expect(answer.to_s.value).to eq("42")
    end

    it 'can chain multiple valid methods' do
      expect(answer.to_s.length.value).to eq(2)
    end

    it 'throws NoMethodError when an invalid method is called' do
      flag = true
      begin 
        answer.trololol.value
      rescue NoMethodError 
        flag = false
      end
      expect(flag).to eq (false)
    end
  end

  context 'with nil as argument' do
    let(:lack_of_answer) { Optional.new(nil) }  

    it 'returns nil when no method is chained' do
      expect(lack_of_answer.value).to eq(nil)
    end

    it 'returns nil when a valid method is chained' do
      expect(lack_of_answer.length.value).to eq(nil)
    end

    it 'returns nil when an invalid method is chained' do
      expect(lack_of_answer.trololol.value).to eq(nil)
    end
  end
end
