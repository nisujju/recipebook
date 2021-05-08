require 'rails_helper'

RSpec.describe Recipe, type: :model do
  let(:recipe) { FactoryBot.build(:recipe)}

  before do
    recipe
  end

  describe 'validation' do
    it 'should be valid' do
      expect(recipe).to be_valid
    end

    it 'should be invalid with no contentful_id' do
      recipe.contentful_id = nil
      expect(recipe).to be_invalid
    end
  end

  describe '.client' do
  	let :params do
       {access_token: ENV['ACCESS_TOKEN'], space: ENV['SPACE_ID']}
    end

    let :klass do
      Class.new(Contentful::Client)
    end

    context 'with correct credentials' do
      before do
      	obj = klass.new(params)
        allow(Contentful::Client).to receive(:new).with(params) {obj}
      end

      it 'should give the contentful client' do
        obj = Recipe.client
        expect(obj).to be_kind_of(Contentful::Client)
      end
    end

    context 'with wrong credentials' do
      before do
        allow(Contentful::Client).to receive(:new).with(params) {}
      end

      it 'should return nil' do
        expect(Recipe).to receive(:client).and_return(nil)
        Recipe.client
      end
    end
  end

  describe '.model_entries' do

    let :contentful_client do
      Contentful::Client.new({access_token: ENV['ACCESS_TOKEN'], space: ENV['SPACE_ID']})
    end

    let :entries do
      Array.new(10) { Contentful::Entry }
    end

  	before do
      allow(Recipe).to receive(:client).and_return(contentful_client)
      allow(contentful_client).to receive(:entries).and_return(entries)
    end

    it 'should call client' do
      expect(Recipe).to receive(:model_entries).and_return(entries)
      Recipe.model_entries
    end
  end
end
