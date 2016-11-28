require 'rails_helper'

RSpec.shared_examples 'acts as seoable' do
  let(:model) { described_class }
  let(:class_name_as_sym) { model.to_s.underscore.to_sym }
  let(:model_instance) { build(class_name_as_sym) }

  describe 'validations' do
    it { expect(build(class_name_as_sym, slug: nil)).to be_valid }
  end

  describe '#slug' do
    it { expect(model_instance).to respond_to(:slug) }
  end
end
