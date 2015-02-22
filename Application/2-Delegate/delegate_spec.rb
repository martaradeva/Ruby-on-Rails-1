# optional_spec.rb
require "./delegate.rb"

describe 'Module#delegate' do

  context 'passes Genadi\'s test' do
    before (:each) do
      User = Struct.new(:first_name, :last_name)

      class Invoce
        delegate :fist_name, :last_name, to: :'@user'

        def initialize(user)
          @user = user
        end
      end
    end

    let(:user) { User.new 'Genadi', 'Samokovarov' }
    let(:invoice) { Invoce.new(user) }

    it 'class instance responds to new methods' do
      expect(invoice.respond_to? :first_name).to eq(true)
      expect(invoice.respond_to? :last_name).to eq(true)
    end

    it 'can delegate accessors to class' do
      # puts invoice.methods.inspect
      expect(invoice.first_name).to eq("Genadi")
      expect(invoice.last_name ).to eq("Samokovarov")
    end

    it 'other test' do
      expect(invoice.respond_to? first_name).to eq(true)
      expect(invoice.respond_to? last_name).to eq(true)
    end
  end
end

