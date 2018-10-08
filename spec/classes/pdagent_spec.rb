require 'spec_helper'

describe 'pdagent' do
  on_supported_os.each do |os, os_facts|
    context "on #{os}" do
      let(:facts) { 
        os_facts 
      }

      context "class pdagent with default parameters" do
        it { is_expected.to compile.with_all_deps }

        it { is_expected.to contain_class('pdagent::repos') }
        it { is_expected.to contain_class('pdagent::install') }
        it { is_expected.to contain_class('pdagent::service') }
      end

    end
  end
end
