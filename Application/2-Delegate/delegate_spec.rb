# optional_spec.rb
require "./delegate.rb"

describe 'Module#delegate' do

  context 'passes Genadi\'s test' do
    before (:each) do
      User = Struct.new(:first_name, :last_name)

      class Invoce < Struct.new(:user)
        delegate :first_name, :last_name, to: :'user'

        # def initialize(user)      # if this initialize method is present then
        #   @user = User            # invoice = Invoce.new(user) initiates
        # end                       # invoice with user = nil

      end
    end

    let(:user) { User.new 'Genadi', 'Samokovarov' }
    let(:invoice) { Invoce.new(user) }

    it 'class instance responds to new methods' do
      expect(invoice.first_name).to eq("Genadi")
      expect(invoice.last_name ).to eq("Samokovarov")
    end

  end
end

